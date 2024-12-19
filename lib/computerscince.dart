import 'package:flutter/material.dart';

class Computerscince extends StatelessWidget {
  const Computerscince({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();

    void addComputerScienceTask() {
      if (textController.text.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'New computer science task added: ${textController.text}'),
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
              "Binary Number System",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text("Foundation of computer systems"),
            trailing: Icon(Icons.keyboard_arrow_down),
            children: [
               ListTile(
                leading: Text("1.", style: TextStyle(fontSize: 20),),
                title: Text("Why Binary?", style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text(
                  "- Computers use binary because it is easy to represent using electrical signals (ON and OFF states).\n- It simplifies hardware design.",
                ),
              ),
              ListTile(
                leading: Text("2.",style:TextStyle(fontSize: 20) ,),
                title: Text("Representation", style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text(
                  "- Binary digits are called bits.\n- Example: 1010 (binary) = 10 (decimal).",
                ),
              ),
              ListTile(
                leading: Text("3.", style: TextStyle(fontSize: 20),),
                title: Text("Applications", style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text(
                  "- Data storage: Binary is used to represent all forms of data, including text, images, and audio.\n- Logic operations: Binary logic is the basis for all computational logic gates.",
                ),
              ),
              ListTile(
                leading: Text("4.", style: TextStyle(fontSize: 20),),
                title: Text("Fun Fact", style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text(
                  "The word 'bit' is short for 'binary digit.'",
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
              onPressed: addComputerScienceTask,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
