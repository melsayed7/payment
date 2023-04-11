import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/screens/payment_method/cash_screen.dart';
import 'package:payment/screens/payment_method/visa_screen.dart';
import 'package:payment/screens/register_screen/cubit/cubit.dart';
import 'package:payment/screens/register_screen/cubit/states.dart';

import '../../shared/component/constant.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'homeScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: BlocConsumer<PaymentCubit, PaymentStates>(
        listener: (context, state) {
          if (state is SuccessfulReferenceKeyKioskState) {
            Navigator.of(context).pushNamed(CashScreen.routeName);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        PaymentCubit.get(context).getRefCode();
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black12,
                          border: Border.all(color: Colors.black87, width: 1.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: NetworkImage(refCodeImage),
                            ),
                            const Text(
                              'Payment with Ref code',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(VisaScreen.routeName);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black12,
                          border: Border.all(color: Colors.black87, width: 1.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: NetworkImage(visaImage),
                            ),
                            const Text(
                              'Payment with Visa',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
