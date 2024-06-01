import 'package:flutter/material.dart';
import 'package:ecommerce/constant/AppColors.dart';
import 'package:ecommerce/model/Product.dart';
import '../../../model/Cart.dart';

class ProductDetails extends StatefulWidget {
  final Product product;

  const ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int _quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: Image.network(
                          widget.product.url,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              },
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 3.0, right: 3.0),
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(widget.product.url),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                widget.product.nombre,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 5),
            Center(
              child: Text(
                '€${widget.product.precio}',
                style: const TextStyle(fontSize: 20, color: AppColors.PERSIMON),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'Descripción:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 5),
            Center(
              child: Text(
                widget.product.descripcion,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  color: AppColors.PERSIMON,
                  onPressed: () {
                    setState(() {
                      _quantity = (_quantity - 1).clamp(0, double.infinity).toInt();
                    });
                  },
                ),
                Text(
                  '$_quantity',
                  style: const TextStyle(fontSize: 20),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  color: AppColors.PERSIMON,
                  onPressed: () {
                    setState(() {
                      _quantity++;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  for (int i = 0; i < _quantity; i++) {
                    Cart.instance.addToCart(widget.product);
                  }
                  print(Cart.instance.toString());
                  // Lógica para añadir al carrito aquí
                },
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 16),
                  foregroundColor: Colors.black,
                  backgroundColor: AppColors.PERSIMON,
                ),
                child: const Text('Añadir al carrito'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
