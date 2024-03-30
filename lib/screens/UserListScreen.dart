import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:http/http.dart' as http;

// Asegúrate de importar tu archivo baseurls.dart si aún no lo has hecho.
import 'package:ecommerce/constant/baseurls.dart';

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;
  List<Map<String, dynamic>> _users = [];

  @override
  void initState() {
    super.initState();
    _fetchUsers();
    tabController = TabController(length: 3, vsync: this);
  }

  Future<void> _fetchUsers() async {
    try {
      final response = await http.get(Uri.parse(BaseUrls.BASEURLAPI + 'users/all'));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        setState(() {
          _users = data.map((user) => user as Map<String, dynamic>).toList();
        });
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      print('Error fetching users: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        title: const Text('Lista de Usuarios'),
      ),
      body: _users.isEmpty
          ? Center(
        child: CircularProgressIndicator(),
      )
          : Column(
        children: [
          GFTabBar(
            length: 3,
            controller: tabController,
            tabs: [
              Tab(
                icon: Icon(Icons.directions_bike),
                child: Text("Tab1"),
              ),
              Tab(
                icon: Icon(Icons.directions_bus),
                child: Text("Tab2"),
              ),
              Tab(
                icon: Icon(Icons.directions_railway),
                child: Text("Tab3"),
              ),
            ],
          ),
          Expanded(
            child: GFTabBarView(
              controller: tabController,
              children: <Widget>[
                ListView.builder(
                  itemCount: _users.length,
                  itemBuilder: (context, index) {
                    final user = _users[index];
                    return ListTile(
                      title: Text(user['name'] ?? ''),
                      subtitle: Text(user['lastName'] ?? ''),
                    );
                  },
                ),
                Container(color: Colors.green),
                Container(color: Colors.blue),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     title: 'Ejemplo API Flutter',
//     home: UserListScreen(),
//   ));
// }
