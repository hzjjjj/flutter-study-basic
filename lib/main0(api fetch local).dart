import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('http://192.168.0.109/api/douban.json'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final String imgUrl;
  final String lei;
  final String title;

  const Album({
    required this.imgUrl,
    required this.lei,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      imgUrl: json['img-src'] as String,
      lei: json['class'] as String,
      title: json['title'] as String,
    );
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: 
        Row(
          children: [
            FutureBuilder<Album>(
              future: futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    //显示两个数据，并加粗
                    ' ${snapshot.data!.lei} - ${snapshot.data!.title}',
                   // snapshot.data!.title,
                    style: Theme.of(context).textTheme.headlineMedium,
                   );
                } else if (snapshot.hasError) {
                  return Text('Oh...${snapshot.error}');
                }
            
                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
            
          ],
        ),
      ),
    );
  }
}