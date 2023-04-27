import 'package:flutter/material.dart';
import 'package:ge_machine_app/features/bluetooth_controller.dart';
import 'package:get/get.dart';
import 'package:ge_machine_app/screens/home_page/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GEMachineApp());
}

class GEMachineApp extends StatelessWidget {
  final blueController = Get.put(BluetoothController(), permanent: true);

  GEMachineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: "GE Machine App",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
