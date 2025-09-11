import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/components/movement_button.dart';
import 'package:http/http.dart' as http;

class MovementPage extends StatelessWidget {
  final String serverUrl = "http://10.125.235.83:5000/command";
  const MovementPage({super.key});

  Future<void> sendCommand(String direction) async {
    try {
      final response = await http.post(
        Uri.parse(serverUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"direction": direction}),
      );
      print("Sent $direction, Response: ${response.body}");
    } catch (e) {
      print("Error: $e");
    }
  }

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
              const SizedBox(height: 50),

              // Forward
              MovementButton(
                icon: Icons.arrow_upward,
                onStart: () => sendCommand("forward"),
                onStop: () => sendCommand("stop"),
              ),
              const SizedBox(height: 15),

              // Left / Stop / Right
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MovementButton(
                    icon: Icons.arrow_left,
                    onStart: () => sendCommand("right"),
                    onStop: () => sendCommand("stop"),
                  ),
                  const SizedBox(width: 30),
                  // MovementButton(
                  //   icon: Icons.stop,
                  //   onStart: () => sendCommand("stop"),
                  //   onStop: () {},
                  // ),
                  const SizedBox(width: 30),
                  MovementButton(
                    icon: Icons.arrow_right,
                    onStart: () => sendCommand("left"),
                    onStop: () => sendCommand("stop"),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              // Backward
              MovementButton(
                icon: Icons.arrow_downward,
                onStart: () => sendCommand("backward"),
                onStop: () => sendCommand("stop"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
