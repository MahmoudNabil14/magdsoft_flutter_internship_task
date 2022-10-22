import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/help%20widgets/help_section_shadow.dart';

import '../../view/help views/help_section_tile.dart';

class HelpSection extends StatelessWidget {
  const HelpSection({
    Key? key,
    required this.question,
    required this.answer,
  }) : super(key: key);
  final String question;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return HelpSectionShadow(
        child: HelpSectionTile(
      question: question,
      answer: answer,
    ));
  }
}
