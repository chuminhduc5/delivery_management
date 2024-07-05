import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'perform_delivery_event.dart';
part 'perform_delivery_state.dart';

class PerformDeliveryBloc extends Bloc<PerformDeliveryEvent, PerformDeliveryState> {
  PerformDeliveryBloc() : super(PerformDeliveryInitial()) {
    on<PerformDeliveryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
