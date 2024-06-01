import 'package:flutter/material.dart';
import 'package:ecommerce/screens/home/widgets/home_header.dart';
import 'package:ecommerce/screens/product/widgets/Banner_product_details.dart';
import 'package:ecommerce/screens/product/widgets/product_detail.dart';
import 'package:ecommerce/model/Product.dart';
import 'package:ecommerce/responsive/ResponsiveWidget.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HomeHeader(),
      ),
      body: ResponsiveWidget(
        largeScreen: Row(
          children: [
            const Expanded(
              child: Banner_product_details(),
            ),
            Expanded(
              flex: 3,
              child: ProductDetails(product: product),
            ),
            const Expanded(
              child: Banner_product_details(),
            ),
          ],
        ),
        mediumScreen: Row(
          children: [
            const Expanded(
              child: Banner_product_details(),
            ),
            Expanded(
              flex: 4,
              child: ProductDetails(product: product),
            ),
            const Expanded(
              child: Banner_product_details(),
            ),
          ],
        ),
        smallScreen: Row(
          children: [
            Expanded(
              flex: 6,
              child: ProductDetails(product: product),
            ),
          ],
        ),
      ),
    );
  }
}
