import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../service/reason_return_service.dart';

part 'reason_return_event.dart';
part 'reason_return_state.dart';

class ReasonReturnBloc extends Bloc<ReasonReturnEvent, ReasonReturnState> {
  final ReasonReturnService reasonReturnService;
  ReasonReturnBloc(this.reasonReturnService) : super(ReasonReturnInitial()) {
    on<FetchReasonReturn>(_onFetchReasonReturn);
  }

  // Xử lý khi lấy dữ liệu
  void _onFetchReasonReturn(FetchReasonReturn event, Emitter<ReasonReturnState> emit) async {
    emit (ReasonReturnLoading());
    try {
      final items = await reasonReturnService.fetchReasonReturn();
      emit(ReasonReturnSuccess(items: items));
    } catch (e) {
      emit(ReasonReturnFailed(message: e.toString()));
    }
  }
}
