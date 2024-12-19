import 'package:flutter/material.dart';
import 'package:highseas4/notes.dart';
import 'package:highseas4/pomodoropage.dart';
import 'package:highseas4/todolist.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentindex = 1;

  final List<Widget> _list = [
    const PomodoroClock(),
    const Todolist(),    // Now just returns a Scaffold, no MaterialApp
    const Notes(),       // Make sure Notes is defined in notes.dart
  ];

  final List<Color> _selectedColors = [
    Colors.red,   // Color for "Pomodoro"
    Colors.blue,  // Color for "To-Do List"
    Colors.black, // Color for "Take Notes"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _list[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentindex,
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
        selectedItemColor: _selectedColors[currentindex],
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm, color: Colors.red),
            label: "Pomodoro", 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_sharp, color: Colors.blue),
            label: "To-Do List" 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note, color: Colors.black),
            label: "Take Notes",
          ),
        ],
      ),
    );
  }
}
