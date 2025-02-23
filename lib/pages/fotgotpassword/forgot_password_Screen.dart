import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quiz_app/domain/constant/assets.dart';
import 'package:quiz_app/domain/constant/ui_helper.dart';
import 'package:quiz_app/pages/fotgotpassword/bloc/forgot_password_bloc.dart';
import 'package:quiz_app/pages/widgets/custom_backbutton.dart';
import 'package:quiz_app/pages/widgets/custom_button.dart';
import 'package:quiz_app/pages/widgets/custom_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  final GlobalKey<FormBuilderState> _otpFormKey = GlobalKey<FormBuilderState>();

  bool showLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackbutton(
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
        listener: (context, state) {
          if (state is ForgotPasswordLoadingState) {
            setState(() {
              showLoading = true;
            });
          } else {
            setState(() {
              showLoading = false;
            });
          }

          if (state is ForgotPasswordErrorState) {
            UiHelper.customToastMsg(
              tostMsg: state.errorMsg,
              color: Colors.red,
              textColor: Colors.white,
            );
          }

          if (state is ForgotPasswordSuccessState) {
            Navigator.pop(context);
            UiHelper.customToastMsg(
              tostMsg:
                  "A reset password link send to the email,\nplease check your email.",
              color: Colors.deepPurple,
              textColor: Colors.green,
            );
          }
        },
        child: SafeArea(
          child: FormBuilder(
            key: _otpFormKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  UiHelper.assetsImage(image: Assets.reset),
                  const SizedBox(
                    height: 20,
                  ),
                  UiHelper.customText(
                      text:
                          "Enter your register email address\nWe will send an OTP to your email address",
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                      color: Colors.grey.shade500),
                  CustomTextField(
                    bottomMargin: 10,
                    controller: emailController,
                    fieldName: "Email",
                    title: "",
                    hintText: "Enter email",
                    icon: Icons.email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email can't be empty";
                      } else if (EmailValidator.validate(value)) {
                        return null;
                      } else {
                        return "Please enter a valid email";
                      }
                    },
                  ),
                  showLoading
                      ? const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        )
                      : CustomButton(
                          btnName: "Continue",
                          btnColor: Colors.deepPurple,
                          horizontalMargin: 35,
                          onTap: () {
                            if (_otpFormKey.currentState!.saveAndValidate()) {
                              Fluttertoast.cancel();
                              context.read<ForgotPasswordBloc>().add(
                                  SendResetPassLinkToEmail(
                                      email: emailController.text.trim()));
                            }
                          })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
