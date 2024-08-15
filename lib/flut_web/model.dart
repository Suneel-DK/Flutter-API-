import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  List<Map<String, dynamic>> _responseList = [];
  List<Map<String, dynamic>> get responseList =>_responseList;

  postData() async {
    String title = titleController.text;
    String body = bodyController.text;

    var response = await http.post(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        body: {"id": 1.toString(), "title": title, "body": body});

    var decodedText = jsonDecode(response.body);

    _responseList.add(decodedText);
    notifyListeners();
  }
}
