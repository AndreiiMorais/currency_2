import 'package:currency_2/models/symbol_model.dart';

abstract class HttpService {
  Future<List<Symbol>> getSymbols();
  Future<double> convert({
    required String amount,
    required String to,
    required String from,
  });
}
