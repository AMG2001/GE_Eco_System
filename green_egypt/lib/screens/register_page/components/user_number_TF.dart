import 'package:flutter/material.dart';
import 'package:green_egypt/screens/register_page/controller/register_page_controller.dart';

class UserNumberTF extends StatelessWidget {
  const UserNumberTF({
    Key? key,
    required this.userNumberController,
    required this.signUpPageController,
  }) : super(key: key);

  final TextEditingController userNumberController;
  final RegisterPageController signUpPageController;

  @override
  Widget build(BuildContext context) {
    // TODO change user number validation
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value!.isEmpty) {
            return "please enter your phone number !!";
          } else if (value.length < 11) {
            return "this is not correct phone number !!";
          }
          return null;
        },
        controller: userNumberController,
        decoration: InputDecoration(
            prefixIcon: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(Icons.call),
            ),
            hintText: "enter your mobile number",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            )),
      ),
    );
  }
}
