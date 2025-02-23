// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomBackbutton extends StatelessWidget {
  final VoidCallback onTap;
  final Color? color;
  const CustomBackbutton({
    super.key,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Icon(
          Icons.arrow_back_ios,
          color: color ?? Colors.black,
        ));
  }
}
