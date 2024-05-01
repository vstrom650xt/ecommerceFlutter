import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constant/AppColors.dart';
import '../../screens/sigin/controller/ControllerSignIn.dart';

class CustomButton extends StatelessWidget {
  final List<TextEditingController> listTextEditingController;
  final String text;
  final VoidCallback onTap;

  const CustomButton({
    Key? key,
    required this.listTextEditingController,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: AppColors.MIDNIGHTGREEN,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            text, // Texto del botón
            style: const TextStyle(
              color: Colors.white, // Color del texto
              fontSize: 16.0, // Tamaño del texto
            ),
          ),
        ),
      ),
    );
  }
}
