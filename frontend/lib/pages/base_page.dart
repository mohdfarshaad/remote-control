import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frontend/pages/movement_page.dart';
import 'package:frontend/pages/speech_page.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  static const List<Widget> _pages = <Widget>[MovementPage(), SpeechPage()];

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Robo", style: GoogleFonts.cedarvilleCursive(fontSize: 50)),
        centerTitle: true,
      ),
      body: BasePage._pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.control_point_duplicate),
            label: 'Movement',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.mic), label: 'Talk'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
