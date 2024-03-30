import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constant/baseurls.dart';

class ApiUser {
  Future<List<Map<String, dynamic>>> fetchUsers() async {
    try {
      final response =
      await http.get(Uri.parse(BaseUrls.BASEURLAPI + 'users/all'));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        List<Map<String, dynamic>> users =
        data.map((user) => user as Map<String, dynamic>).toList();
        return users;
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      print('Error fetching users: $e');
      throw e; // Re-throw the exception to handle it outside of this class
    }
  }
}
