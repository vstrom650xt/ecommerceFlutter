import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(
          horizontal: 15, vertical: 15),
      child: GFBorder(
        color: Color(0xFF19CA4B),
        dashedLine: [2, 0],
        type: GFBorderType.rect,
        child: Image.asset(
          'assets image here',
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
