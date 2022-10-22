import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/help%20cubit/help_states.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/remote/dio_helper.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/remote/error/exceptions.dart';
import 'package:magdsoft_flutter_structure/data/models/help_section_model.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/help_response_model.dart';

import '../../constants/end_points.dart';

class HelpCubit extends Cubit<HelpStates> {
  HelpCubit() : super(HelpInitialState());

  static HelpCubit get(context) => BlocProvider.of(context);

  Future<void> getHelpData() async {
    emit(GetHelpDataLoadingState());
    try {
      final Response response = await DioHelper().get(path: getHelpEndPoint);
      HelpResponseModel helpResponseModel =
          HelpResponseModel.fromJson(response.data);
      List<HelpSectionModel> helpSections = [];
      for (var helpSection in helpResponseModel.helpSections) {
        helpSections.add(HelpSectionModel.fromJson(helpSection));
      }
      if (helpResponseModel.status == 200) {
        emit(GetHelpDataSuccessState(helpSections: helpSections));
      } else if (helpResponseModel.status != 200) {
        emit(GetHelpDataErrorState(errorMessage: helpResponseModel.message));
      }
    } on ServerException catch (exception) {
      emit(GetHelpDataErrorState(errorMessage: exception.message!));
    }
  }
}
