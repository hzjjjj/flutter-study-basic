import 'dart:math';

import 'package:flutter/material.dart';

class RandomNamePickerPage extends StatefulWidget {
  final List<String> classmates;

  RandomNamePickerPage({required this.classmates});

  @override
  _RandomNamePickerPageState createState() => _RandomNamePickerPageState();
}

class _RandomNamePickerPageState extends State<RandomNamePickerPage> {
  late String _selectedName;

  @override
  void initState() {
    super.initState();
    _selectedName = widget.classmates.first;
  }

  void _pickRandomName() {
    setState(() {
      _selectedName = widget.classmates[Random().nextInt(widget.classmates.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('随机点名'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '被点名的同学是：',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              _selectedName,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: _pickRandomName,
              child: Text('随机点名'),
            ),
          ],
        ),
      ),
    );
  }
}
