import 'package:flutter/material.dart';
import 'package:ecommerce/constant/AppColors.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.ALABASTER,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FooterItem(
              icon: Icons.delivery_dining_sharp,
              text: 'Envio gratuito en pedidos superiores a 150€.',
              iconSize: 50,
            ),
            Divider(),
            FooterItem(
              icon: Icons.assignment_return,
              text: 'Devoluciones gratuitas y sustitución en 24h.',
              iconSize: 50,
            ),
            Divider(),
            FooterItem(
              icon: Icons.search,
              text: 'Recibe tu pedido en 24 horas.',
              iconSize: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class FooterItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final double iconSize;

  const FooterItem({
    required this.icon,
    required this.text,
    required this.iconSize,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double scaleFactor = deviceWidth > 600 ? 0.05 : 0.03; // Tamaño de escala ajustable

    double fontSize = deviceWidth * scaleFactor;
    fontSize = fontSize.clamp(10.0, 20.0); // Limitar el tamaño de fuente entre 10 y 20

    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: iconSize,
            color: AppColors.PERSIMON,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              text,
              style: TextStyle(fontSize: fontSize),
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
            ),
          ),
        ],
      ),
    );
  }
}
