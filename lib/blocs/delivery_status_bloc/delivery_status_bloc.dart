import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../service/delivery_status_service.dart';

part 'delivery_status_event.dart';
part 'delivery_status_state.dart';

class DeliveryStatusBloc extends Bloc<DeliveryStatusEvent, DeliveryStatusState> {
  final DeliveryStatusService deliveryStatusService;
  DeliveryStatusBloc(this.deliveryStatusService) : super(DeliveryStatusFetchInitial()) {
    on<DeliveryStatusFetch>(_onDeliveryStatusFetch);

    on<DeliveryStatusUpdate>(_onDeliveryStatusUpdate);
  }

  // Trạng thái lấy dữ liệu
  void _onDeliveryStatusFetch(DeliveryStatusEvent event, Emitter<DeliveryStatusState> emit) async {
    emit (DeliveryStatusFetchInitial());
    try {
      final items = await deliveryStatusService.fetchDeliveryStatus();
      emit(DeliveryStatusFetchSuccess(items: items));
    } catch (e) {
      emit(DeliveryStatusFetchFailed(message: e.toString()));
    }
  }

  // Trạng thái cập nhật dữ liệu
  void _onDeliveryStatusUpdate(DeliveryStatusEvent event, Emitter<DeliveryStatusState> emit) async {
    emit (DeliveryStatusUpdateInitial());
    try {
      emit(DeliveryStatusUpdateSuccess());
    } catch (e) {
      emit(DeliveryStatusUpdateFailed());
    }
  }
}
