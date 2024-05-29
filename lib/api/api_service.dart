// api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:expancetracker/config/baseURL.dart';
import 'package:expancetracker/plugins/local_shared_preferences.dart';

Future<http.Response> getRequest(String url) async {
  String? token = await getTokenFromLocalStorage();
  Map<String, String> headers = {
    'Authorization': 'Bearer $token',
  };
  print('Headers: $headers'); // Debugging line
  return http.get(Uri.parse(BaseConfig().baseUrl + url), headers: headers);
}

Future<http.Response> postRequest(String url, Map<String, dynamic> body) async {
  String? token = await getTokenFromLocalStorage();
  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer $token',
  };
  print('Headers: $headers'); // Debugging line
  return await http.post(Uri.parse(BaseConfig().baseUrl + url),
      headers: headers, body: jsonEncode(body));
}

class ApiService {
  Future<Map<String, dynamic>> getSummary() async {
    final response = await getRequest('summary');
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized');
    } else {
      throw Exception('Failed to load summary');
    }
  }
}
