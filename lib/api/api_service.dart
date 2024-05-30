import 'dart:convert';
import 'package:expancetracker/models/account_model.dart';
import 'package:http/http.dart' as http;
import 'package:expancetracker/config/baseURL.dart';
import 'package:expancetracker/plugins/local_shared_preferences.dart';
import 'package:expancetracker/models/transaction_model.dart';

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

  Future<List<TransactionModel>> fetchTransactions() async {
    final response = await getRequest('transaction/me');
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['data'];
      return data.map((json) => TransactionModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch transactions');
    }
  }

  Future<List<AccountModel>> fetchAccounts() async {
    final response = await getRequest('account/me');
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['data'];
      return data.map((json) => AccountModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch accounts');
    }
  }

  Future<http.Response> getRequest(String url) async {
    String? token = await getTokenFromLocalStorage();
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
    };
    return http.get(Uri.parse(BaseConfig().baseUrl + url), headers: headers);
  }

  Future<http.Response> postRequest(
      String url, Map<String, dynamic> body) async {
    String? token = await getTokenFromLocalStorage();
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
    return await http.post(Uri.parse(BaseConfig().baseUrl + url),
        headers: headers, body: jsonEncode(body));
  }
}
