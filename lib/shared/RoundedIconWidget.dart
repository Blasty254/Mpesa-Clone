import 'package:flutter/material.dart';

class RoundIconTextWidget extends StatelessWidget {
  final String imagePath;
  final String text;

  const RoundIconTextWidget({
    super.key,
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 35.0, // Specify your desired size
          height: 35.0, // Specify your desired size
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(height: 8), // Space between icon and text
        Text(text),
      ],
    );
  }
}
