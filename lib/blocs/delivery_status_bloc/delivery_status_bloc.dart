import 'package:bloc/bloc.dart';
import 'package:delivery_management/models/delivery_status.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../service/delivery_status_service.dart';

part 'delivery_status_event.dart';

part 'delivery_status_state.dart';

class DeliveryStatusBloc
    extends Bloc<DeliveryStatusEvent, DeliveryStatusState> {
  final DeliveryStatusService deliveryStatusService;

  DeliveryStatusBloc(this.deliveryStatusService)
      : super(DeliveryStatusFetchInitial()) {
    on<DeliveryStatusFetch>(_onDeliveryStatusFetch);

    on<UpdateDeliveryStatus>(_onUpdateDeliveryStatus);
  }

  // Xử lý khi lấy dữ liệu
  Future<void> _onDeliveryStatusFetch(
      DeliveryStatusFetch event, Emitter<DeliveryStatusState> emit) async {
    emit(DeliveryStatusFetchLoading());
    try {
      final List<DeliveryStatus> items = await deliveryStatusService.fetchDeliveryStatus();
      emit(DeliveryStatusFetchSuccess(items: items));
    } catch (e) {
      emit(const DeliveryStatusFetchFailed(message: 'Không lấy được dữ liệu'));
    }
  }

  // Xử lý khi cập nhật trạng thái dữ liệu
  Future<void> _onUpdateDeliveryStatus(
      UpdateDeliveryStatus event, Emitter<DeliveryStatusState> emit) async {
    emit(UpdateDeliveryStatusLoading());
    try {
      // final updatedOrder = await deliveryStatusService.updateDeliveryStatus(
      //   event.deliveryId,
      //   event.deliveryStatusId,
      // );
      // emit(UpdateDeliveryStatusSuccess(updatedOrder: updatedOrder));
      await deliveryStatusService.updateDeliveryStatus(
        event.deliveryId,
        event.deliveryStatusId,
      );
      final updatedOrder = await deliveryStatusService.fetchDeliveryStatus();
      emit(UpdateDeliveryStatusSuccess(updatedOrder: updatedOrder));
    } catch (e) {
      emit(const UpdateDeliveryStatusFailed(message: 'Cập nhật thất bại'));
    }
  }
}
