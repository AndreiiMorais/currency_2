import 'package:currency_2/services/dio_service.dart';
import 'package:dio/dio.dart';

class DioServiceImp implements DioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://api.apilayer.com/exchangerates_data/',
        headers: {
          'apiKey': 'a1zQDIM04PgU78cBe8GgOy0sltW1FCyh',
        },
      ),
    );
  }
}
