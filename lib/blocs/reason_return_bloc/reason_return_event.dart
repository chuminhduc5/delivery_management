part of 'reason_return_bloc.dart';

@immutable
abstract class ReasonReturnEvent extends Equatable {
  const ReasonReturnEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchReasonReturn extends ReasonReturnEvent {}
