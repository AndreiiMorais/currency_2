part of 'app_bloc.dart';

@immutable
abstract class AppState {
  final bool isLoading;

  const AppState({required this.isLoading});
}

class AppUninitialized extends AppState {
  final Exception? exception;
  const AppUninitialized({
    required bool isLoading,
    required this.exception,
  }) : super(isLoading: isLoading);
}

class AppInitialized extends AppState {
  final List<Symbol> items;
  const AppInitialized({
    required this.items,
    required bool isLoading,
  }) : super(isLoading: isLoading);
}

class AppConvertedState extends AppState {
  const AppConvertedState({
    required bool isLoading,
  }) : super(isLoading: isLoading);
}
