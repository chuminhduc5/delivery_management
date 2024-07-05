part of 'delivery_status_bloc.dart';

@immutable
abstract class DeliveryStatusState {}

// Trạng thái khi request
class DeliveryStatusFetchInitial extends DeliveryStatusState {}

class DeliveryStatusFetchLoading extends DeliveryStatusState {}

class DeliveryStatusFetchSuccess extends DeliveryStatusState {
  final List<dynamic> items;

  DeliveryStatusFetchSuccess({required this.items});
}

class DeliveryStatusFetchFailed extends DeliveryStatusState {
  final String message;
  DeliveryStatusFetchFailed({required this.message});
}

// // Trạng thái khi update
class DeliveryStatusUpdateInitial extends DeliveryStatusState {}

class DeliveryStatusUpdateLoading extends DeliveryStatusState {}

class DeliveryStatusUpdateSuccess extends DeliveryStatusState {}

class DeliveryStatusUpdateFailed extends DeliveryStatusState {}