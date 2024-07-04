part of 'delivery_bloc.dart';

@immutable
abstract class DeliveryEvent {}

class DeliveryFetchRequested extends DeliveryEvent {}
