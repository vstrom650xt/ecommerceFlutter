import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class Alert {
  bool showalert = true;

  Widget customAlert(BuildContext context, Function(bool) setStateCallback) {
    return Scaffold(
      body: showalert
          ? GFFloatingWidget(
        child: GFAlert(
          title: 'Welcome!',
          content:
          'Get Flutter is one of the largest Flutter open-source UI library for mobile or web apps with  1000+ pre-built reusable widgets.',
          bottombar: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              GFButton(
                onPressed: () {
                  setStateCallback(false);
                },
                shape: GFButtonShape.pills,
                child: Text('Skip', style: TextStyle(color: Colors.black)),
              ),
              SizedBox(width: 5),
              GFButton(
                onPressed: () {
                  // Ocultar la alerta al presionar el botón "Learn More"
                  setStateCallback(false);
                },
                shape: GFButtonShape.pills,
                icon: Icon(Icons.keyboard_arrow_right),
                position: GFPosition.end,
                text: 'Learn More',
              ),
            ],
          ),
        ),
      )
          : Text('Body or any kind of widget here..'), // Si showalert es falso, muestra el cuerpo de la página en lugar de la alerta
    );
  }
}
