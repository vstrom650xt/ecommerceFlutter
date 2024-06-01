import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../apicalls/product/ProductProvider.dart';
import '../../../constant/AppColors.dart';

class SearchField extends StatefulWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final _searchController = TextEditingController();

  void _performSearch(String query) {
    // Call the search function from the provider
    context.read<ProductProvider>().searchProducts(query);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        controller: _searchController,
        onChanged: (value) {
          // Perform search on text change
          _performSearch(value);
        },
        decoration: const InputDecoration(
          filled: true,
          fillColor: AppColors.ALABASTER,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          border: searchOutlineInputBorder,
          focusedBorder: searchOutlineInputBorder,
          enabledBorder: searchOutlineInputBorder,
          hintText: "Search product",
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}

const searchOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);
