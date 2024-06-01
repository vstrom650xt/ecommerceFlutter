import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../apicalls/product/ProductProvider.dart';


class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, productProvider, child) {
        return ListView.builder(
          itemCount: productProvider.products.length,
          itemBuilder: (context, index) {
            final product = productProvider.products[index];
            return ListTile(
              title: Text(product.nombre),
              subtitle: Text(product.descripcion),
              leading: Image.network(product.url),
              trailing: Text('\$${product.precio.toString()}'),
            );
          },
        );
      },
    );
  }
}
