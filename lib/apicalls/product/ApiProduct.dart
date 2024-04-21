import 'dart:convert';

import '../../constant/baseurls.dart';
import 'package:http/http.dart' as http;

import '../../model/Product.dart';

class ApiProduct {
  Future<List<Product>> fetchProductsBrench() async {
    final response =
    await http.get(Uri.parse(BaseUrls.BASEURLAPI + 'products/allBrench'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

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
}

