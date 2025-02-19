import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quiz_app/domain/constant/assets.dart';
import 'package:quiz_app/domain/constant/ui_helper.dart';
import 'package:quiz_app/pages/widgets/custom_backbutton.dart';
import 'package:quiz_app/pages/widgets/custom_button.dart';
import 'package:quiz_app/pages/widgets/custom_text_field.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController otpController = TextEditingController();

  final GlobalKey<FormBuilderState> _otpFormKey = GlobalKey<FormBuilderState>();

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
      body: SafeArea(
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
                    text: "Enter OTP Here...!",
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                    color: Colors.grey.shade500),
                CustomTextField(
                  bottomMargin: 10,
                  controller: otpController,
                  fieldName: "OTP",
                  title: "",
                  hintText: "Enter OTP",
                  icon: Icons.output,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field can't be empty";
                    } else {
                      return null;
                    }
                  },
                ),
                CustomButton(
                    btnName: "Continue",
                    btnColor: Colors.deepPurple,
                    horizontalMargin: 35,
                    onTap: () {
                      if (_otpFormKey.currentState!.saveAndValidate()) {
                        Fluttertoast.cancel();
                        // context.read<AuthBloc>().add(
                        //       LoginEvent(
                        //           email: emailController.text,
                        //           passwrod: passwordController.text),
                        //     );
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
