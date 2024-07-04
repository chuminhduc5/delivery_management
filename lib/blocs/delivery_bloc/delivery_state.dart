part of 'delivery_bloc.dart';

@immutable
abstract class DeliveryState {}

class DeliveryInitial extends DeliveryState {}

class DeliveryLoading extends DeliveryState {}

class DeliverySuccess extends DeliveryState {
  final List<dynamic> items;

  DeliverySuccess({required this.items});
}

class DeliveryFailed extends DeliveryState {
  final String message;

  DeliveryFailed({required this.message});
}
