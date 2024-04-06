import 'package:ecommerce/constant/AppColors.dart';
import 'package:flutter/material.dart';

class dialogo extends StatelessWidget {
  final String textoSuperior;
  final String textInferior;

  const dialogo(
      {super.key, required this.textoSuperior, required this.textInferior});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(textoSuperior,
      style: const TextStyle(
        color: AppColors.MIDNIGHTGREEN
      ),),
      content: Text(textInferior),
      backgroundColor: AppColors.WHITE,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Cerrar',
            style: TextStyle(color: AppColors.MIDNIGHTGREEN),
          ),
        ),
      ],
    );
  }
}
