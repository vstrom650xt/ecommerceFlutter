import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/Product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  List<Product> _filteredProducts = [];

  List<Product> get products => _filteredProducts;

  Future<void> fetchAllProducts() async {
    final response = await http.get(Uri.parse('http://localhost:8080/api/products/all'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      _products = data.map((json) => Product.fromJson(json)).toList();
      _filteredProducts = _products; // Initially show all products
      notifyListeners();
    } else {
      throw Exception('Failed to load products');
    }
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      _filteredProducts = _products;
    } else {
      _filteredProducts = _products.where((product) {
        return product.nombre.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}
