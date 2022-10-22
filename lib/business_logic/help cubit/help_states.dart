import '../../data/models/help_section_model.dart';

abstract class HelpStates {}

class HelpInitialState extends HelpStates {}

class GetHelpDataLoadingState extends HelpStates {}

class GetHelpDataSuccessState extends HelpStates {
  final List<HelpSectionModel> helpSections;

  GetHelpDataSuccessState({required this.helpSections});
}

class GetHelpDataErrorState extends HelpStates {
  final String errorMessage;

  GetHelpDataErrorState({required this.errorMessage});
}
