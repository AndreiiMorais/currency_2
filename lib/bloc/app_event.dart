part of 'app_bloc.dart';

@immutable
abstract class AppEvent {}

class AppInitializeEvent extends AppEvent {}

class AppConvertEvent extends AppEvent {}
