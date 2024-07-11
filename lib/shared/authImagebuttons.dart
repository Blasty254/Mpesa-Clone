import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LoginMethodButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const LoginMethodButton({
    super.key,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        padding: EdgeInsets.all(10),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
