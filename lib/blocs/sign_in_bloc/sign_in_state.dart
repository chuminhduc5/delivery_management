part of 'sign_in_bloc.dart';

@immutable
abstract class SignInState {}

// Trạng thái ban đầu
class SignInInitial extends SignInState {}

// Trạng thái đăng nhập thành công
class SignInSuccess extends SignInState {
  final String uid;

  SignInSuccess({required this.uid});
}

// Trạng thái đăng nhập thất bại
class SignInFailure extends SignInState {
  // final String error;
  //
  // SignInFailure(this.error);
}

// Trạng thái chờ
class SignInLoading extends SignInState {}