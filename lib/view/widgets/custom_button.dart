import 'package:flutter/material.dart';

import '../../core/utils/constance.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPress;
  final String text;
  final Color textColor;
  final Alignment textAlignment;
  final double fontSize;
  final double borderRadius;
  final double padding;
  final Color backgroundColor;

  const CustomButton(
      {super.key,
      required this.onPress,
      required this.text,
      this.textColor = Colors.white,
      this.textAlignment = Alignment.center,
      this.fontSize = 16,
      this.borderRadius = 10,
      this.padding = 18,
      this.backgroundColor = primaryColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        padding: MaterialStateProperty.all(EdgeInsets.all(padding)),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
      ),
      child: CustomText(
        text: text,
        alignment: textAlignment,
        color: Colors.white,
        fontSize: fontSize,
      ),
    );
  }
}
