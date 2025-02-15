import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:quiz_app/domain/constant/assets.dart';
import 'package:quiz_app/domain/constant/ui_helper.dart';
import 'package:quiz_app/pages/login/widgets/login_header_text.dart';
import 'package:quiz_app/pages/widgets/custom_button.dart';
import 'package:quiz_app/pages/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // TextControllers to capture user input for email and password.
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //declared global key
  final GlobalKey<FormBuilderState> _loginFormKey =
      GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FormBuilder(
          key: _loginFormKey, //login form key
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
                  const SizedBox(
                    height: 20,
                  ),

                  // Custom widget for login screen header.
                  const LoginHeaderText(),

                  const SizedBox(
                    height: 30,
                  ),

                  // Displays the login screen image.
                  UiHelper.assetsImage(
                    image: Assets.login,
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
                    bottomMargin: 10, // Adds margin below the password field.
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          child: UiHelper.customText(
                            text: "Forget Password?", // Text for the link.
                            color: Colors.deepPurple, // Color of the link text.
                            fontSize: 15, // Font size for the text.
                            fontWeight:
                                FontWeight.w600, // Font weight for the text.
                          ),
                        )
                      ],
                    ),
                  ),

                  //custom login button
                  CustomButton(
                    onTap: () {
                      FocusScope.of(context).unfocus();

                      if (_loginFormKey.currentState!.saveAndValidate()) {}
                    },
                    horizontalMargin: 40,
                    btnName: "Login",
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
