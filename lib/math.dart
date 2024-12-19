import 'package:flutter/material.dart';

class Math extends StatelessWidget {
  const Math({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();

    void addMathTask() {
      if (textController.text.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('New math task added: ${textController.text}'),
          ),
        );
        textController.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter a task!')),
        );
      }
    }

    return Scaffold(
      body: ListView(
        children: const [
          ExpansionTile(
            title: Text(
              "Pythagorean Theorem",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text("A fundamental principle in geometry"),
            trailing: Icon(Icons.keyboard_arrow_down),
            children: [
              ListTile(
                leading: Text("1.", style: TextStyle(fontSize: 20),),
                title: Text("Theorem Statement",style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text(
                  "In a right triangle, the square of the hypotenuse (the side opposite the right angle) is equal to the sum of the squares of the other two sides.",
                ),
              ),
              ListTile(
                leading: Text("2.",style: TextStyle(fontSize: 20),),
                title: Text("Formula", style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text("c² = a² + b²"),
              ),
              ListTile(
                leading: Text("3.", style: TextStyle(fontSize: 20),),
                title: Text("Application", style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text(
                  "- Used in construction, navigation, and many real-world problem-solving situations.\n- Helps calculate distances in two-dimensional spaces.",
                ),
              ),
              ListTile(
                leading: Text("4.",style: TextStyle(fontSize: 20),),
                title: Text("Example Problem", style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text(
                  "If one side of a right triangle is 3 units and another is 4 units, the hypotenuse is 5 units. (3² + 4² = 5²).",
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: textController,
                decoration: const InputDecoration(
                  hintText: 'Add a new task',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: addMathTask,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
