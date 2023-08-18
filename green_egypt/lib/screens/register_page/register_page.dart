import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/theme/default_colors.dart';
import 'package:green_egypt/screens/register_page/controller/register_page_controller.dart';
import 'package:green_egypt/screens/register_page/components/email_text_field.dart';
import 'package:green_egypt/screens/register_page/components/first_name_text_field.dart';
import 'package:green_egypt/screens/register_page/components/last_name_text_field.dart';
import 'package:green_egypt/screens/register_page/components/page_header.dart';
import 'package:green_egypt/screens/register_page/components/password_text_field.dart';
import 'package:green_egypt/screens/register_page/components/sign_up_button.dart';
import 'package:green_egypt/screens/register_page/components/user_category_options.dart';
import 'package:green_egypt/screens/register_page/components/user_number_TF.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final signUpPageController =
      Get.put(RegisterPageController(), permanent: true);

  GlobalKey<FormState> sigUpFormState = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController userNumberController = TextEditingController();

  final int _groupValue = 0;

  String userCategory = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: Dimensions.width,
          height: Dimensions.height,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                /**
                 * main Column
                 */
                child: GetBuilder<RegisterPageController>(
                    init: RegisterPageController(),
                    builder: (controller) {
                      return Form(
                        autovalidateMode: controller.validationMode,
                        key: sigUpFormState,
                        child: SizedBox(
                          width: Dimensions.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                DefaultColors.defaultGreen)),
                                    onPressed: () {
                                      Get.back();
                                    },
                                    icon: Icon(
                                      Icons.arrow_back_sharp,
                                      color: DefaultColors.defaultGreen,
                                      size: 28,
                                    ),
                                  ),
                                ],
                              ),
                              /**
                         * Page Header Widget
                         */
                              const PageHeader(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  /**
                             * First Name TF Column
                             */
                                  FirstNameTF(
                                      firstNameController: firstNameController),
                                  /**
                             * Last Name TF Column
                             */
                                  LastNameTF(
                                      lastNameController: lastNameController),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .02,
                              ),
                              const Text("Email"),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .01,
                              ),
                              /**
                         * Email TF
                         */
                              EmailTF(emailController: emailController),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .02,
                              ),
                              /**
                                 * Password TF
                                 */

                              const Text("Password"),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .01,
                              ),
                              PasswordTF(
                                  passwordController: passwordController,
                                  signUpPageController: signUpPageController),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .02,
                              ),
                              const Text("Mobile Number"),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .02,
                              ),
                              UserNumberTF(
                                  userNumberController: userNumberController,
                                  signUpPageController: signUpPageController),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .02,
                              ),
                              // TODO add user category to user model
                              UserCategoryOptions(groupValue: _groupValue),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .02,
                              ),
                              SignUpButton(
                                userCredintial: controller.userCredintial,
                                sigUpFormState: sigUpFormState,
                                emailController: emailController,
                                passwordController: passwordController,
                                firstNameController: firstNameController,
                                lastNameController: lastNameController,
                                userNumberController: userNumberController,
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
