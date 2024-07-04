part of 'technique_bloc.dart';

@immutable
abstract class TechniqueState {}

class TechniqueInitial extends TechniqueState {}

class TechniqueLoading extends TechniqueState {}

class TechniqueSuccess extends TechniqueState {
  final List<dynamic> data;

  TechniqueSuccess({required this.data});
}

class TechniqueFailed extends TechniqueState {
  final String message;

  TechniqueFailed({required this.message});
}
