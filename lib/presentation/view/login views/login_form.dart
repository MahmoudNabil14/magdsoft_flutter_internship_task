import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/colors.dart';
import '../../widget/login widgets/divider_line.dart';
import '../../widget/login widgets/login_button.dart';
import '../../widget/shared widgets/shared_widgets.dart';

class LoginForm extends StatelessWidget {
  const LoginForm(
      {Key? key,
      required this.nameFormKey,
      required this.phoneFormKey,
      required this.nameController,
      required this.phoneController})
      : super(key: key);

  final GlobalKey<FormState> nameFormKey;
  final GlobalKey<FormState> phoneFormKey;
  final TextEditingController nameController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(2, 5), // changes position of shadow
          ),
        ],
      ),
      padding: const EdgeInsets.all(30),
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'Welcome',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 30.sp),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 55),
          const DividerLine(),
          SizedBox(
            height: MediaQuery.of(context).size.height / 18.2,
          ),
          DefaultTextFormField(
            formKey: nameFormKey,
            controller: nameController,
            maxLength: 35,
            keyboardType: TextInputType.text,
            hintText: "Enter Your Full Name",
            validator: (value) {
              if (value!.isEmpty) {
                return "Full Name mustn't be empty";
              }
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 41,
          ),
          DefaultTextFormField(
            formKey: phoneFormKey,
            controller: phoneController,
            maxLength: 11,
            keyboardType: TextInputType.number,
            hintText: "Enter Your Phone Number",
            validator: (value) {
              if (value!.isEmpty) {
                return "Phone Number mustn't be empty";
              } else if (value.length < 11) {
                return "Phone Number must be 11 numbers";
              }
              return null;
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 23.5,
          ),
          LoginButton(
              nameFormKey: nameFormKey,
              phoneFormKey: phoneFormKey,
              nameController: nameController,
              phoneController: phoneController)
        ],
      ),
    );
  }
}
