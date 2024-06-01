import 'package:ecommerce/constant/baseurls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Banner_product_details extends StatelessWidget {
  const Banner_product_details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Image.network(
          '${BaseUrls.IMGURLS}banners/APP2.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}