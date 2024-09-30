import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text; // The text to display
  final double fontSize; // Font size
  final FontWeight fontWeight; // Font weight
  final Color color; // Text color
  final TextAlign textAlign; // Text alignment
  final int maxLines; // Maximum number of lines
  final TextOverflow overflow; // Overflow behavior

  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 14.0, // Default font size
    this.fontWeight = FontWeight.normal, // Default font weight
    this.color = Colors.black, // Default text color
    this.textAlign = TextAlign.left, // Default text alignment
    this.maxLines = 1, // Default max lines
    this.overflow = TextOverflow.ellipsis, // Default overflow behavior
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
