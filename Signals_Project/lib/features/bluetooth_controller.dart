import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:signals_app/features/console_messages.dart';
import 'package:signals_app/features/custom_toast.dart';

class BluetoothController {
  BluetoothController._privateConstructor();

  static final BluetoothController _instance =
      BluetoothController._privateConstructor();

  static BluetoothController get instance => _instance;

  late BluetoothDevice arduniDevice;

  String comingData = "";

  String macAddress_tablet = "0C:2F:B0:FE:ED:23";
  String macAddress_camera = "F4:63:1F:D0:03:4E";
  String macAddress_arduino_camera = "00:21:09:00:4F:8C";
  String macAddress_arduino_screen = "00:21:09:00:4D:35";

  late BluetoothConnection connection;

  void initiateConnection() async {
    bool? isEnabled = await FlutterBluetoothSerial.instance.isEnabled;
    if (isEnabled!) {
      // get all bonded devices on tablet .
      var bondedDevices =
          await FlutterBluetoothSerial.instance.getBondedDevices();
      for (int i = 0; i < bondedDevices.length; i++) {
        if (bondedDevices[i].address == macAddress_arduino_camera) {
          arduniDevice = bondedDevices[i];
          break;
        }
      }
      print('is camera connected : ${arduniDevice.isConnected}');
    } else {
      await FlutterBluetoothSerial.instance.requestEnable();
    }
    if (!arduniDevice.isConnected) {
      await connectToCameraBluetoothModule();
    }
  }

  Future<void> connectToCameraBluetoothModule() async {
    try {
      /**
       * to connect with bluetooth module .
       */
      connection = await BluetoothConnection.toAddress(macAddress_arduino_camera);
    } catch (e) {
      ConsoleMessage.printError(
          'error while connecting to Aurdino', e.toString());
    }
    if (connection.isConnected) {
      CustomToast.showBlackToast(
          message: 'Camera connected with Aurdino successfully');
      await startListeningToBluetoothStream();
    } else {
      CustomToast.showRedToast(
          message: 'there is a problem while connecting with Aurdino');
    }
  }

  List<int> messageToBytes(String str) {
    return str.codeUnits.map((codeUnit) => codeUnit & 0xff).toList();
  }

  Future<void> startListeningToBluetoothStream() async {
    try {
      ConsoleMessage.printMessage('start listening to Aurdino');
      connection.input!.listen((Uint8List data) {
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
