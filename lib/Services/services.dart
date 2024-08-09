import 'package:http/http.dart' as http;

String EmployeeUrl = 'https://dummy.restapiexample.com/api/v1/employees';

Future<String> getEmployee() async {
  var response = await http.get(Uri.parse(EmployeeUrl));
  return response.body;
}
