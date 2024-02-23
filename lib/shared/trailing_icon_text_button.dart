import 'package:flutter/material.dart';

class TrailingIconTextButton extends StatelessWidget {
  const TrailingIconTextButton({
    required this.label,
    required this.color,
    required this.icon,
    required this.onPressed,
    this.fontSize = 20,
    super.key,
  });

  final String label;
  final Color color;
  final Widget icon;
  final VoidCallback onPressed;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        iconColor: color,
        alignment: Alignment.centerLeft,
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.05,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: icon,
          ),
        ],
      ),
    );
  }
}
