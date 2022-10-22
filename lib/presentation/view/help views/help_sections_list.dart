import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/help%20cubit/help_states.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/shared%20widgets/shared_widgets.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';

import '../../../business_logic/help cubit/help_cubit.dart';
import '../../widget/help widgets/help_section.dart';

class HelpSectionsList extends StatelessWidget {
  const HelpSectionsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HelpCubit, HelpStates>(
      listener: (context, state) {
        if (state is GetHelpDataErrorState) {
          showToast(
              toastMessage: state.errorMessage, backgroundColor: Colors.red);
        }
      },
      builder: (context, state) {
        return state is GetHelpDataSuccessState
            ? Expanded(
                flex: 5,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (BuildContext context, int index) {
                    return HelpSection(
                      question: state.helpSections[index].question,
                      answer: state.helpSections[index].answer,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 25,
                    );
                  },
                  itemCount: state.helpSections.length,
                ),
              )
            : state is GetHelpDataLoadingState
                ? const Center(child: CircularProgressIndicator())
                : state is GetHelpDataErrorState
                    ? Expanded(
                        flex: 100,
                        child: NetworkErrorWidget(
                            errorMessage: state.errorMessage),
                      )
                    : const SizedBox();
      },
    );
  }
}
