import 'package:flutter/material.dart';
import '../../constant/AppColors.dart';

class CustomTitle extends StatelessWidget {
  final String text;

  const CustomTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 28,
        fontFamily: 'Sans Serif',
        color: AppColors.MIDNIGHTGREEN,
      ),
    );
  }
}
