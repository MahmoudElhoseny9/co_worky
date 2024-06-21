import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text; // Variable for button text
  final Color textColor; // Variable for text color
  final Color backgroundColor; // Variable for background color
  final Color? borderColor; // Variable for background color
  final Function() onPressed; // Function to execute on button press
  final double? width; // Optional variable for button width
  final double? height; // Optional variable for button height
  final IconData? icon; // Optional variable for button icon

  const CustomButton({
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    this.borderColor,
    required this.onPressed,
    this.width, // Optional width parameter
    this.height,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(width ?? double.infinity, height ?? 50.0),
          backgroundColor: backgroundColor,
          foregroundColor: textColor, //text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: borderColor != null
                ? // Check if borderColor is not null
                BorderSide(color: borderColor!)
                : // Use null-safe operator
                BorderSide.none,
          ),
        ),
        label: Text(text), // Set button text
        icon: icon != null
            ? Icon(icon, color: textColor)
            : const SizedBox(
                width: 0,
              ),
      ),
    );
  }
}
