abstract class PaymentStates {}

class InitialState extends PaymentStates {}

class LoadingAuthTokenState extends PaymentStates {}

class SuccessfulAuthTokenState extends PaymentStates {}

class ErrorAuthTokenState extends PaymentStates {}

class LoadingOrderIDState extends PaymentStates {}

class SuccessfulOrderIDState extends PaymentStates {}

class ErrorOrderIDState extends PaymentStates {}

class LoadingRequestKeyCardState extends PaymentStates {}

class SuccessfulRequestKeyCardState extends PaymentStates {}

class ErrorRequestKeyCardState extends PaymentStates {}

class LoadingRequestKeyKioskState extends PaymentStates {}

class SuccessfulRequestKeyKioskState extends PaymentStates {}

class ErrorRequestKeyKioskState extends PaymentStates {}

class LoadingReferenceKeyKioskState extends PaymentStates {}

class SuccessfulReferenceKeyKioskState extends PaymentStates {}

class ErrorReferenceKeyKioskState extends PaymentStates {}
