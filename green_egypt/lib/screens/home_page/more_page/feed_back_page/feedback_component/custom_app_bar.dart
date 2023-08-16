import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/constants.dart';
import 'package:green_egypt/config/theme/default_colors.dart';
import 'package:green_egypt/screens/home_page/more_page/feed_back_page/feedback_component/rounded_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RoundedButton(
          icon: const Icon(Icons.arrow_back),
          iconColor: DefaultColors.kPrimaryColor,
          bgColor: Colors.white,
          tap: () {
            Get.back();
          },
        ),
        const SizedBox(width: Constants.kDefaultPadding),
        Text(
          'Feedback!'.tr,
          style: const TextStyle(color: Colors.white, fontSize: 24),
        )
      ],
    );
  }
}
