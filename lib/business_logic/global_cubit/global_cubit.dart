import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalStates> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);
  int filtersDefaultChoice = 0;

  void selectFilter({required int filterIndex}) {
    filtersDefaultChoice = filterIndex;
    emit(ChangeFiltersChoice());
  }
}
