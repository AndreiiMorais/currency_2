import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:currency_2/models/symbol_model.dart';
import 'package:currency_2/services/dio_service.dart';
import 'package:currency_2/services/dio_service_imp.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final DioService _dioService = DioServiceImp();
  AppBloc()
      : super(const AppUninitialized(
          isLoading: true,
          exception: null,
        )) {
    on<AppInitializeEvent>((event, emit) async {
      //selecionar todos os currencies e mudar o state para initialized
      try {
        // var result = await _dioService.getDio().get(Api.requestSymbols);
        var url =
            Uri.parse("https://api.apilayer.com/exchangerates_data/symbols");
        var response = await http
            .get(url, headers: {'apiKey': 'a1zQDIM04PgU78cBe8GgOy0sltW1FCyh'});
        var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
        List<Symbol> list = [];
        Map<String, dynamic> items = jsonResponse['symbols'];
        items.forEach((key, value) {
          list.add(Symbol(key: key, name: value));
        });
        emit(AppInitialized(isLoading: false, items: list));
      } on Exception catch (e) {
        emit(AppUninitialized(isLoading: false, exception: e));
      }
    });

    on<AppConvertEvent>((event, emit) => null);
  }
}
