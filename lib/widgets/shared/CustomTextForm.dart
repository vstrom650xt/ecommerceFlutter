import 'package:flutter/material.dart';
import '../../constant/AppColors.dart';

class CustomTextForm extends StatelessWidget {
  final String text;
  final IconData iconData;
  final bool obscureText;
  final TextEditingController controller;
  final String label;
  final String tooltipText;

  const CustomTextForm({
    super.key,
    required this.text,
    required this.iconData,
    required this.obscureText,
    required this.controller,
    required this.label,
    required this.tooltipText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Tooltip(
          message: tooltipText,
          child: Icon(
            iconData,
            color: AppColors.PERSIMON,
          ),
        ),
        hintText: text,
        labelText: label,
      ),
      onChanged: (value) {},
    );
  }
}
