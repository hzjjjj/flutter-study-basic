import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: '读取本地Json文件',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _items = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('douban.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["movies"];
      print("..number of items ${_items.length}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '读取本地Json文件',
        ),
      ),
      body:Column(
        children: [
          _items.isNotEmpty?Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return Card(
                  key: ValueKey(_items[index]["title"]),
                  margin: const EdgeInsets.all(10),
                  color: Colors.amber.shade100,
                  child: ListTile(
                    //传入数据和设置字体大小
                    //leading: Image.network(_items[index]['img-src'],width: 30, height: 50),  
                    leading: Image.network('https://img01.sogoucdn.com/app/a/100520021/985ec5376b6e798dcf435915ce964d7a'), 
                    trailing: Text(_items[index]["rating"],style: const TextStyle(fontWeight: FontWeight.bold, fontSize:18)),
                    title: Text(_items[index]["title"],style: const TextStyle(fontSize:18)),
                    subtitle: Text(_items[index]["category"]),
                    
                  ),
                );
              },
            ),
          ): ElevatedButton(
              onPressed: () {
                readJson();
              },
              child: Center(child: Text("Load Json")))
        ],
      ),
    );
  }
}