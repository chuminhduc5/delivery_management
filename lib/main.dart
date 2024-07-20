import 'package:delivery_management/blocs/delivery_bloc/delivery_bloc.dart';
import 'package:delivery_management/blocs/delivery_status_bloc/delivery_status_bloc.dart';
import 'package:delivery_management/blocs/reason_return_bloc/reason_return_bloc.dart';
import 'package:delivery_management/blocs/technique_bloc/technique_bloc.dart';
import 'package:delivery_management/screens/auth/sign_in_screen.dart';
import 'package:delivery_management/screens/main_screen/delivery_screen.dart';
import 'package:delivery_management/screens/main_screen/home_screen.dart';
import 'package:delivery_management/screens/main_screen/report_screen.dart';
import 'package:delivery_management/screens/main_screen/technique_screen.dart';
import 'package:delivery_management/screens/secondary_screen/notification_screen.dart';
import 'package:delivery_management/screens/secondary_screen/qr_code_screen.dart';
import 'package:delivery_management/service/auth_service.dart';
import 'package:delivery_management/service/delivery_service.dart';
import 'package:delivery_management/service/delivery_status_service.dart';
import 'package:delivery_management/service/reason_return_service.dart';
import 'package:delivery_management/service/technique_service.dart';
import 'package:delivery_management/utils/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_view.dart';
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
          create: (context) =>
              DeliveryBloc(DeliveryService())..add(DeliveryFetchRequested()),
        ),
        BlocProvider(
          create: (context) =>
              TechniqueBloc(TechniqueService())..add(TechniqueFetchRequested()),
        ),
        BlocProvider(
          create: (context) => DeliveryStatusBloc(DeliveryStatusService())
            ..add(DeliveryStatusFetch()),
        ),
        BlocProvider(
          create: (context) => ReasonReturnBloc(ReasonReturnService()),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/app': (context) => const AppView(),
          '/signIn': (context) => const SignInScreen(),
          '/home': (context) => const HomeScreen(),
          '/delivery': (context) => const DeliveryScreen(),
          '/technique': (context) => const TechniqueScreen(),
          '/report': (context) => const ReportScreen(),
          '/notification': (context) => const NotificationScreen(),
          '/qrCode': (context) => const QrCodeScreen(),
        },
        home: const SignInScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
