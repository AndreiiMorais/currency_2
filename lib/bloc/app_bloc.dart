import 'package:bloc/bloc.dart';
import 'package:currency_2/models/symbol_model.dart';
import 'package:currency_2/services/http_service.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final HttpService _httpService;
  List<Symbol> items = [];
  AppBloc(this._httpService)
      : super(const AppUninitialized(
          exception: null,
          isLoading: true,
        )) {
    on<AppInitializeEvent>((event, emit) async {
      //selecionar todos os currencies e mudar o state para initialized
      try {
        items = await _httpService.getSymbols();
        emit(AppInitialized(items: items, exception: null, isLoading: false));
      } on Exception catch (e) {
        emit(AppUninitialized(exception: e, isLoading: false));
      }
    });

    on<AppConvertEvent>((event, emit) async {
      try {
        emit(AppInitialized(items: items, isLoading: true, exception: null));
        final result = await _httpService.convert(
            amount: event.amountToConvert,
            to: event.toBeConverted,
            from: event.convertedFrom);
        emit(AppConvertedState(
          isLoading: false,
          result: result,
          from: event.convertedFrom,
          to: event.toBeConverted,
          amount: event.amountToConvert,
        ));
        emit(AppInitialized(items: items, exception: null, isLoading: false));
      } on Exception catch (e) {
        emit(AppInitialized(items: items, exception: e, isLoading: false));
      }
    });
  }
}
