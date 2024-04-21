import 'package:flutter/material.dart';

import '../../constant/AppColors.dart';
import '../../constant/baseurls.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: AppColors.MIDNIGHTGREEN,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [

          const Expanded(
            child: Text.rich(
              TextSpan(
                style: TextStyle(color: Colors.white),
                children: [
                  TextSpan(text: "A Summer Surprise\n"),
                  TextSpan(
                    text: "Cashback 20%",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Image.network(
            '${BaseUrls.IMGURLS}corporativa/cascos.jpg',
            width: 150,
            height: 80,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
