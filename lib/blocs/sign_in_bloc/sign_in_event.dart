part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent {}

// Sự kiện khi bấm button SignIn
final class AuthSignInRequested extends SignInEvent{
  final String username;
  final String password;

  AuthSignInRequested({required this.username, required this.password});
}

