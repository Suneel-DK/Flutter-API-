import 'dart:convert';

import 'package:api_trial/flut_web/model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class HomePageWeb extends StatefulWidget {
  const HomePageWeb({super.key});

  @override
  State<HomePageWeb> createState() => _HomePageWebState();
}

class _HomePageWebState extends State<HomePageWeb> {
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Post Example"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                controller: dataProvider.titleController,
                decoration: const InputDecoration(hintText: 'title'),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                controller: dataProvider.bodyController,
                decoration: const InputDecoration(hintText: 'body'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: dataProvider.postData,
                child: const Text("Send Data")),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: dataProvider.responseList.length,
                  itemBuilder: (context, index) {
                    var item = dataProvider.responseList[index];
                    return ListTile(
                      leading: Text("${index + 1}"),
                      title: Text("${item['title']}"),
                      subtitle: Text("${item['body']}"),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
