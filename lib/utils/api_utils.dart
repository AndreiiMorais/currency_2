class Api {
  static const requestSymbols = 'symbols';
  static String requestConvert(double amount, String from, String to) =>
      'convert?to=$to&from=$from&amount=$amount';
}
