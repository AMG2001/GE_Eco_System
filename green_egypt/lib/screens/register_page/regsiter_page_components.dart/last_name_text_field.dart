import 'package:flutter/material.dart';

class LastNameTF extends StatelessWidget {
  const LastNameTF({
    Key? key,
    required this.lastNameController,
  }) : super(key: key);

  final TextEditingController lastNameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Last Name",
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
            controller: lastNameController,
            decoration: InputDecoration(
                hintText: "enter last name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                )),
          ),
        )
      ],
    );
  }
}

