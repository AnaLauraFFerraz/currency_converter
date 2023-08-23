import 'package:currency_converter/app/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends FutureViewModel<Map<String, dynamic>> {
  final ApiService _apiService = ApiService();

  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();

  late double _dolar;
  late double _euro;

  double get dolar => _dolar;
  double get euro => _euro;

  @override
  Future<Map<String, dynamic>> futureToRun() async {
    final data = await _apiService.fetchCurrencyData();
    _dolar = data["results"]["currencies"]["USD"]["buy"];
    _euro = data["results"]["currencies"]["EUR"]["buy"];
    return data;
  }

  void clearAll() {
    realController.text = "";
    dolarController.text = "";
    euroController.text = "";
  }

  void realChanged(String text) {
    if (text.isEmpty) {
      clearAll();
      return;
    }
    double real = double.parse(text);
    dolarController.text = (real / _dolar).toStringAsFixed(2);
    euroController.text = (real / _euro).toStringAsFixed(2);
  }

  void dolarChanged(String text) {
    if (text.isEmpty) {
      clearAll();
      return;
    }
    double dolarValue = double.parse(text);
    realController.text = (dolarValue * _dolar).toStringAsFixed(2);
    euroController.text = (dolarValue * _dolar / _euro).toStringAsFixed(2);
  }

  void euroChanged(String text) {
    if (text.isEmpty) {
      clearAll();
      return;
    }
    double euroValue = double.parse(text);
    realController.text = (euroValue * _euro).toStringAsFixed(2);
    dolarController.text = (euroValue * _euro / _dolar).toStringAsFixed(2);
  }
}
