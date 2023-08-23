import 'package:currency_converter/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends FutureViewModel<Map<String, dynamic>> {
  final ApiService _apiService = ApiService();

  // HomeViewModel() {
  //   realController.addListener(() {
  //     print(realController.text);
  //     realChanged(realController.text);
  //     notifyListeners();
  //   });
  // }

  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();

  double _dolar = 0;
  double _euro = 0;

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
    notifyListeners();
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
