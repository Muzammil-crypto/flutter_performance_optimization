import 'package:flutter/material.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color color;
  final Color textColor;
  final double elevation;
  final double borderRadius;

  const CustomPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = double.infinity, // Full width by default
    this.height = 50.0, // Default height
    this.color = Colors.blue, // Default primary color
    this.textColor = Colors.white, // Default text color
    this.elevation = 2.0, // Default elevation
    this.borderRadius = 8.0, // Default border radius
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor, backgroundColor: color, // Text color
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
