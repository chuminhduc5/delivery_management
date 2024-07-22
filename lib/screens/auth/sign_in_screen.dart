import '../../app_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/sign_in_bloc/sign_in_bloc.dart';
import '../../utils/message_utils.dart';
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
    final maxScreenHeight = MediaQuery.of(context).size.height;
    final maxScreenWidth = MediaQuery.of(context).size.width;
    final isLandscape = maxScreenWidth > maxScreenHeight;

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state is SignInFailure) {
            MessageUtils.errorMessageUtils(context, message: 'Đăng nhập thất bại');
          } else if (state is SignInSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/app',
                  (route) => false,
              arguments: {'fullName': state.fullName},
            );
          }
        },
        builder: (context, state) {
          if (state is SignInLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SafeArea(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green, Color(0xFF4C58AF)],
                  stops: [0, 1],
                  begin: AlignmentDirectional(0.87, -1),
                  end: AlignmentDirectional(-0.87, 1),
                ),
              ),
              child: isLandscape
                  ? Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: maxScreenHeight * 0.1),
                      child: Image.asset(
                        'assets/images/logo-hacom.png',
                        width: 200,
                        height: 200,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: buildForm(),
                    ),
                  ),
                ],
              )
                  : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: maxScreenHeight * 0.1),
                      child: Image.asset(
                        'assets/images/logo-hacom.png',
                        width: 200,
                        height: 200,
                      ),
                    ),
                    buildForm(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildForm() {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(
          maxWidth: 600,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x33000000),
              offset: Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Welcome Back',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
                textAlign: TextAlign.center,
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 24),
                child: Text(
                  'Fill out the information below in order to access your account.',
                  textAlign: TextAlign.center,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextFieldAuthWidget(
                        controller: usernameController,
                        hinText: 'Username',
                        obscureText: false,
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: const Icon(CupertinoIcons.person),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Vui lòng nhập tài khoản";
                          }
                          return null;
                        },
                      ),
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                            context.read<SignInBloc>().add(
                              AuthSignInRequested(
                                username: usernameController.text,
                                password: passwordController.text,
                              ),
                            );
                          }
                        },
                        textButton: 'Đăng nhập',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
