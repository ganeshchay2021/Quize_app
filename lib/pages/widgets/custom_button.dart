// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:quiz_app/domain/constant/ui_helper.dart';

class CustomButton extends StatelessWidget {
  final String btnName;
  final Color btnColor;
  final double horizontalMargin;
  final VoidCallback onTap;

  const CustomButton({
    super.key,
    required this.btnName,
    required this.btnColor,
    required this.horizontalMargin, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalMargin, vertical: 20),
      child: MaterialButton(
        onPressed: onTap,
        color: btnColor,
        height: 50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        minWidth: double.infinity,
        child: UiHelper.customText(
          text: btnName,
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
