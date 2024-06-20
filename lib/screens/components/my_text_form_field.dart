import 'package:flutter/material.dart';
import 'package:project/constants/app_colors.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final TextInputType? textInputType;
  final String? returnText;
  final Widget? iconButton;
  final bool obscureText;

  const MyTextFormField({
    Key? key,
    this.controller,
    required this.labelText,
    this.textInputType,
    required this.obscureText,
    this.returnText,
    this.iconButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        keyboardType: textInputType,
        decoration: textFieldInputDecoration(),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return returnText;
          }
          return null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }

  InputDecoration textFieldInputDecoration() {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.primaryColor, width: 2.0),
      borderRadius: BorderRadius.circular(25),
    );

    return InputDecoration(
      suffixIcon: iconButton,
      labelText: labelText,
      labelStyle: const TextStyle(color: AppColors.primaryColor),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      errorBorder: outlineInputBorder,
      focusedErrorBorder: outlineInputBorder,
    );
  }
}
