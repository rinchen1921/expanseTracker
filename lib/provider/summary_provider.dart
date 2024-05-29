import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:expancetracker/models/summaryModel.dart';

class SummaryProvider {
  static const String apiUrl = 'http://10.254.251.126:3030/summary';

  Future<SummaryModel> getSummaryData(String token) async {
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'accept': '*/*',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);
      return SummaryModel.fromJson(decodedData);
    } else {
      throw Exception('Failed to load summary data');
    }
  }
}
