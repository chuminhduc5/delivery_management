part of 'delivery_status_bloc.dart';

@immutable
abstract class DeliveryStatusState extends Equatable{
  const DeliveryStatusState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

// Trạng thái khi fetch data
class DeliveryStatusFetchInitial extends DeliveryStatusState {}

class DeliveryStatusFetchLoading extends DeliveryStatusState {}

class DeliveryStatusFetchSuccess extends DeliveryStatusState {
  final List<dynamic> items;

  const DeliveryStatusFetchSuccess({required this.items});

  @override
  // TODO: implement props
  List<Object?> get props => [items];
}

class DeliveryStatusFetchFailed extends DeliveryStatusState {
  final String message;
  const DeliveryStatusFetchFailed({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

// Trạng thái khi cập nhập trạng thái dữ liệu
class UpdateDeliveryStatusLoading extends DeliveryStatusState {}

class UpdateDeliveryStatusSuccess extends DeliveryStatusState {
  final dynamic updatedOrder; // Define updatedOrder here

  const UpdateDeliveryStatusSuccess({required this.updatedOrder});

  @override
  List<Object?> get props => [updatedOrder];
}

class UpdateDeliveryStatusFailed extends DeliveryStatusState {
  final String message;

  const UpdateDeliveryStatusFailed({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}