import 'package:flutter/material.dart';
import '../../constant/AppColors.dart';

class CustomTextForm extends StatelessWidget {
  final String text;
  final IconData iconData;
  final bool obscureText;
  final TextEditingController controller;

  const CustomTextForm({
    Key? key,
    required this.text,
    required this.iconData,
    required this.obscureText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(
          iconData,
          color: AppColors.PERSIMON,
        ),
        hintText: text,
      ),
      onChanged: (value) {},
    );
  }
}
