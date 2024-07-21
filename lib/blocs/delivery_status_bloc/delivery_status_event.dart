part of 'delivery_status_bloc.dart';

@immutable
abstract class DeliveryStatusEvent extends Equatable {
  const DeliveryStatusEvent();

  @override
  List<Object?> get props => [];
}

// Sự kiện khi lấy dữu liệu
class DeliveryStatusFetch extends DeliveryStatusEvent {}

// Sự kiện khi cập nhật dữ liệu
class UpdateDeliveryStatus extends DeliveryStatusEvent {
  final String deliveryId;
  final String deliveryStatusId;

  const UpdateDeliveryStatus({
    required this.deliveryId,
    required this.deliveryStatusId,
  });

  @override
  List<Object?> get props => [deliveryId, deliveryStatusId];
}
