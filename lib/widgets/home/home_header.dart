import 'package:flutter/material.dart';

import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(child: SearchField()),
          const SizedBox(width: 16),
          IconBtnWithCounter(
            press: () => Navigator.pushNamed(context, ''),
            icon: Icons.shopping_cart,
          ),
          const SizedBox(width: 8),
          IconBtnWithCounter(
            numOfitem: 3,
            press: () {},
            icon: Icons.notifications,
          ),
        ],
      ),
    );
  }
}
