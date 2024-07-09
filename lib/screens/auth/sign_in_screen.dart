import '../../app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/sign_in_bloc/sign_in_bloc.dart';
import '../../utils/notification_message.dart';
import '../../widgets/auth/button_widget.dart';
import '../../widgets/auth/text_field_auth_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscurePassword = true;
  IconData iconPassword = CupertinoIcons.eye_slash;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state is SignInFailure) {
            notificationMessage(context, message: 'Đăng nhập thất bại');
          } else if (state is SignInSuccess) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const App()),
                (route) => false);
          }
        },
        builder: (context, state) {
          if (state is SignInLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                        child: Image.asset(
                      'assets/images/logo.png',
                      width: 200,
                      height: 200,
                    )),
                    const SizedBox(
                      height: 50,
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: TextFieldAuthWidget(
                                  controller: usernameController,
                                  hinText: 'Tài khoản',
                                  obscureText: false,
                                  keyboardType: TextInputType.emailAddress,
                                  prefixIcon: const Icon(CupertinoIcons.person),
                                  //errorMsg: _errorMsg,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Vui lòng nhập tài khoản";
                                    }
                                    return null;
                                  }),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: TextFieldAuthWidget(
                                controller: passwordController,
                                hinText: 'Password',
                                obscureText: obscurePassword,
                                keyboardType: TextInputType.visiblePassword,
                                prefixIcon: const Icon(CupertinoIcons.lock),
                                //errorMsg: _errorMsg,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return 'Vui lòng nhập mật khẩu';
                                  }
                                  return null;
                                },
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      obscurePassword = !obscurePassword;
                                      if (obscurePassword) {
                                        iconPassword = CupertinoIcons.eye_slash;
                                      } else {
                                        iconPassword = CupertinoIcons.eye;
                                      }
                                    });
                                  },
                                  icon: Icon(iconPassword),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ButtonWidget(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      context
                                          .read<SignInBloc>()
                                          .add(AuthSignInRequested(
                                            username:
                                                usernameController.text,
                                            password:
                                                passwordController.text,
                                          ));
                                    }
                                  },
                                  textButton: 'Đăng nhập'),
                            )
                          ],
                        )),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
