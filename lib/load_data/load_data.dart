import 'dart:convert';

import 'package:http/http.dart' as http;

class LoadData {
  static String baseURL = 'https://api.spaceflightnewsapi.net/v4';
  
  static Future<Map<String, dynamic>>get(String param) async {
    final response = await http.get(Uri.parse('$baseURL/$param'));
    if (response.statusCode == 200) {
      var jsonBody = json.decode(response.body);
      return jsonBody;
    } else {
      throw Exception('Failed to load data');
    }
  }
}