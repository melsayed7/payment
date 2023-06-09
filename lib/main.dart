import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/my_bloc_observer.dart';
import 'package:payment/screens/payment_method/cash_screen.dart';
import 'package:payment/screens/payment_method/home_screen.dart';
import 'package:payment/screens/payment_method/visa_screen.dart';
import 'package:payment/screens/register_screen/register_screen.dart';
import 'package:payment/shared/network/dio_helper.dart';

void main() {
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RegisterScreen.routeName,
      routes: {
        RegisterScreen.routeName: (context) => RegisterScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        CashScreen.routeName: (context) => CashScreen(),
        VisaScreen.routeName: (context) => VisaScreen(),
      },
    );
  }
}
