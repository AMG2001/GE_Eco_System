import 'dart:async';
import 'package:ge_machine_app/features/bluetooth_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ge_machine_app/screens/home_page/home_page.dart';

class ColumnUnderQrCode extends StatefulWidget {
  const ColumnUnderQrCode({super.key});

  @override
  State<ColumnUnderQrCode> createState() => _ColumnUnderQrCodeState();
}

class _ColumnUnderQrCodeState extends State<ColumnUnderQrCode> {
  @override
  void initState() {
    decreaseCounter();
    super.initState();
  }

  int counter = 60;
  void decreaseCounter() {
    if (counter > 0) {
      Timer(Duration(seconds: 1), () {
        setState(() {
          counter--;
          decreaseCounter();
        });
      });
    } else {
      Get.find<BluetoothController>().navigateToHomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BluetoothController>(builder: (controller) {
      return Column(
        children: [
          TextButton(
            onPressed: () {
              controller.navigateToHomePage();
            },
            child: Row(
              children: [
                Text(
                  "Done",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 8,
                ),
                Icon(
                  Icons.done_all,
                  color: Colors.white,
                )
              ],
            ),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.green)),
          ),
          SizedBox(
            height: 18,
          ),
          Text("Navigating to Home Page After : $counter second")
        ],
      );
    });
  }
}
