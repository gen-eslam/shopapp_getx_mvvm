import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_mvvm_getx_besia/view/widgets/custom_text.dart';

import '../../core/utils/constance.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? fontSize;
  final Function()? onPressed;

  const CustomTextButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.textColor,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: primaryColor,
        ),
        child: CustomText(
          text: text,
          color: textColor!,
          fontSize: fontSize!,
        ));
  }
}
