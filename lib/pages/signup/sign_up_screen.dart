import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:quiz_app/domain/constant/assets.dart';
import 'package:quiz_app/domain/constant/ui_helper.dart';
import 'package:quiz_app/pages/widgets/custom_backbutton.dart';
import 'package:quiz_app/pages/widgets/custom_button.dart';
import 'package:quiz_app/pages/widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // TextControllers to capture user input for email and password.
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  //declared global key
  final GlobalKey<FormBuilderState> _signUpFormKey =
      GlobalKey<FormBuilderState>();

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
          key: _signUpFormKey, //login form key
          child: SingleChildScrollView(
            child: GestureDetector(
              onTap: () {
                //unfocused the keyboard
                FocusScope.of(context).unfocus();
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment
                    .start, // Align the children widgets to the top.
                children: [
                  // Displays the login screen image.
                  UiHelper.assetsImage(
                    image: Assets.signup,
                    height: 200,
                    boxFit: BoxFit.cover,
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  //custom text field
                  CustomTextField(
                    bottomMargin: 20, // Adds margin below the text field.
                    controller:
                        emailController, // Controller to manage email input.
                    fieldName: "Email", // Field name for reference.
                    title: "Email", // Title displayed above the text field.
                    hintText: "Enter email", // Hint text inside the text field.
                    icon: Icons.email, // Icon inside the text field.
                    validator: (value) {
                      // Email validation logic.
                      if (value == null || value.isEmpty) {
                        return "Email can't be empty";
                      } else if (EmailValidator.validate(value)) {
                        return null; // Return null if email is valid.
                      } else {
                        return "Please enter a valid email";
                      }
                    },
                  ),

                  //custom text field
                  CustomTextField(
                    isPasswordField: true, // Marks this as a password field.
                    bottomMargin: 20, // Adds margin below the password field.
                    controller:
                        passwordController, // Controller to manage password input.
                    fieldName: "Password", // Field name for reference.
                    title:
                        "Password", // Title displayed above the password field.
                    hintText:
                        "Enter password", // Hint text inside the password field.
                    icon: Icons.password, // Icon inside the password field.
                    validator: (value) {
                      // Password validation logic.
                      if (value == null || value.isEmpty) {
                        return "Password can't be empty";
                      } else {
                        return null; // Return null if password is valid.
                      }
                    },
                  ),
                  CustomTextField(
                    isPasswordField: true, // Marks this as a password field.
                    bottomMargin: 10, // Adds margin below the password field.
                    controller:
                        confirmPasswordController, // Controller to manage password input.
                    fieldName: "Confirm Password", // Field name for reference.
                    title:
                        "Confirm Password", // Title displayed above the password field.
                    hintText:
                        "Enter confirm  password", // Hint text inside the password field.
                    icon: Icons.password, // Icon inside the password field.
                    validator: (value) {
                      // Password validation logic.
                      if (value == null || value.isEmpty) {
                        return "Confirm password can't be empty";
                      } else {
                        return null; // Return null if password is valid.
                      }
                    },
                  ),

                  //custom login button
                  CustomButton(
                    onTap: () {
                      FocusScope.of(context).unfocus();

                      if (_signUpFormKey.currentState!.saveAndValidate()) {}
                    },
                    horizontalMargin: 40,
                    btnName: "Sign Up",
                    btnColor: Colors.deepPurple,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
