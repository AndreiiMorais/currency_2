import 'dart:convert';

import 'package:currency_2/models/symbol_model.dart';
import 'package:currency_2/services/http_service.dart';
import 'package:http/http.dart' as http;

class HttpServiceImp implements HttpService {
  @override
  Future<List<Symbol>> getSymbols() async {
    try {
      var url = Uri.parse(
        "https://api.apilayer.com/exchangerates_data/symbols",
      );

      var response = await http.get(
        url,
        headers: {'apiKey': 'a1zQDIM04PgU78cBe8GgOy0sltW1FCyh'},
      );

      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      List<Symbol> symbolsAsList = [];
      Map<String, dynamic> symbolsAsMap = jsonResponse['symbols'];
      symbolsAsMap.forEach((key, value) {
        symbolsAsList.add(Symbol(key: key, name: value));
      });
      return symbolsAsList;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<double> convert({
    required String amount,
    required String to,
    required String from,
  }) async {
    final url = Uri.parse(
        "https://api.apilayer.com/exchangerates_data/convert?to=$to&from=$from&amount=$amount");

    final response = await http.get(
      url,
      headers: {'apiKey': 'a1zQDIM04PgU78cBe8GgOy0sltW1FCyh'},
    );

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    final valueConverted = jsonResponse['result'];
    return valueConverted;
  }

}
