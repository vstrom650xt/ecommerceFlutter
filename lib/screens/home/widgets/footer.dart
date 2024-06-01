import 'package:ecommerce/constant/AppColors.dart';
import 'package:flutter/material.dart';

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
              textSize: _getTextSize(context),
            ),
            Divider(),
            FooterItem(
              icon: Icons.assignment_return,
              text: 'Devoluciones gratuitas y sustitución en 24h.',
              iconSize: 50,
              textSize: _getTextSize(context),
            ),
            Divider(),
            FooterItem(
              icon: Icons.search,
              text: 'Recibe tu pedido en 24 horas.',
              iconSize: 50,
              textSize: _getTextSize(context),
            ),
          ],
        ),
      ),
    );
  }

  double _getTextSize(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return deviceWidth * 0.035;
  }
}

class FooterItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final double iconSize;
  final double textSize;

  const FooterItem({
    required this.icon,
    required this.text,
    required this.iconSize,
    required this.textSize,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          Text(
            text,
            style: TextStyle(fontSize: textSize),
          ),
        ],
      ),
    );
  }
}
