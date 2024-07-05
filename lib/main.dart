import 'package:delivery_management/blocs/delivery_status_bloc/delivery_status_bloc.dart';
import 'package:delivery_management/screens/auth/sign_in_screen.dart';
import 'package:delivery_management/screens/delivery_screen.dart';
import 'package:delivery_management/service/auth_service.dart';
import 'package:delivery_management/service/delivery_status_service.dart';
import 'package:delivery_management/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';
import 'blocs/sign_in_bloc/sign_in_bloc.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignInBloc(AuthService()),
        ),
        BlocProvider(
          create: (context) => DeliveryStatusBloc(DeliveryStatusService()),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/signIn': (context) => const SignInScreen(),
          '/app': (context) => const App()
        },
        //home: const TransportStaffScreen(),
        //home: const App(),
        home: const SignInScreen(),
        //home: const DeliveryScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
