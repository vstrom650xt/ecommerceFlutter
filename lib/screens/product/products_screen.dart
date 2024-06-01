import 'package:flutter/material.dart';
import 'package:ecommerce/constant/AppColors.dart';
import 'package:ecommerce/model/Category.dart';
import 'package:ecommerce/screens/home/widgets/home_header.dart';
import 'package:ecommerce/screens/product/product_details_screen.dart';
import 'package:ecommerce/screens/product/widgets/Banner_product_details.dart';
import 'package:ecommerce/screens/product/widgets/product_card.dart';
import 'package:ecommerce/screens/product/widgets/product_detail.dart';
import 'package:ecommerce/model/Product.dart';
import 'package:ecommerce/responsive/ResponsiveWidget.dart';
import 'package:ecommerce/apicalls/product/ApiProduct.dart';

class ProductsScreen extends StatefulWidget {
  final Category? category;
  final String? brand;

  const ProductsScreen({Key? key, required this.category, this.brand});

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late Future<List<Product>> _productsFuture;

  @override
  void initState() {
    super.initState();
    if (widget.category != null) {
      _productsFuture =
          ApiProduct().fetchProductsByCategory(widget.category!.id);
    } else if (widget.brand != null) {
      _productsFuture = ApiProduct().fetchProductsByBrand(widget.brand!);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HomeHeader(),
        backgroundColor: AppColors.WHITE,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: FutureBuilder<List<Product>>(
            future: _productsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                return ResponsiveWidget(
                  largeScreen: GridView.builder(
                    itemCount: snapshot.data!.length +
                        (snapshot.data!.length ~/ 5),
                    gridDelegate:
                    const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 0.7,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 16,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      if (index != 0 && index % 5 == 0) {
                        return Column(
                          children: [
                            const Banner_product_details(),
                            ProductCard(
                              product: snapshot.data![index - index ~/ 5],
                              onPress: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetailsScreen(
                                            product: snapshot
                                                .data![index - index ~/ 5]),
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      } else {
                        return ProductCard(
                          product: snapshot.data![index - (index ~/ 5)],
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailsScreen(
                                    product:
                                    snapshot.data![index - (index ~/ 5)]),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                  mediumScreen: GridView.builder(
                    itemCount: snapshot.data!.length,
                    gridDelegate:
                    const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 0.7,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 16,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return ProductCard(
                        product: snapshot.data![index],
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsScreen(
                                  product: snapshot.data![index]),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  smallScreen: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductCard(
                        product: snapshot.data![index],
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsScreen(
                                  product: snapshot.data![index]),
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              } else {
                return const Center(child: Text('Error de conexión'));
              }
            },
          ),
        ),
      ),
    );
  }
}
