import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/login%20cubit/login_states.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/remote/error/exceptions.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/login_response_model.dart';

import '../../constants/end_points.dart';
import '../../data/data_providers/remote/dio_helper.dart';
import '../../data/network/requests/login_request_model.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  Future<void> login({required String phone, required String name}) async {
    emit(LoginLoadingState());
    try {
      final LoginRequestModel requestModel =
          LoginRequestModel(phone: phone, name: name);
      final Response response = await DioHelper()
          .post(path: verifyPhoneEndpoint, body: requestModel.toJson());
      final LoginResponseModel loginResponseModel =
          LoginResponseModel.fromJson(response.data);
      if (loginResponseModel.status == 200) {
        emit(LoginSuccessState(loginResponseModel: loginResponseModel));
      } else {
        emit(LoginErrorState(errorMessage: loginResponseModel.message));
      }
    } on ServerException catch (exception) {
      emit(LoginErrorState(errorMessage: exception.message!));
    }
  }
}
