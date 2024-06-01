import 'package:ecommerce/apicalls/product/ApiProduct.dart';
import 'package:ecommerce/model/Category.dart';
import 'package:ecommerce/screens/product/product_details_screen.dart';
import 'package:ecommerce/screens/product/widgets/product_card.dart';
import 'package:ecommerce/screens/product/widgets/product_detail.dart';
import 'package:flutter/material.dart';

import '../../model/Product.dart';
import '../home/widgets/home_header.dart';

class ProductsScreen extends StatefulWidget {
  final Category? category;
  final String? brand;
  const ProductsScreen({Key? key, required this.category,  this.brand}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late Future<List<Product>> _productsFuture;

  @override
  void initState() {
    super.initState();
    if (widget.category != null) {
      _productsFuture = ApiProduct().fetchProductsByCategory(widget.category!.id);
    } else if (widget.brand != null) {
      _productsFuture = ApiProduct().fetchProductsByBrand(widget.brand!);
    } else {
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HomeHeader(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: FutureBuilder<List<Product>>(
            future: _productsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                return GridView.builder(
                  itemCount: snapshot.data!.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 0.7,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 16,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    Product product = snapshot.data![index];
                    return ProductCard(
                      product: product,
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(product: product),
                          ),
                        );                      },
                    );
                  },
                );
              } else {
                return Center(child: Text('No data available'));
              }
            },
          ),
        ),
      ),
    );
  }
}
