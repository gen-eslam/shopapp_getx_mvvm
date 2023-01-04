import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final String hint;
  final Function(String?)? onSave;
  final String? Function(String?)? validator;


  CustomTextFormField({
    required this.text,
    required this.hint,
     this.onSave ,
     this.validator ,
});

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
        children: [
          CustomText(text: "Email",fontSize: 14,color: Colors.grey.shade900,),
          TextFormField(
            onSaved: onSave,
            validator: validator,
            decoration: InputDecoration(
                hintText: 'gen_eslam2002@gmail.com',
                hintStyle: TextStyle(color: Colors.black),
                fillColor: Colors.white
            ),
          ),
        ],
      ),
    );
  }
}
