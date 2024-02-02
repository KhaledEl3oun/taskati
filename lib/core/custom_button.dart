import 'package:flutter/material.dart';
import 'package:taskati/core/app_color.dart';
import 'package:taskati/core/text_style.dart';

class customButton extends StatelessWidget {
  const customButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: appColors.primaryColor,
            foregroundColor: appColors.whiteColor),
        onPressed: onPressed,
        child: Text(
          text,
          style: getBodyStyle(color: appColors.whiteColor),
        ));
  }
}
