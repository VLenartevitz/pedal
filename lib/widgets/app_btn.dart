import 'package:flutter/material.dart';

import '../commons/app_font.dart';


class AppBtn extends StatelessWidget {
  final String text;
  final Widget? icon;
  final Color textColor;
  final Color bgColor;
  final BorderSide? border;
  final Function()? onPressed;

  const AppBtn({
    required this.textColor,
    required this.text,
    required this.bgColor,
    this.border,
    this.onPressed,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        side: border,
        backgroundColor: bgColor,
        elevation: 0,
        minimumSize: const Size.fromHeight(70),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              fontFamily: FontFamily.appFont,
              fontWeight: FontWeight.w500,
              color: textColor,
              fontSize: 20,
            ),
          ),
          icon ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
