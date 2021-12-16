import 'package:fast_credit/utils/colors.dart';
import 'package:flutter/material.dart';

class GeneralWidgets {
  generalButton(
      {final double width,
      final Function onPressed,
      final BorderRadius borderRadius,
      final String buttonText,
      final Color backgroundColor,
      final Color buttonTextColor}) {
    return SizedBox(
        height: 60,
        width: width,
        child: MaterialButton(
          elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              // side: BorderSide(color: borderColor),
            ),
            textColor: AppColors.white,
            color: backgroundColor,
            onPressed: () {
              onPressed();
            },
            child: FittedBox(
              child: Text(
                buttonText,
                style: TextStyle(
                    color: buttonTextColor, fontWeight: FontWeight.bold),
              ),
            )));
  }
}
