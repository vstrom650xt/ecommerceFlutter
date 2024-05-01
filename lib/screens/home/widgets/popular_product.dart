import 'package:flutter/material.dart';
import '../../../apicalls/product/ApiProduct.dart';
import '../../../model/Product.dart';

import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(
            title: "Popular Products",
            press: () {
              Navigator.pushNamed(context, ''); // Añade la ruta adecuada cuando se presiona el título
            },
          ),
        ),
        FutureBuilder<List<Product>>(
          future: ApiProduct().fetchMostSoldProducts(),
          builder: (context, snapshot) {
            print(snapshot);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<Product> mostSoldProducts = snapshot.data!;
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: mostSoldProducts.map((product) {
                    return ProductCard(product: product);
                  }).toList(),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    // Aquí puedes construir el widget que representa cada producto
    return Container(
      margin: EdgeInsets.all(10),
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // Cambia la posición de la sombra
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Aquí puedes colocar la representación visual de tu producto
          Text(product.nombre),
          Text('\$${product.precio}'),
          // Otros detalles del producto...
        ],
      ),
    );
  }
}
