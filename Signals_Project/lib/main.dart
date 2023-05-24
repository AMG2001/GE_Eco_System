import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signals_app/dimensions.dart';
import 'package:signals_app/features/bluetooth_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: Colors.red,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    BluetoothController.instance.initiateConnection();
    return Scaffold(
      appBar: AppBar(
        title: Text("Signals App"),
        centerTitle: true,
      ),
      body: Container(
        height: DeviceDimensions.height,
        width: DeviceDimensions.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('choose signal :'),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
                onPressed: () {
                  /**
                   * 2 : mean this message is from camera
                   * 1 : mean open plastic hole .
                   * 0 : mean there is no cans .
                   */
                  BluetoothController.instance.sendMessage(message: '"1,1,0,"');
                },
                child: Text("Send Plastic signal")),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
                onPressed: () {
                  /**
                   * 2 : mean this message is from camera
                   * 0 : mean there is no plastic .
                   * 1 : mean open cans hole .
                   */
                  BluetoothController.instance.sendMessage(message: '"1,0,1,"');
                },
                child: Text("Send Cans signal")),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
                onPressed: () {
                  /**
                   * 2 : mean this message is from camera
                   * 0 : mean there is no plastic .
                   * 1 : mean open cans hole .
                   */
                  BluetoothController.instance.sendMessage(message: '"1,1,1,"');
                },
                child: Text("Send Both Plastic & Cans signal")),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
                onPressed: () {
                  BluetoothController.instance.connectToCameraBluetoothModule();
                },
                child: Text("Connect with aurdino"))
          ],
        ),
      ),
    );
  }
}
