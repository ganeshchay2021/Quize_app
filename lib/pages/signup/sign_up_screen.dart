import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:quiz_app/domain/constant/assets.dart';
import 'package:quiz_app/domain/constant/ui_helper.dart';
import 'package:quiz_app/pages/bottomNavBar/bottom_nav_bar.dart';
import 'package:quiz_app/pages/login/bloc/auth_bloc.dart';
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
  TextEditingController nameController = TextEditingController();

  //declared global key
  final GlobalKey<FormBuilderState> _signUpFormKey =
      GlobalKey<FormBuilderState>();

  bool showLoading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: CustomBackbutton(
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthLoadingState) {
                setState(() {
                  showLoading = true;
                });
              } else {
                setState(() {
                  showLoading = false;
                });
              }

              if (state is AuthErrorState) {
                UiHelper.customToastMsg(
                    tostMsg: state.errorMsg,
                    color: Colors.red,
                    textColor: Colors.white);
              }

              if (state is AuthSuccessState) {
                Navigator.pushReplacement(context, CupertinoPageRoute(builder:(context) => const BottomNavBar(),));
                UiHelper.customToastMsg(
                    tostMsg: "Welcome to the dashboard",
                    color: Colors.green,
                    textColor: Colors.white);
              }
            },
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

                      //name textfield
                      CustomTextField(
                        bottomMargin: 20, // Adds margin below the text field.
                        controller:
                            nameController, // Controller to manage email input.
                        fieldName: "Name", // Field name for reference.
                        title: "Name", // Title displayed above the text field.
                        hintText:
                            "Enter Name", // Hint text inside the text field.
                        icon: Icons.person, // Icon inside the text field.
                        validator: (value) {
                          // Email validation logic.
                          if (value == null || value.isEmpty) {
                            return "Name can't be empty";
                          } else {
                            return null;
                          }
                        },
                      ),

                      //Email text field
                      CustomTextField(
                        bottomMargin: 20, // Adds margin below the text field.
                        controller:
                            emailController, // Controller to manage email input.
                        fieldName: "Email", // Field name for reference.
                        title: "Email", // Title displayed above the text field.
                        hintText:
                            "Enter email", // Hint text inside the text field.
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

                      //Password text field
                      CustomTextField(
                        isPasswordField:
                            true, // Marks this as a password field.
                        bottomMargin:
                            20, // Adds margin below the password field.
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

                      //comform passwor text field
                      CustomTextField(
                        isPasswordField:
                            true, // Marks this as a password field.
                        bottomMargin:
                            10, // Adds margin below the password field.
                        controller:
                            confirmPasswordController, // Controller to manage password input.
                        fieldName:
                            "Confirm Password", // Field name for reference.
                        title:
                            "Confirm Password", // Title displayed above the password field.
                        hintText:
                            "Enter confirm  password", // Hint text inside the password field.
                        icon: Icons.password, // Icon inside the password field.
                        validator: (value) {
                          // Password validation logic.
                          if (value == null || value.isEmpty) {
                            return "Confirm password can't be empty";
                          } else if (passwordController.text !=
                              confirmPasswordController.text) {
                            return "passwords didn't match";
                          } else {
                            return null; // Return null if password is valid.
                          }
                        },
                      ),

                      showLoading
                          ? const Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: SizedBox(
                                height: 50,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            )
                          :
                          //custom signup button
                          CustomButton(
                              onTap: () {
                                FocusScope.of(context).unfocus();

                                if (_signUpFormKey.currentState!
                                    .saveAndValidate()) {
                                  context.read<AuthBloc>().add(
                                        SignInEvent(
                                          name: nameController.text,
                                          email: emailController.text,
                                          passwrod: passwordController.text,
                                        ),
                                      );
                                }
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
        ),
      ),
    );
  }
}
