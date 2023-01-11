import 'package:flutter/material.dart';
import 'package:shop_app_mvvm_getx_besia/core/utils/constance.dart';

import 'custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  final String imagePath;
  final String text;
  final Function()? onPressed ;

  const CustomButtonSocial({
    super.key,
    required this.imagePath,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(15),
        foregroundColor: primaryColor,
        side: BorderSide(width: 1.0, color: Colors.grey.shade300),

      ),
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          Image.asset(imagePath),
          const SizedBox(
            width: 60,
          ),
          CustomText(
            text: text,
          )
        ],
      ),
    );
  }
}
