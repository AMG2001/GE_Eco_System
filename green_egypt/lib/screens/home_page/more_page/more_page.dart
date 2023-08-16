import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/theme/application_theme_controller_box.dart';
import 'package:green_egypt/screens/home_page/more_page/more_page_components/application_theme_option.dart';
import 'package:green_egypt/screens/home_page/more_page/more_page_components/green_egypt_machines_option.dart';
import 'package:green_egypt/screens/home_page/more_page/more_page_components/green_egypt_support_divider.dart';
import 'package:green_egypt/screens/home_page/more_page/more_page_components/help_option.dart';
import 'package:green_egypt/screens/home_page/more_page/more_page_components/language_option.dart';
import 'package:green_egypt/screens/home_page/more_page/more_page_components/logout_option.dart';
import 'package:green_egypt/screens/home_page/more_page/more_page_components/more_page_header.dart';
import 'package:green_egypt/screens/home_page/more_page/more_page_components/send_feedback_option.dart';
import 'package:green_egypt/screens/home_page/more_page/more_page_components/transaction_option.dart';
import 'package:green_egypt/screens/home_page/more_page/more_page_components/user_support_divider.dart';

class MorePageBody extends StatelessWidget {
  const MorePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApplicationThemeController>(builder: (themeController) {
      return Scaffold(
          body: SafeArea(
        child: SizedBox(
          width: Dimensions.width,
          height: Dimensions.height,
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: Dimensions.height * .02,
              ),
              /**
                       * ************************************ More page Header *******************************
                       */
              const MorePageHeader(),
              SizedBox(
                height: Dimensions.height * .03,
              ),
              /**
                       * ************************************** Green Egypt Support ****************************
                       */
              GreenEgyptSupportDivider(
                  applicationThemeController: themeController),

              /**
                           * ************************************* Transactions History option **********************************
                           */
              const GetCash(),
              /**
                           * *************************************** Green Egypt Machines Locations option *************************
                           */
              const GreenEgyptMachinesOption(),
              /**
                       * **************************** Help Option ***************************
                       */
              const HelpOption(),
              /**
                       * ************************** User Support divider *****************************
                       */
              UserSupportDivider(applicationThemeController: themeController),
              /**
                       * ****************************** Language Option ******************************
                       */
              LanguageOption(applicationThemeController: themeController),
              /**
                       * **************************** Application theme Option *****************************
                       */
              ApplicationThemeOption(
                  applicationThemeController: themeController,
                  darkThemeBool: themeController.isDark),
              /**
                           * ****************************** Send Feedback Option *************************
                           */
              const SendFeedbackOption(),
              /**
                       * ********************************** Logout option *************************
                       */
              LogoutOption(applicationThemeController: themeController)
            ],
          ),
        ),
      ));
    });
  }
}
