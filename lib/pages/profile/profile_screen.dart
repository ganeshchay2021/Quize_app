import 'dart:convert';
import 'dart:typed_data';
import 'package:image/image.dart' as img;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quiz_app/domain/constant/ui_helper.dart';
import 'package:quiz_app/pages/login/bloc/auth_bloc.dart';
import 'package:quiz_app/pages/login/login_screen.dart';
import 'package:quiz_app/pages/widgets/custom_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final User? user = FirebaseAuth.instance.currentUser;
  bool isLoading = true;

  Map<String, dynamic>? userData;

  Uint8List? profileImageBytes;
  bool imageLoading = false;

  Future<void> fetchUserData() async {
    if (user == null) return;

    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection("userData")
          .doc(user!.uid)
          .get();
      if (documentSnapshot.exists) {
        setState(() {
          userData = documentSnapshot.data() as Map<String, dynamic>?;
          if (userData?["profile"] != null) {
            profileImageBytes = base64Decode(userData!["profile"]);
          }
          isLoading = false;
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> pickImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      //convert the image into byte
      final imageByte = await pickedFile.readAsBytes();

      img.Image? image = img.decodeImage(imageByte);

      if (image == null) {
        return;
      } else {
        // Resize image to a specific size (e.g., width: 600px)
        img.Image resizedImage = img.copyResize(image, width: 600);

        // Compress the image (encode it to JPG with a quality of 80%)
        Uint8List resizedImageBytes =
            Uint8List.fromList(img.encodeJpg(resizedImage, quality: 80));

        // Step 4: Upload image to Firebase Storage
        await updateProfileImage(resizedImageBytes);
      }
    } else {
      return;
    }
  }

  Future<void> updateProfileImage(Uint8List imageByte) async {
    if (user == null) return;

    try {
      String base64Image = base64Encode(imageByte);
      await FirebaseFirestore.instance
          .collection("userData")
          .doc(user!.uid)
          .set({"profile": base64Image}, SetOptions(merge: true));

      setState(() {
        profileImageBytes = imageByte;
      });
    } catch (e) {
      debugPrint(
        e.toString(),
      );
    }
  }

  @override
  void initState() {
    fetchUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: UiHelper.customText(text: "Profile", color: Colors.white),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : userData == null
              ? Center(
                  child: UiHelper.customText(text: "No User Found"),
                )
              : Padding(
                  padding: const EdgeInsets.all(15),
                  child: Center(
                    child: BlocListener<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state is AuthErrorState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red.shade300,
                              content: Column(
                                children: [
                                  UiHelper.customText(
                                    text: state.errorMsg,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }

                        if (state is AuthSuccessState) {
                          Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: pickImageFromGallery,
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.deepPurple,
                              backgroundImage: profileImageBytes != null
                                  ? MemoryImage(profileImageBytes!)
                                  : const NetworkImage(
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgu_nuqDR_pR2-10KbNon-YTUUEoNGJ9lR1A&s")
                                      as ImageProvider,
                              child: const Align(
                                alignment: Alignment.bottomRight,
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 16,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          UiHelper.customText(
                            text: userData?["name"],
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          UiHelper.customText(
                            text: "Total Score: ${userData?["score"] * 1}",
                            fontSize: 18,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w400,
                          ),
                          CustomButton(
                            btnName: "Sign Out",
                            btnColor: Colors.deepPurple,
                            horizontalMargin: 40,
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return CupertinoAlertDialog(
                                    insetAnimationCurve: Curves.ease,
                                    title: UiHelper.customText(
                                      text: "Sign out",
                                      fontSize: 20,
                                    ),
                                    content: UiHelper.customText(
                                        text:
                                            "Are you sure you want to sign out?",
                                        fontSize: 16),
                                    actions: [
                                      CustomButton(
                                        btnName: "Cancel",
                                        btnColor: Colors.deepPurple.shade300,
                                        horizontalMargin: 10,
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                      CustomButton(
                                        btnName: "Yes",
                                        btnColor: Colors.deepPurple.shade300,
                                        horizontalMargin: 10,
                                        onTap: () {
                                          context
                                              .read<AuthBloc>()
                                              .add(LogoutEvent());
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            CupertinoPageRoute(
                                                builder: (context) =>
                                                    const LoginScreen()),
                                            (route) => false,
                                          );
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
    );
  }
}
