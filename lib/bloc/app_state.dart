part of 'app_bloc.dart';

@immutable
abstract class AppState {
  final bool isLoading;
  final Exception? exception;
  final String? from;
  final String? to;
  final double? result;
  final String? amount;
  final List<Symbol> items;
  const AppState({
    required this.isLoading,
    this.from,
    this.to,
    this.result,
    this.amount,
    this.exception,
    this.items = const [],
  });
}

class AppUninitialized extends AppState {
  const AppUninitialized(
      {required Exception? exception, required bool isLoading})
      : super(isLoading: isLoading);
}

class AppInitialized extends AppState {
  const AppInitialized({
    required bool isLoading,
    required List<Symbol> items,
    required Exception? exception,
  }) : super(items: items, isLoading: isLoading);
}

class AppConvertedState extends AppState {
  const AppConvertedState({
    required double result,
    required String from,
    required String to,
    required String amount,
    required bool isLoading,
  }) : super(
          result: result,
          from: from,
          to: to,
          amount: amount,
          isLoading: isLoading,
        );
}
