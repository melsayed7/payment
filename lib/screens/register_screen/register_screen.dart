import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/screens/payment_method/home_screen.dart';
import 'package:payment/screens/register_screen/cubit/cubit.dart';
import 'package:payment/screens/register_screen/cubit/states.dart';
import 'package:payment/widget/show_loader_dialog.dart';

import '../../widget/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = 'registerScreen';

  var formKey = GlobalKey<FormState>();
  var fName = TextEditingController();
  var lName = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var amount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: BlocConsumer<PaymentCubit, PaymentStates>(
        listener: (context, state) {
          if (state is SuccessfulReferenceKeyKioskState) {
            Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Payment Integration',
              ),
              backgroundColor: Colors.purple,
              centerTitle: true,
            ),
            body: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset('assets/images/Delivery.png'),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            icon: const Icon(Icons.person),
                            hintText: 'First Name',
                            controller: fName,
                            inputType: TextInputType.text,
                            validator: (text) {
                              if (text!.isEmpty) {
                                return 'Please entre First Name';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        Expanded(
                          child: CustomTextFormField(
                            icon: const Icon(Icons.person),
                            hintText: 'Last Name',
                            controller: lName,
                            inputType: TextInputType.text,
                            validator: (text) {
                              if (text!.isEmpty) {
                                return 'Please entre Last Name';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    CustomTextFormField(
                      icon: const Icon(Icons.email_outlined),
                      hintText: 'Email',
                      controller: email,
                      inputType: TextInputType.emailAddress,
                      validator: (text) {
                        if (text!.isEmpty) {
                          return 'Please entre Your Email';
                        } else {
                          return null;
                        }
                      },
                    ),
                    CustomTextFormField(
                      icon: const Icon(Icons.phone),
                      hintText: 'Phone Number',
                      controller: phone,
                      inputType: TextInputType.phone,
                      validator: (text) {
                        if (text!.isEmpty) {
                          return 'Please entre Your Phone Number';
                        } else {
                          return null;
                        }
                      },
                    ),
                    CustomTextFormField(
                      icon: const Icon(Icons.monetization_on_outlined),
                      hintText: 'Price',
                      controller: amount,
                      inputType: TextInputType.number,
                      validator: (text) {
                        if (text!.isEmpty) {
                          return 'Please entre Price';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          ShowLoaderDialog.loadDialog(context);
                          PaymentCubit.get(context).getAuthToken(
                            amount: amount.text,
                            email: email.text,
                            fName: fName.text,
                            lName: lName.text,
                            phone: phone.text,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 18),
                        child: Text('Register', style: TextStyle(fontSize: 20)),
                      ),
                    ),
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
