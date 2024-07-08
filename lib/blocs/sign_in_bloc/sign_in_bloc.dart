import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../service/auth_service.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthService authService;
  SignInBloc(this.authService) : super(SignInInitial()) {
    on<AuthSignInRequested>(_onAuthSignInRequested);
  }

  void _onAuthSignInRequested(AuthSignInRequested event, Emitter<SignInState> emit) async {
    emit(SignInLoading());
    try {
      final username = event.username;
      final password = event.password;

      print("-----------------payload: $username --- $password");
      // Call API để đăng nhập
      final token = await authService.authenticateUser(username, password);
      print("-----------------response: $token");
      // Lưu token vào Shared Preferences
      await authService.saveToken(token);

      await Future.delayed(const Duration(seconds: 1), (){
        return emit(SignInSuccess(uid: token));
      });
    }catch (e){
      print('Login failed: $e'); // Log lỗi
      return emit(SignInFailure());
    }
  }
}

