part of 'delivery_status_bloc.dart';

@immutable
abstract class DeliveryStatusEvent {}

// Sự kiện khi lấy dữu liệu
class DeliveryStatusFetch extends DeliveryStatusEvent {}

// Sự kiện khi bấm lưu và update dữ liệu
class DeliveryStatusUpdate extends DeliveryStatusEvent {}