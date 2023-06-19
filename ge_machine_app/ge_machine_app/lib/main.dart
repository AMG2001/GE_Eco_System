import 'package:flutter/material.dart';
import 'package:ge_machine_app/controllers/bluetooth_controller.dart';
import 'package:ge_machine_app/services/operations_box.dart';
import 'package:get/get.dart';
import 'package:ge_machine_app/screens/home_page/home_page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await OperationsBox.instance.init_OperationsBox();
  runApp(GEMachineApp());
}

class GEMachineApp extends StatelessWidget {
  GEMachineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: "GE Machine App",
      debugShowCheckedModeBanner: false,
      home: CustomSplachScreen(),
    );
  }
}

class CustomSplachScreen extends StatelessWidget {
  const CustomSplachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BluetoothController>(
          init: BluetoothController(),
          builder: (controller) {
            return Container(
              color: Colors.red,
              height: double.infinity,
              width: double.infinity,
              child: AnimatedSplashScreen(
                splashIconSize: double.infinity,
                splash: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.recycling_rounded,
                      size: 148,
                      color: Colors.green,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Green Egypt",
                      style:
                          TextStyle(fontSize: 64, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                duration: 2000,
                nextScreen: HomePage(),
              ),
            );
          }),
    );
  }
}
