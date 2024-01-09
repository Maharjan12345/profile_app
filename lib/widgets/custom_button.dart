import 'package:flutter/material.dart';

class CustomBlueButton extends StatelessWidget {
  const CustomBlueButton(
      {super.key,
      required this.textData,
      required this.onPressed,
      this.textColor = Colors.red});
  final String textData;
  final Function() onPressed;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(
          textData,
          style: TextStyle(color: textColor),
        ));
  }
}
