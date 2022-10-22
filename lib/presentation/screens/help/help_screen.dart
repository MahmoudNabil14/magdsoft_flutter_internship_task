import 'package:flutter/material.dart';

import '../../view/help views/help_sections_list.dart';
import '../../widget/help widgets/help_text.dart';
import '../../widget/shared widgets/shared_widgets.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradiantBackground(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 16,
              ),
              const HelpText(),
              SizedBox(
                height: MediaQuery.of(context).size.height / 16,
              ),
              const HelpSectionsList(),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 12),
                child: DefaultButton(
                  buttonText: "Continue",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  height: MediaQuery.of(context).size.height / 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
