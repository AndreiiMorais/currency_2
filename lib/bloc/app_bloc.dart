import 'package:bloc/bloc.dart';
import 'package:currency_2/services/dio_service.dart';
import 'package:currency_2/services/dio_service_imp.dart';
import 'package:currency_2/utils/api_utils.dart';
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
        var result = await _dioService.getDio().get(Api.requestSymbols);
        emit(AppInitialized(isLoading: false, items: result.data['symbols']));
      } on Exception catch (e) {
        emit(AppUninitialized(isLoading: false, exception: e));
      }
    });

    on<AppConvertEvent>((event, emit) => null);
  }
}
