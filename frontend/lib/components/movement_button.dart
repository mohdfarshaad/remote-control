import 'package:flutter/material.dart';

class MovementButton extends StatelessWidget {
  final IconData icon;
  const MovementButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 60,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(child: Icon(icon, size: 30, color: Colors.white)),
    );
  }
}
