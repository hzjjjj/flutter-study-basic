import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exploration!',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Space Exploration Planner!"),
      ),
      body: Column(
        children: [
          Progress(),
          TaskList(),
          ],
        ),
    );
  }
}

class Progress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("You are this far away from exploring the whole universe:"),
        LinearProgressIndicator(value: 0.0),
      ],
    );
  }
}

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TaskItem(label:"1 Load rocket with supplies"),
        TaskItem(label:"2 Launch rocket"),
        TaskItem(label:"3 Circle the home planet"),
        TaskItem(label:"4 Head out to the first moon"),
        TaskItem(label:"5 Launch moon lander #1"),
        TaskItem(label:"和平，是人类永恒的主题"),
        TaskItem(label:"杭州，是我们的家园"),
        TaskItem(label:"和平是幸福的源泉。我们要感恩和平，珍惜和平."),
      ],
    );
  }
}

class TaskItem extends StatefulWidget {
  final String label;

  TaskItem({Key? key, required this.label}) : super(key: key);

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool? _value = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          onChanged: (newValue) => setState(() => _value = newValue), 
          value: _value,
          ),
        Text(widget.label),
      ],
    );
  }
}