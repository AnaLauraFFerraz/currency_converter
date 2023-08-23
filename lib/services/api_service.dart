import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const _baseUrl = "https://api.hgbrasil.com";
  static const _apiKey = "60df7606";

  Future<Map<String, dynamic>> fetchCurrencyData() async {
    final response =
        await http.get(Uri.parse('$_baseUrl/finance?format=json&key=$_apiKey'));
    print("response: ");
    print(json.decode(response.body));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load currency data');
    }
  }
}
