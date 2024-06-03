import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryDropdown extends StatefulWidget {
  final Function(String) onCategorySelected;
  const CategoryDropdown({Key? key, required this.onCategorySelected}) : super(key: key);

  @override
  _CategoryDropdownState createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  String? _selectedCategory;
  bool _loading = true;
  late QuerySnapshot _querySnapshot;

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    try {
      final QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('categories').get();
      if (querySnapshot.docs.isNotEmpty) {
        setState(() {
          _selectedCategory = querySnapshot.docs.first.id; // Primer documento como valor predeterminado
          _loading = false;
          _querySnapshot = querySnapshot;
        });
      }
    } catch (error) {
      print('Error loading categories: $error');
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
      value: _selectedCategory,
      items: _querySnapshot.docs.map<DropdownMenuItem<String>>((doc) {
        final id = doc.id;
        final name = doc['name'] as String;
        return DropdownMenuItem<String>(
          value: id,
          child: Text('$id ($name)'),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedCategory = newValue;
        });
        widget.onCategorySelected(newValue!);
      },
    );
  }
}
