import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:green_egypt/screens/register_page/controller/register_page_controller.dart';
import 'package:green_egypt/services/custom_toast.dart';
import 'package:green_egypt/services/email_otp_verification.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUpButton extends StatelessWidget {
  final registerPageController = Get.put(RegisterPageController());
  SignUpButton(
      {Key? key,
      required this.sigUpFormState,
      required this.emailController,
      required this.passwordController,
      required this.firstNameController,
      required this.lastNameController,
      required this.userNumberController,
      required this.userCredintial})
      : super(key: key);

  final GlobalKey<FormState> sigUpFormState;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController userNumberController;
  final String userCredintial;
  Widget widgetOnButton = const Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text("Register now"),
      SizedBox(
        width: 10,
      ),
      FaIcon(
        FontAwesomeIcons.arrowRight,
        size: 16,
      )
    ],
  );
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: StatefulBuilder(
          builder: (context, setState) {
            return ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green)),
              child: widgetOnButton,
              onPressed: () async {
                setState(() {
                  // change the UI of the Regsiter button
                  widgetOnButton = Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Transform.scale(
                        scale: .5,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  );
                  // send otp request .
                  if (sigUpFormState.currentState!.validate() &&
                      userCredintial != "") {
                    EmailOTPVerification.instance
                        .sendEmail(email: emailController.text)
                        .then(
                          (value) => registerPageController.showOTPSheet(
                              context: context,
                              userNumberController: userNumberController,
                              emailController: emailController,
                              firstNameController: firstNameController,
                              lastNameController: lastNameController,
                              passwordController: passwordController,
                              userCredintial: userCredintial),
                        );
                  } else {
                    CustomToast.showBlackToast(
                        messsage:
                            "user credintial = ${registerPageController.userCredintial}");
                    CustomToast.showRedToast(messsage: "error in validation");
                  }
                });
              },
            );
          },
        ));
  }
}
