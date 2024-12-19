import 'package:flutter/material.dart';
import 'package:highseas4/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {  
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes the debug banner
      home: Scaffold(
        body: SafeArea(
          child: Container(
            color: const Color.fromARGB(255, 205, 213, 208),
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    "images/welcomepage2.jpg",
                    fit: BoxFit.fill, // Adjusts the image to fit the screen
                  ),
                ),
                Builder( // Wrap button in Builder to fix Navigator context issue
                  builder: (newContext) => ElevatedButton(
                    onPressed: () {
                      Navigator.of(newContext).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const Homepage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12),
                    ),
                    child: const Text("Get Started"),
                  ),
                ), 
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
 