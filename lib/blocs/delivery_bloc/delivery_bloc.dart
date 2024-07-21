import 'package:bloc/bloc.dart';
import 'package:delivery_management/models/delivery.dart';
import 'package:meta/meta.dart';

import '../../service/delivery_service.dart';

part 'delivery_event.dart';
part 'delivery_state.dart';

class DeliveryBloc extends Bloc<DeliveryEvent, DeliveryState> {
  final DeliveryService deliveryService;

  DeliveryBloc(this.deliveryService) : super(DeliveryInitial()) {
    on<DeliveryFetchRequested>(_onDeliveryFetchRequested);
  }

  Future<void> _onDeliveryFetchRequested(DeliveryFetchRequested event, Emitter<DeliveryState> emit) async {
    emit(DeliveryLoading());
    try {
      final List<Delivery> items = await deliveryService.fetchDelivery();
      emit(DeliverySuccess(items: items));
    } catch (e) {
      emit(DeliveryFailed(message: 'Không lấy được dữ liệu'));
    }
  }
}

