import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/home_widgets/filter_choice.dart';

class FilterChoicesList extends StatelessWidget {
  const FilterChoicesList(
      {Key? key,
      required this.filterChoicesImages,
      required this.filterChoicesNames})
      : super(key: key);
  final List<String> filterChoicesImages;
  final List<String> filterChoicesNames;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GlobalCubit(),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 11,
        child: BlocBuilder<GlobalCubit, GlobalStates>(
          builder: (context, state) {
            return ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return FilterChoice(
                      filterName: filterChoicesNames[index],
                      filterImagePath: filterChoicesImages[index],
                      defaultChoice:
                          GlobalCubit.get(context).filtersDefaultChoice,
                      onSelected: () {
                        GlobalCubit.get(context)
                            .selectFilter(filterIndex: index);
                      },
                      index: index);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width / 20,
                  );
                },
                itemCount: 4);
          },
        ),
      ),
    );
  }
}
