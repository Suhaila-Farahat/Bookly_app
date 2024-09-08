import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.backgroundColor, required this.textColor, required this.borderRadius,  this.onPressed});

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final BorderRadius borderRadius;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius:borderRadius

            ),
            backgroundColor: backgroundColor
        ),
        child: Text(
          text,
          style: TextStyle(
              color: textColor,
              fontSize: 20,
              fontFamily: AppFont().cairoRegular,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
