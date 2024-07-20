part of 'reason_return_bloc.dart';

@immutable
abstract class ReasonReturnState extends Equatable{
  const ReasonReturnState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ReasonReturnInitial extends ReasonReturnState {}

class ReasonReturnLoading extends ReasonReturnState {}

class ReasonReturnSuccess extends ReasonReturnState {
  final List<ReasonReturn> items;
  const ReasonReturnSuccess({required this.items});

  @override
  // TODO: implement props
  List<Object?> get props => [items];
}

class ReasonReturnFailed extends ReasonReturnState {
  final String message;
  const ReasonReturnFailed({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

