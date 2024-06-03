import 'package:ecommerce/constant/AppColors.dart';
import 'package:flutter/material.dart';

import '../../../model/Cart.dart';

class IconBtnWithCounter extends StatelessWidget {
   IconBtnWithCounter({
    Key? key,
    required this.icon,
    required this.press, required int numOfitem,
  }) : super(key: key);

  final IconData icon;
  final GestureTapCallback press;
  final int numOfItems = Cart.instance.getTotalItems();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: press,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            height: 46,
            width: 46,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 24,
              color: AppColors.PERSIMON,
            ),
          ),
          if (numOfItems != 0)
            Positioned(
              top: -3,
              right: 0,
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: AppColors.YELLOWGREEN,
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: AppColors.WHITE),
                ),
                child: Center(
                  child: Text(
                    "$numOfItems",
                    style: const TextStyle(
                      fontSize: 12,
                      height: 1,
                      fontWeight: FontWeight.w600,
                      color: AppColors.WHITE,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
