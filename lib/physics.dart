import 'package:flutter/material.dart';

class Physics extends StatelessWidget {
  const Physics({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();

    void addPhysicsTask() {
      if (textController.text.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('New physics task added: ${textController.text}'),
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
              "Scientific Method",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text("Scientific way of thinking"),
            trailing: Icon(Icons.keyboard_arrow_down),
            children: [
               ListTile(
                leading: SizedBox(
                  width: 24,
                  child: Text("1.",style: TextStyle(fontSize: 20),),
                ),
                title: Text("Observation",style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text(
                  "- Identify a phenomenon, problem, or question you are curious about.\n- Gather information using your senses or tools to better understand the situation.",
                ),
              ),
              ListTile(
                leading: SizedBox(
                  width: 24,
                  child: Text("2.", style: TextStyle(fontSize: 20),),
                ),
                title: Text("Research", style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text(
                  "- Conduct background research to learn what is already known about the topic.\n- Use reliable sources such as books, scientific articles, or expert opinions.",
                ),
              ),
              ListTile(
                leading: SizedBox(
                  width: 24,
                  child: Text("3.",style:TextStyle(fontSize: 20) ,),
                ),
                title: Text("Formulate a Hypothesis", style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text(
                  "Develop a testable and measurable statement predicting the outcome of your experiment or study.\nExample: \"If [independent variable], then [dependent variable] will [expected result].\"",
                ),
              ),
              ListTile(
                leading: SizedBox(
                  width: 24,
                  child: Text("4.",style:TextStyle(fontSize: 20) ,),
                ),
                title: Text("Experiment",style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text(
                  "- Design and perform a controlled experiment to test your hypothesis.",
                ),
              ),
              ListTile(
                leading: SizedBox(
                  width: 24,
                  child: Text("5.", style: TextStyle(fontSize: 20),),
                ),
                title: Text("Analyze Data",style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text(
                  "- Examine the data you collected using charts, graphs, or statistical tools.",
                ),
              ),
              ListTile(
                leading: SizedBox(
                  width: 24,
                  child: Text("6.",style: TextStyle(fontSize: 20),),
                ),
                title: Text("Repeat and Refine",style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text(
                  "- Repeat experiments to confirm results or refine methods to explore new questions.",
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
              onPressed: addPhysicsTask,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
