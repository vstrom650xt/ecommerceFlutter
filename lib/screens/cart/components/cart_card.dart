import 'package:ecommerce/screens/cart/components/check_out_card.dart';
import 'package:flutter/material.dart';
import '../../../constant/AppColors.dart';
import '../../../model/Cart.dart';
import '../../../model/Product.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.product,
    required this.quantity,
  }) : super(key: key);

  final Product product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    final double subtotal = product.precio * quantity;

    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              // Aquí puedes mostrar la imagen del producto si lo tienes en el modelo
              child: Image.network(product.url),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.nombre,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
              ),
              const SizedBox(height: 8),
              Text.rich(
                TextSpan(
                  text: "\$${product.precio}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.PERSIMON,
                  ),
                  children: [
                    TextSpan(
                      text: " x $quantity",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Subtotal: \$${subtotal.toStringAsFixed(2)}",
                style: TextStyle(
                  color: AppColors.PERSIMON,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

            ],
          ),
        ),
      ],
    );
  }
}
