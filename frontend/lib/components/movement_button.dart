import 'package:flutter/material.dart';

class MovementButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onStart;
  final VoidCallback onStop;
  const MovementButton({
    super.key,
    required this.icon,
    required this.onStart,
    required this.onStop,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => onStart(),
      onTapUp: (_) => onStop(),
      onTapCancel: () => onStop(),
      child: Container(
        padding: EdgeInsets.all(10),
        width: 60,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(child: Icon(icon, size: 30, color: Colors.white)),
      ),
    );
  }
}
