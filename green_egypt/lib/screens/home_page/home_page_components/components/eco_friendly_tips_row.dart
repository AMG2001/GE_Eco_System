import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/custom_scrollable_sheet.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/theme/application_theme_controller_box.dart';
import 'package:green_egypt/config/theme/default_colors.dart';
import 'package:green_egypt/config/theme/default_fonts.dart';
import 'package:green_egypt/screens/home_page/home_page_components/components/eco_friendly_full_tips.dart';
import 'package:green_egypt/screens/home_page/home_page_components/controller/home_page_animations_controller.dart';

class EcoFriendlyTipsRow extends StatelessWidget {
  const EcoFriendlyTipsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageAnimationsController>(
        init: HomePageAnimationsController(),
        builder: (controller) {
          return AnimatedOpacity(
            duration: const Duration(seconds: 1),
            opacity: controller.itemOpacity,
            child: SizedBox(
              width: Dimensions.width,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Eco-friendly tips'.tr,
                          style: TextStyle(
                              fontFamily: DefaultFonts.defaultLondrinaSolidThin,
                              fontSize: 22),
                        ),
                        TextButton(
                          onPressed: () {
                            CustomDraggableScrollableSheet()
                                .showCustomDraggableScrollableSheet(
                                    initialSize: .45,
                                    minSize: .45,
                                    maxSize: .72,
                                    sheetBackgroundColor:
                                        ApplicationThemeController
                                                .instance.isDark
                                            ? Colors.black
                                            : const Color(0xfffefefc),
                                    context: context,
                                    child: EcoFriendlyFullTips());
                          },
                          child: Text(
                            'View All'.tr,
                            style: TextStyle(
                                color: DefaultColors.defaultGreen,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
