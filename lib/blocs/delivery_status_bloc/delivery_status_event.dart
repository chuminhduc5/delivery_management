part of 'delivery_status_bloc.dart';

@immutable
abstract class DeliveryStatusEvent extends Equatable {
  const DeliveryStatusEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

// Sự kiện khi lấy dữu liệu
class DeliveryStatusFetch extends DeliveryStatusEvent {}

// Sự kiện khi cập nhật dữ liệu
class UpdateDeliveryStatus extends DeliveryStatusEvent {
  final String deliveryId;
  final int deliveryStatusId;

  const UpdateDeliveryStatus({
    required this.deliveryId,
    required this.deliveryStatusId,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [deliveryId, deliveryStatusId];
}
