import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/config/theme/default_colors.dart';
import 'package:green_egypt/screens/register_page/components/pin_field.dart';
import 'package:green_egypt/services/custom_toast.dart';
import 'package:green_egypt/services/email_otp_verification.dart';
import 'package:green_egypt/services/firebase_services/firebase_services.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RegisterPageController extends GetxController {
  var validationMode = AutovalidateMode.disabled;
  bool securePassword = true;
  String userCredintial = "normal_user";
  FaIcon eyeIcon = const FaIcon(FontAwesomeIcons.eyeSlash);
  Color eyeIconColor = Colors.grey;

  SignUpPageController() {
    eyeIcon = FaIcon(
      FontAwesomeIcons.eyeSlash,
      color: eyeIconColor,
    );
  }

  void chageUserCredintial(String newCategory) {
    userCredintial = newCategory;
    update();
  }

  void changeShowPasswordValue() {
    securePassword = !securePassword;
    if (securePassword == true) {
      eyeIconColor = Colors.grey;
      eyeIcon = FaIcon(
        FontAwesomeIcons.eyeSlash,
        color: eyeIconColor,
      );
    } else {
      eyeIconColor = DefaultColors.defaultGreen;
      eyeIcon = FaIcon(
        FontAwesomeIcons.eye,
        color: eyeIconColor,
      );
    }

    update();
  }

  void changeValidationMode() {
    /**
     * Keep tracking user input and validate it immediatly !! 🔥🤍
     */
    validationMode = AutovalidateMode.onUserInteraction;
    update();
  }

  Future<void> registerNewUser(
      {required BuildContext context,
      required TextEditingController emailController,
      required TextEditingController passwordController,
      required String userCredintial,
      required TextEditingController firstNameController,
      required TextEditingController lastNameController,
      required TextEditingController userNumberController}) async {
    try {
      /**
       * Show loading Indicator
       */
      showDialog(
          context: context,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          });
      /**
           * Regsiter New User 
           */
      FirebaseCustomServices.instance
          .registerNewUser(
              email: emailController.text,
              password: passwordController.text,
              firstName: firstNameController.text,
              lastName: lastNameController.text,
              phoneNumber: userNumberController.text,
              credintial: userCredintial)
          .then((value) {
        /**
                     * Remove loading indicator
                     */
        Get.back();
        /**
                * Show animted success vector
                */
        // TODO : show success animation .
        showDialog(
            context: context,
            builder: (context) {
              Future.delayed(const Duration(seconds: 3), () {
                /**
                        * Remove Success Animation
                        */
                Get.back();
                /**
                         * Navigate to Home Screen 
                         */
                Get.offAllNamed(PagesNames.homePage);
              });
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Lottie.asset(
                    'assets/animated_vectors/register_done_animation.json',
                    repeat: false),
              );
            });
      });
    } on FirebaseAuthException {}
  }

  /**
   *   await registerPageController.registerNewUser(
                                  userCredintial: userCredintial,
                                  context: context,
                                  emailController: emailController,
                                  passwordController: passwordController,
                                  firstNameController: firstNameController,
                                  lastNameController: lastNameController,
                                  userNumberController: userNumberController);
   */
  void showOTPSheet({
    required BuildContext context,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController firstNameController,
    required TextEditingController lastNameController,
    required TextEditingController userNumberController,
    required String userCredintial,
  }) {
    List<PinField> pinFields = [
      PinField(isLastPin: false),
      PinField(isLastPin: false),
      PinField(isLastPin: false),
      PinField(isLastPin: false),
      PinField(isLastPin: false),
      PinField(isLastPin: true),
    ];

    showModalBottomSheet(
      isDismissible: false,
      backgroundColor: Colors.black,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return FittedBox(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                padding: EdgeInsets.all(24),
                width: Device.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      width: Device.width * .25,
                      decoration: BoxDecoration(
                          color: DefaultColors.defaultGreen,
                          borderRadius: BorderRadius.circular(50)),
                      height: 8,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Verification Code",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Text(
                      "Please type the verification code sent to ${emailController.text}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: pinFields,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          String otp = "";
                          pinFields.forEach((element) {
                            otp += element.pin_value.toString();
                          });
                          EmailOTPVerification.instance
                              .validateOTP(userInputtedOTP: otp)
                              .then((value) async {
                            if (value == true) {
                              CustomToast.showGreenToast(
                                  messsage: 'Entered OTP is valid ✅ : $otp');
                              await registerNewUser(
                                  userCredintial: userCredintial,
                                  context: context,
                                  emailController: emailController,
                                  passwordController: passwordController,
                                  firstNameController: firstNameController,
                                  lastNameController: lastNameController,
                                  userNumberController: userNumberController);
                            } else {
                              CustomToast.showRedToast(
                                  messsage: 'Entered OTP is not valid !!');
                            }
                          });
                        },
                        child: Text("Verify and Continue"))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
