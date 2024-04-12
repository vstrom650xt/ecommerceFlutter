import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constant/AppColors.dart';
import '../../screens/sigin/ControllerSignIn.dart';

class CustomButton extends StatelessWidget {
  final List<TextEditingController> listTextEditingController;
  final String text;

  const CustomButton({Key? key, required this.listTextEditingController , required String this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ControllerSignIn controllerSignIn = ControllerSignIn();

    return Container(
      width: 200.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: AppColors.MIDNIGHTGREEN,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        onTap: () async {
          controllerSignIn.sigIn(context, listTextEditingController);
        },
        child:  Center(
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
