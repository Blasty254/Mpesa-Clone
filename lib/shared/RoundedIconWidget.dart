import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RoundIconTextWidget extends StatelessWidget {
  final String? imagePath;
  final String? lottiePath;
  final String text;
  final VoidCallback? onTap;

  const RoundIconTextWidget({
    super.key,
    this.imagePath,
    this.lottiePath,
    required this.text,
    this.onTap,
  }) : assert(imagePath != null || lottiePath != null,
            'Either an image path or a lottiePath must be provided .');

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (imagePath != null) // If imagePath is provided, display the image
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 35.0, // Specify your desired size
              height: 35.0, // Specify your desired size
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(imagePath!),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          )
        else if (lottiePath !=
            null) // If lottiePath is provided, display the Lottie animation
          GestureDetector(
            onTap: onTap,
            child: ClipOval(
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary),
                child: Lottie.asset(
                  lottiePath!,
                  width: 35.0, // Specify your desired size
                  height: 35.0, // Specify your desired size
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        const SizedBox(height: 8), // Space between icon and text.
        Text(text),
      ],
    );
  }
}
