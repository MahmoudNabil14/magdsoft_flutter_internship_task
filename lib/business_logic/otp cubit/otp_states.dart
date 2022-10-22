import 'package:magdsoft_flutter_structure/data/network/responses/otp_response_model.dart';

abstract class OtpStates {}

class OtpInitialState extends OtpStates {}

class OtpVerifyLoadingState extends OtpStates {}

class OtpVerifySuccessState extends OtpStates {
  final OTPResponseModel otpResponseModel;

  OtpVerifySuccessState({
    required this.otpResponseModel,
  });
}

class OtpVerifyErrorState extends OtpStates {
  final String errorMessage;

  OtpVerifyErrorState({required this.errorMessage});
}
