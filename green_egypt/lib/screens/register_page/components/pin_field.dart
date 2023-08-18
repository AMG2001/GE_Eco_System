import 'package:flutter/material.dart';

class PinField extends StatelessWidget {
  PinField({super.key, required this.isLastPin});
  bool isLastPin = false;
  late int pin_value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: 52,
      child: TextFormField(
        maxLength: 1,
        textAlign: TextAlign.center,
        onChanged: (value) {
          if (value!.length == 1) {
            pin_value = int.tryParse(value)!;
            isLastPin
                ? FocusScope.of(context).unfocus()
                : FocusScope.of(context).nextFocus();
          }
        },
        autofocus: true,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(counterText: ""),
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
