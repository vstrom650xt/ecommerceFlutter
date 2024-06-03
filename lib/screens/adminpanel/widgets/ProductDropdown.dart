import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductDropdown extends StatefulWidget {
  final Function(String) onCategorySelected;
  const ProductDropdown({Key? key, required this.onCategorySelected}) : super(key: key);

  @override
  _CategoryDropdownState createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<ProductDropdown> {
  String? _selectedProduct;
  bool _loading = true;
  late QuerySnapshot _querySnapshot;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    try {
      final QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('productos').get();
      if (querySnapshot.docs.isNotEmpty) {
        setState(() {
          _selectedProduct = querySnapshot.docs.first.id; // Primer documento como valor predeterminado
          _loading = false;
          _querySnapshot = querySnapshot;
        });
      }
    } catch (error) {
      print('Error loading products: $error');
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return CircularProgressIndicator();
    }
    return DropdownButton<String>(
      value: _selectedProduct,
      items: _querySnapshot.docs.map<DropdownMenuItem<String>>((doc) {
        final id = doc.id;
        final name = doc['nombre'] as String;
        final price = doc['precio'] as double;
        return DropdownMenuItem<String>(
          value: id,
          child: Text('$name (\$$price)'),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedProduct = newValue;
        });
        widget.onCategorySelected(newValue!);
      },
    );
  }
}
