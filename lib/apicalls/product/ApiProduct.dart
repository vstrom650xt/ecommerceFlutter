import 'dart:convert';

import '../../constant/baseurls.dart';
import 'package:http/http.dart' as http;

import '../../model/Product.dart';

class ApiProduct {
  Future<List<Product>> fetchProductsBrench() async {
    final response =
    await http.get(Uri.parse(BaseUrls.BASEURLAPI + 'products/allBrench'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));

      List<Product> productBrench = [];

      for (Map<String, dynamic> productData in data) {
        if (productData['marca'] != null) {
          Product product = Product.withMarca(marca: productData['marca']);
          productBrench.add(product);
        }
      }

      return productBrench;
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<List<Product>> fetchMostSoldProducts() async {
    final response = await http.get(Uri.parse(BaseUrls.BASEURLAPI + 'products/getMostSold'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));

    //  print(data);
      List<Product> mostSoldProducts = [];
      for (Map<String, dynamic> productData in data) {
          Product product = Product.fromJson(productData);
          mostSoldProducts.add(product);

      }
      return mostSoldProducts;
    } else {
      throw Exception('Failed to load most sold products');
    }
  }


  Future<List<Product>> allProducts() async {
    final response = await http.get(Uri.parse(BaseUrls.BASEURLAPI + 'products/all'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));

      List<Product> mostSoldProducts = [];
      for (Map<String, dynamic> productData in data) {
        Product product = Product.fromJson(productData);
        mostSoldProducts.add(product);
      }
      return mostSoldProducts;
    } else {
      throw Exception('Failed to load most sold products');
    }
  }

  Future<List<Product>> fetchProductsByCategory(String categoryId) async {
    final response = await http.get(Uri.parse(BaseUrls.BASEURLAPI + 'products/getProductByCategory/$categoryId'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));

      List<Product> products = [];

      for (Map<String, dynamic> productData in data) {
        Product product = Product.fromJson(productData);
        products.add(product);
      }

      return products;
    } else {
      throw Exception('Failed to load products by category');
    }
  }

  Future<List<Product>> fetchProductsByBrand(String brand) async {
    final response = await http.get(Uri.parse(BaseUrls.BASEURLAPI + 'products/getProductByBrand/$brand'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));

      List<Product> products = [];

      for (Map<String, dynamic> productData in data) {
        Product product = Product.fromJson(productData);
        products.add(product);
      }

      return products;
    } else {
      throw Exception('Failed to load products by brand');
    }
  }




}

