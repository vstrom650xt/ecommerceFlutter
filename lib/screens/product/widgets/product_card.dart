import 'package:ecommerce/constant/AppColors.dart';
import 'package:flutter/material.dart';

import '../../../model/Product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product,
    required this.onPress,
  }) : super(key: key);

  final double width, aspectRetio;
  final Product product;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: GestureDetector(
        onTap: onPress,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.02,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.PERSIMON.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.network(
                    product.url,
                    fit: BoxFit.cover,
                  ),
                  //   child: Image.asset(product.images[0]),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.nombre,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "€${product.precio}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.PERSIMON,
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
