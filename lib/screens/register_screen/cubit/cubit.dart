import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/screens/register_screen/cubit/states.dart';
import 'package:payment/shared/component/constant.dart';
import 'package:payment/shared/network/dio_helper.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit() : super(InitialState());

  static PaymentCubit get(context) => BlocProvider.of(context);

  void getAuthToken({
    required String amount,
    required String email,
    required String fName,
    required String lName,
    required String phone,
  }) {
    emit(LoadingAuthTokenState());
    DioHelper.postData(endPoint: 'auth/tokens', data: {
      "api_key": apiKey,
    }).then((value) {
      authToken = value.data['token'];
      getOrderID(
        email: email,
        fName: fName,
        lName: lName,
        phone: phone,
        amount: amount,
      );
      print(authToken);
      emit(SuccessfulAuthTokenState());
    }).catchError((error) {
      emit(ErrorAuthTokenState());
    });
  }

  void getOrderID({
    required String amount,
    required String email,
    required String fName,
    required String lName,
    required String phone,
  }) {
    emit(LoadingOrderIDState());
    DioHelper.postData(endPoint: 'ecommerce/orders', data: {
      "auth_token": authToken,
      "delivery_needed": "false",
      "amount_cents": amount,
      "currency": "EGP",
      "items": []
    }).then((value) {
      orderID = value.data['id'].toString();
      getPaymentRequestCardToken(
        email: email,
        fName: fName,
        lName: lName,
        phone: phone,
        amount: amount,
      );
      getPaymentRequestKioskToken(
        email: email,
        fName: fName,
        lName: lName,
        phone: phone,
        amount: amount,
      );
      print(orderID);
      emit(SuccessfulOrderIDState());
    }).catchError((error) {
      emit(ErrorOrderIDState());
      print(error);
    });
  }

  void getPaymentRequestCardToken({
    required String amount,
    required String email,
    required String fName,
    required String lName,
    required String phone,
  }) {
    emit(LoadingRequestKeyCardState());
    DioHelper.postData(endPoint: 'acceptance/payment_keys', data: {
      "auth_token": authToken,
      "amount_cents": amount,
      "expiration": 3600,
      "order_id": orderID,
      "billing_data": {
        "apartment": "NA",
        "email": email,
        "floor": "NA",
        "first_name": fName,
        "street": "NA",
        "building": "NA",
        "phone_number": phone,
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "last_name": lName,
        "state": "NA"
      },
      "currency": "EGP",
      "integration_id": integrationIDCard,
      "lock_order_when_paid": "false"
    }).then((value) {
      cardToken = value.data['token'];
      emit(SuccessfulRequestKeyCardState());
    }).catchError((error) {
      emit(ErrorRequestKeyCardState());
    });
  }

  void getPaymentRequestKioskToken({
    required String amount,
    required String email,
    required String fName,
    required String lName,
    required String phone,
  }) {
    emit(LoadingRequestKeyKioskState());
    DioHelper.postData(endPoint: 'acceptance/payment_keys', data: {
      "auth_token": authToken,
      "amount_cents": amount,
      "expiration": 3600,
      "order_id": orderID,
      "billing_data": {
        "apartment": "NA",
        "email": email,
        "floor": "NA",
        "first_name": fName,
        "street": "NA",
        "building": "NA",
        "phone_number": phone,
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "last_name": lName,
        "state": "NA"
      },
      "currency": "EGP",
      "integration_id": integrationIDKiosk,
      "lock_order_when_paid": "false"
    }).then((value) {
      kioskToken = value.data['token'];
      getRefCode();
      emit(SuccessfulRequestKeyKioskState());
    }).catchError((error) {
      emit(ErrorRequestKeyKioskState());
    });
  }

  void getRefCode() {
    emit(LoadingReferenceKeyKioskState());
    DioHelper.postData(endPoint: 'acceptance/payments/pay', data: {
      "source": {"identifier": "AGGREGATOR", "subtype": "AGGREGATOR"},
      "payment_token": kioskToken
    }).then((value) {
      refKioskID = value.data['id'].toString();
      emit(SuccessfulReferenceKeyKioskState());
    }).catchError((error) {
      emit(ErrorReferenceKeyKioskState());
    });
  }
}
