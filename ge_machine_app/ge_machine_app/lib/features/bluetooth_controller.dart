import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:ge_machine_app/features/console_messages.dart';
import 'package:ge_machine_app/features/custom_toast.dart';
import 'package:get/get.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothController {
  late BluetoothDevice cameraDevice;

  String comingData = "";

  String macAddress_tablet = "0C:2F:B0:FE:ED:23";
  String macAddress_camera = "F4:63:1F:D0:03:4E";
  String macAddress_arduino = "00:21:09:00:4F:8C";

  late BluetoothConnection connection;

  Future<void> initiateConnection() async {
    bool? isEnabled = await FlutterBluetoothSerial.instance.isEnabled;
    if (isEnabled!) {
      // get all bonded devices on tablet .
      var bondedDevices =
          await FlutterBluetoothSerial.instance.getBondedDevices();

      for (int i = 0; i < bondedDevices.length; i++) {
        if (bondedDevices[i].address == macAddress_camera) {
          cameraDevice = bondedDevices[i];
          break;
        }
      }

     print('is camera connected : ${ cameraDevice.isConnected}');
    } else {
      await FlutterBluetoothSerial.instance.requestEnable();
    }
    await connectToCameraBluetoothModule();
  }

  Future<void> connectToCameraBluetoothModule() async {
    try {
      /**
       * to connect with bluetooth module .
       */
      connection = await BluetoothConnection.toAddress(macAddress_camera);
    } catch (e) {
      ConsoleMessage.printError(
          'error while connecting to camera', e.toString());
    }
    if (connection.isConnected) {
      CustomToast.showBlackToast(
          message: 'tablet connected with Camera successfully');
      // await startListeningToBluetoothStream();
      ConsoleMessage.printMessage('tablet connected with Camera successfully');
    } else {
      CustomToast.showRedToast(
          message: 'there is a problem while connecting with Camera');
    }
  }

  Future<void> startListeningToBluetoothStream() async {
    try {
      CustomToast.showBlackToast(message: 'start listening to Camera');
      ConsoleMessage.printMessage('start listening to Camera');
      connection.input!.listen((Uint8List data) {
        CustomToast.showBlackToast(message: '${ascii.decode(data)}');
      });
    } catch (e) {
      ConsoleMessage.printError(
          'error while listening to camera', e.toString());
      CustomToast.showRedToast(message: e.toString());
    }
  }

  void sendDataToTablet({required String message}) async {
    var data = ascii.encode(message);
    try {
      connection.output.add(data); // Sending data
      CustomToast.showBlackToast(message: 'data sent to Camera successfully ✔');
      ConsoleMessage.printMessage('data sent to Camera successfully');
    } catch (e) {
      ConsoleMessage.printError(
          'error while sending message to camera', e.toString());
    }
  }
}
