// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:expancetracker/config/baseURL.dart';
import 'package:expancetracker/plugins/local_shared_preferences.dart';

Future GetRequest(String url) async {
  Map<String, String> headers = {
    'Authorization': 'Bearer ${await getTokenFromLocalStorage()}'
  };
  return http.get(Uri.parse(BaseConfig().baseUrl + url), headers: headers);
}

Future PostRequest(String url, Map<String, dynamic> body) async {
  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer ${await getTokenFromLocalStorage()}'
  };
  return await http.post(
    Uri.parse(BaseConfig().baseUrl + url),
    headers: headers,
    body: jsonEncode(body),
  );
}
