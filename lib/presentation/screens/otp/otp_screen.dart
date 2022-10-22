import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_flutter_structure/business_logic/otp%20cubit/otp_cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/otp%20cubit/otp_states.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/shared%20widgets/shared_widgets.dart';

import '../../view/otp views/otp_fields.dart';
import '../../widget/otp_widgets/resend_code_button.dart';
import '../../widget/toast.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({Key? key, required this.otpCode, required this.phone})
      : super(key: key);
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final FocusNode _fieldOneNode = FocusNode();
  final FocusNode _fieldTwoNode = FocusNode();
  final FocusNode _fieldThreeNode = FocusNode();
  final FocusNode _fieldFourNode = FocusNode();
  final String otpCode;
  final String phone;

  @override
  Widget build(BuildContext context) {
    _fieldOne.text = otpCode[0];
    _fieldTwo.text = otpCode[1];
    _fieldThree.text = otpCode[2];
    _fieldFour.text = otpCode[3];
    return Scaffold(
        body: GradiantBackground(
      child: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          children: [
            const Spacer(),
            Text(
              "Verify Phone",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.white,
                    fontSize: 30.sp,
                  ),
            ),
            const Spacer(),
            OTPFields(
                fieldOne: _fieldOne,
                fieldTwo: _fieldTwo,
                fieldThree: _fieldThree,
                fieldFour: _fieldFour,
                fieldOneNode: _fieldOneNode,
                fieldTwoNode: _fieldTwoNode,
                fieldThreeNode: _fieldThreeNode,
                fieldFourNode: _fieldFourNode),
            const Spacer(),
            const ResendCodeButton(),
            const Spacer(),
            BlocProvider(
              create: (context) => OtpCubit(),
              child: BlocConsumer<OtpCubit, OtpStates>(
                listener: (context, state) {
                  if (state is OtpVerifySuccessState) {
                    CacheHelper.saveDataSharedPreference(
                        key: 'isLoggedIn', value: true);
                    showToast(
                        toastMessage:
                            "${state.otpResponseModel.message} successfully",
                        backgroundColor: Colors.green);
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.homeScreen,
                      (route) => false,
                    );
                  } else if (state is OtpVerifyErrorState) {
                    showToast(
                        toastMessage: state.errorMessage,
                        backgroundColor: Colors.red);
                  }
                },
                builder: (context, state) {
                  return state is OtpVerifyLoadingState
                      ? const CircularProgressIndicator()
                      : DefaultButton(
                          buttonText: "Verify",
                          onPressed: () async {
                            var manualOtpCode = _fieldOne.text +
                                _fieldTwo.text +
                                _fieldThree.text +
                                _fieldFour.text;
                            if (manualOtpCode.isNotEmpty &&
                                manualOtpCode.length == 4) {
                              await OtpCubit.get(context).verifyAccount(
                                  code: manualOtpCode, phone: phone);
                            } else {
                              showToast(
                                  toastMessage: "Please enter all OTP code",
                                  backgroundColor: Colors.red);
                            }
                          },
                          height: MediaQuery.of(context).size.height / 13,
                        );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
