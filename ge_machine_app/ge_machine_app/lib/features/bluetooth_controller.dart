import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:ge_machine_app/features/console_messages.dart';
import 'package:ge_machine_app/features/custom_toast.dart';
import 'package:ge_machine_app/screens/home_page/home_page.dart';
import 'package:ge_machine_app/screens/items_page/items_page.dart';
import 'package:get/get.dart';

class BluetoothController extends GetxController {
  late int _pageIndex;
  late int plastic_items;
  late int cans_items;
  late int points;
  BluetoothController() {
    _pageIndex = 0;
    resetItems();
    ConsoleMessage.printMessage("Platic value in init : $plastic_items");
    ConsoleMessage.printMessage("Page index = $_pageIndex");
    initiateConnection();
  }

  void increamentPlastic() {
    plastic_items++;
    ConsoleMessage.printMessage("Platic value in increament : $plastic_items");
    update();
  }

  void increamentCans() {
    cans_items++;
    update();
  }

  void resetItems() {
    plastic_items = 0;
    cans_items = 0;
    points = 0;
    update();
  }

  void navigateToItemsPage() {
    Get.to(() => ItemsPage(),
        transition: Transition.downToUp,
        curve: Curves.easeInOutCubic,
        duration: Duration(milliseconds: 500));

    _pageIndex++;
    ConsoleMessage.printMessage("Page index = $_pageIndex");
    update();
  }

  void navigateToHomePage() {
    _pageIndex = 0;
    resetItems();
    Get.offAll(() => HomePage(),
        transition: Transition.leftToRight,
        curve: Curves.easeInCubic,
        duration: Duration(milliseconds: 500));
    ConsoleMessage.printMessage("Page index = $_pageIndex");
    update();
  }

  late BluetoothDevice arduniDevice;

  String comingData = "";

  String macAddress_tablet = "0C:2F:B0:FE:ED:23";
  String macAddress_camera = "F4:63:1F:D0:03:4E";
  String macAddress_arduino_camera = "00:21:09:00:4F:8C";
  String macAddress_arduino_screen = "00:21:09:00:4D:35";

  late BluetoothConnection connection;

  void initiateConnection() async {
    ConsoleMessage.printMessage('bluetooth connection intialized');
    bool? isEnabled = await FlutterBluetoothSerial.instance.isEnabled;
    if (isEnabled!) {
      // get all bonded devices on tablet .
      var bondedDevices =
          await FlutterBluetoothSerial.instance.getBondedDevices();
      for (int i = 0; i < bondedDevices.length; i++) {
        if (bondedDevices[i].address == macAddress_arduino_screen) {
          arduniDevice = bondedDevices[i];
          break;
        }
      }
      print('is camera connected : ${arduniDevice.isConnected}');
    } else {
      await FlutterBluetoothSerial.instance.requestEnable();
    }
    if (!arduniDevice.isConnected) {
      await connectToScreenBluetoothModule();
    }
  }

  Future<void> connectToScreenBluetoothModule() async {
    try {
      /**
       * to connect with bluetooth module .
       */
      connection =
          await BluetoothConnection.toAddress(macAddress_arduino_screen);
    } catch (e) {
      ConsoleMessage.printError(
          'error while connecting to Aurdino Screen', e.toString());
    }
    if (connection.isConnected) {
      CustomToast.showBlackToast(
          message: 'Screen connected with Aurdino successfully');
      await startListeningToBluetoothStream();
    } else {
      CustomToast.showRedToast(
          message: 'there is a problem while connecting with Aurdino Screen');
    }
  }

  List<int> messageToBytes(String str) {
    return str.codeUnits.map((codeUnit) => codeUnit & 0xff).toList();
  }

  Future<void> startListeningToBluetoothStream() async {
    try {
      ConsoleMessage.printMessage('start listening to Aurdino');
      connection.input!.listen((Uint8List data) {
        _pageIndex == 0 ? navigateToItemsPage() : null;
        try {
          String comingMessage = utf8.decode(data);

          if (int.parse(comingMessage[3]) == 1 &&
              int.parse(comingMessage[5]) == 1) {
            increamentPlastic();
            increamentCans();
          } else if (int.parse(comingMessage[3]) == 1) {
            increamentPlastic();
          } else if (int.parse(comingMessage[3]) == 1) {
            increamentCans();
          }
        } catch (e) {
          ConsoleMessage.printError(e, 'decoded data is empty');
        }
        /**
         * Coming message must end with '.'
         * to print coming message only 1 time .
         */
        // if(data[data.last]==46){
        // ConsoleMessage.printMessage('${ascii.decode(data)}');
        // },
        ConsoleMessage.printMessage('${ascii.decode(data)}');
      });
    } catch (e) {
      ConsoleMessage.printError(
          'error while listening to camera', e.toString());
      CustomToast.showRedToast(message: e.toString());
    }
  }

  void sendMessage({required String message}) async {
    message = message + "\n";
    var data = ascii.encode(message);
    try {
      connection.output.add(data); // Sending data
    } catch (e) {
      ConsoleMessage.printError(
          'error while sending message to camera', e.toString());
    }
  }

  void closeConnection() {
    connection.close();
  }
}
