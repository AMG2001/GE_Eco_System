import 'package:flutter/material.dart';
import 'package:ge_machine_app/controllers/bluetooth_controller.dart';
import 'package:ge_machine_app/services/operations_box.dart';
import 'package:get/get.dart';
import 'package:ge_machine_app/screens/home_page/home_page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(GEMachineApp());
}

class GEMachineApp extends StatelessWidget {
  GEMachineApp({super.key});

  @override
  Widget build(BuildContext context) {
    OperationsBox.instance.init_OperationsBox();
    return GetBuilder<BluetoothController>(
        init: BluetoothController(),
        builder: (controller) {
          return GetMaterialApp(
            title: "GE Machine App",
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          );
        });
  }
}
