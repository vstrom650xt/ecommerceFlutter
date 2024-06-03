import 'dart:convert';

import '../../constant/baseurls.dart';
import '../../model/Category.dart';
import 'package:http/http.dart' as http;

class ApiCategory {
  Future<List<Category>> fetchCategories() async {
    final response =
        await http.get(Uri.parse('${BaseUrls.BASEURLAPI}categories/all'));

    if (response.statusCode == 200) {
       List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));

    //  final List<dynamic> data = json.decode(utf8.decode(response.bodyBytes))['body'];

      List<Category> categories =
          data.map((json) => Category.fromJson(json)).toList();
      return categories;
    } else {
      throw Exception('Failed to load categories');
    }
  }
}

// final List result = json.decode(utf8.decode(response.bodyBytes))['body'];