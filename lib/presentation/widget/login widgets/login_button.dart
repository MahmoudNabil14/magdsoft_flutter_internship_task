import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/login%20cubit/login_cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/login%20cubit/login_states.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/shared%20widgets/shared_widgets.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';

import '../../router/app_router.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(
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
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            Navigator.pushNamed(context, Routes.otpScreen, arguments: {
              "otpCode": state.loginResponseModel.code,
              "phone": phoneController.text,
            });
            showToast(
                toastMessage:
                    "Your OTP code is ${state.loginResponseModel.code}",
                backgroundColor: Colors.green);
            nameController.clear();
            phoneController.clear();
          } else if (state is LoginErrorState) {
            showToast(
                toastMessage: state.errorMessage, backgroundColor: Colors.red);
          }
        },
        builder: (context, state) {
          return state is LoginLoadingState
              ? const CircularProgressIndicator()
              : DefaultButton(
                  buttonText: "Login",
                  onPressed: () async {
                    ///validate phone before if cause if condition validates the first function only
                    phoneFormKey.currentState!.validate();
                    if (nameFormKey.currentState!.validate() &&
                        phoneFormKey.currentState!.validate()) {
                      ///to dismiss the keyboard
                      FocusScope.of(context).requestFocus(FocusNode());
                      await LoginCubit.get(context).login(
                          phone: phoneController.text,
                          name: nameController.text);
                    }
                  },
                  height: MediaQuery.of(context).size.height / 16,
                );
        },
      ),
    );
  }
}
