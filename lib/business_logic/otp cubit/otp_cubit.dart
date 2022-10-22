import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/otp%20cubit/otp_states.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/otp_request_model.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/otp_response_model.dart';

import '../../data/data_providers/remote/dio_helper.dart';
import '../../data/data_providers/remote/error/exceptions.dart';

class OtpCubit extends Cubit<OtpStates> {
  OtpCubit() : super(OtpInitialState());

  static OtpCubit get(context) => BlocProvider.of(context);

  Future<void> verifyAccount(
      {required String code, required String phone}) async {
    emit(OtpVerifyLoadingState());
    try {
      final OTPRequestModel requestModel =
          OTPRequestModel(code: code, phone: phone);
      final Response response = await DioHelper()
          .post(path: otpEndPoint, body: requestModel.toJson());
      final OTPResponseModel otpResponseModel =
          OTPResponseModel.fromJson(response.data);
      if (otpResponseModel.status == 200) {
        emit(OtpVerifySuccessState(otpResponseModel: otpResponseModel));
      } else {
        emit(OtpVerifyErrorState(errorMessage: otpResponseModel.message));
      }
    } on ServerException catch (exception) {
      emit(OtpVerifyErrorState(errorMessage: exception.message!));
    }
  }
}
