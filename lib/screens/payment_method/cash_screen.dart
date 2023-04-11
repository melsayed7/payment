import 'package:flutter/material.dart';

import '../../shared/component/constant.dart';

class CashScreen extends StatelessWidget {
  static const String routeName = 'CashScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reference Code'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'You can go to the nearest market to pay',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'This is reference code',
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 30.0),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.purple,
                ),
                child: Center(
                  child: Text(
                    refKioskID.isEmpty ? '🚫' : refKioskID,
                    style: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
