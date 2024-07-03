import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<AuthSignInRequested>(_onAuthSignInRequested);
  }

  void _onAuthSignInRequested(AuthSignInRequested event, Emitter<SignInState> emit) async {
    emit(SignInLoading());
    try {
      final account = event.account;
      final password = event.password;

      // Kiểm tra mật khẩu phải trên 6 kí tự
      if(password.length < 6){
        return emit(SignInFailure());
      }

      await Future.delayed(Duration(seconds: 1), (){
        return emit(SignInSuccess(uid: '$account-$password'));
      });
    }catch (e){
      return emit(SignInFailure());
    }
  }
}

