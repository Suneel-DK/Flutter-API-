import 'package:http/http.dart' as http;

String url = 'https://randomuser.me/api?results=10';

Future<String> ApiResponse() async {
  var response = await http.get(Uri.parse(url));
  print(response.body);
  return response.body;
}
