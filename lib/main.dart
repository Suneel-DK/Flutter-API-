import 'package:api_trial/Services/services.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API RESPONSE"),
      ),
      body: FutureBuilder(
          future: getEmployee(),
          builder: (context, response) {
            return Center(
              child: Text(
                  response.data ?? "Load agudhu pa kanna wait panu porumaya"),
            );
          }),
    );
  }
}
