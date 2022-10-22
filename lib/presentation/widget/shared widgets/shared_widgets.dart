import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/colors.dart';

class GradiantBackground extends StatelessWidget {
  const GradiantBackground({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          AppColors.primaryColor.withOpacity(0.8),
          AppColors.primaryColor.withOpacity(0.1),
          AppColors.primaryColor.withOpacity(0),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: child,
    );
  }
}

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {Key? key,
      required this.buttonText,
      required this.onPressed,
      required this.height})
      : super(key: key);
  final String buttonText;
  final Function onPressed;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          gradient: LinearGradient(colors: [
            AppColors.primaryColor,
            AppColors.primaryColor.withOpacity(0.65),
            AppColors.primaryColor.withOpacity(0.45),
          ])),
      child: MaterialButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          buttonText,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontSize: 22.0.sp),
        ),
      ),
    );
  }
}

class DefaultTextFormField extends StatelessWidget {
  const DefaultTextFormField(
      {Key? key,
      required this.formKey,
      required this.controller,
      required this.maxLength,
      required this.keyboardType,
      required this.hintText,
      required this.validator})
      : super(key: key);
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  final int maxLength;
  final TextInputType keyboardType;
  final String hintText;
  final Function(String? value) validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.7),
          blurRadius: 10,
        ),
      ]),
      child: Form(
        key: formKey,
        child: TextFormField(
          maxLength: maxLength,
          controller: controller,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontSize: 13.sp, color: Colors.black),
          keyboardType: keyboardType,
          decoration: InputDecoration(
              errorStyle: TextStyle(color: Colors.red, fontSize: 12.sp),
              counterText: "",
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  )),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  )),
              fillColor: AppColors.white,
              filled: true,
              hintText: hintText,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: 12.sp)),
          validator: (value) {
            return validator(value);
          },
          onChanged: (value) {
            if (value.length == 1 || value.isEmpty || value.length == 11) {
              formKey.currentState!.validate();
            }
          },
        ),
      ),
    );
  }
}

class NetworkErrorWidget extends StatelessWidget {
  const NetworkErrorWidget({Key? key, required this.errorMessage})
      : super(key: key);
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontSize: 30.sp, color: Colors.red),
      ),
    );
  }
}
