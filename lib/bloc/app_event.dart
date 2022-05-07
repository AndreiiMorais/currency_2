part of 'app_bloc.dart';

@immutable
abstract class AppEvent {}

class AppInitializeEvent extends AppEvent {}

class AppConvertEvent extends AppEvent {
  ///Value value Converted
  final String convertedFrom;

  ///Value to be converted
  final String toBeConverted;
  final String amountToConvert;

  AppConvertEvent({
    required this.amountToConvert,
    required this.convertedFrom,
    required this.toBeConverted,
  });
}
