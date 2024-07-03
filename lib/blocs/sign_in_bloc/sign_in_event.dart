part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent {}

// Sự kiện khi bấm button SignIn
final class AuthSignInRequested extends SignInEvent{
  final String account;
  final String password;

  AuthSignInRequested({required this.account, required this.password});
}

