import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> users = [];

  void fetchUsers() async {
    print("Fetch users Started");
    String url = 'https://randomuser.me/api?results=20';
    var response = await http.get(Uri.parse(url));
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json['results'];
    });
    print("Fetch users completed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("API Trial"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchUsers,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              final email = user['email'];
              final name = user['name']['first'];
              final gender = user['gender'];
              return ListTile(
                leading: ClipOval(
                  child: Text('${index + 1}'),
                ),
                title: Text(name),
                subtitle: Text(email),
                trailing: Text(gender.toString()),
              );
            }));
  }
}
