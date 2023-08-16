import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/screens/home_page/more_page/settings_page/settings_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SettingsOption extends StatelessWidget {
  const SettingsOption({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 0,
      onTap: () => Get.to(const SettingsPage(), transition: Transition.rightToLeft),
      leading: const Icon(Icons.settings),
      title: const Text("settings"),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 18.sp,
        color: Colors.grey,
      ),
    );
  }
}
