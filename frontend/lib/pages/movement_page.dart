import 'package:flutter/material.dart';
import 'package:frontend/components/movement_button.dart';

class MovementPage extends StatelessWidget {
  const MovementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              SizedBox(height: 50),
              MovementButton(icon: Icons.arrow_left),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MovementButton(icon: Icons.arrow_left),
                  SizedBox(width: 15),
                  MovementButton(icon: Icons.stop),
                  SizedBox(width: 15),
                  MovementButton(icon: Icons.arrow_right),
                ],
              ),
              SizedBox(height: 15),
              MovementButton(icon: Icons.arrow_left),
            ],
          ),
        ),
      ),
    );
  }
}
