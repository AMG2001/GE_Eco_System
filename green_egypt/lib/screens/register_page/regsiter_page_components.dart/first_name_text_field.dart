import 'package:flutter/material.dart';

class FirstNameTF extends StatelessWidget {
  const FirstNameTF({
    Key? key,
    required this.firstNameController,
  }) : super(key: key);

  final TextEditingController firstNameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "First Name",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .01,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .425,
          child: TextFormField(
            validator: (value) {
              if (value == "" || value == null) {
                return "You can't leave it empty";
              }
              return null;
            },
            controller: firstNameController,
            decoration: InputDecoration(
                hintText: "enter first name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                )),
          ),
        )
      ],
    );
  }
}
