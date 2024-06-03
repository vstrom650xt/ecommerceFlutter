import 'package:flutter/material.dart';
import 'package:ecommerce/constant/AppColors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              text: AppLocalizations.of(context)!.send,
              iconSize: 50,
            ),
            Divider(),
            FooterItem(
              icon: Icons.assignment_return,
              text: AppLocalizations.of(context)!.returned,
              iconSize: 50,
            ),
            Divider(),
            FooterItem(
              icon: Icons.search,
              text:  AppLocalizations.of(context)!.deliver,
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
