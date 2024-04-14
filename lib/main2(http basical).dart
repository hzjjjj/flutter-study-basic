import 'dart:async';
import 'dart:convert';
//import 'dart:convert';
import 'package:dio/dio.dart';
//import 'package:flutter/material.dart';

//import 'dart:io';

import 'package:http/http.dart' as http;


void main(List<String> arguments) async {
	await dioTest2();
}

// 可用的Dio包OK! await dioTest();
Future<void> dioTest() async {
  Dio dio = Dio();
  Response response = await dio.get('https://api.breakingbadquotes.xyz/v1/quotes/3/');
  print(response.data);
}

// 可用的http包OK! await httpTest();
Future<void> httpTest() async {
  http.Client client = http.Client();
  http.Response response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/2/'));
  print(response.body);
}

Future<void> dioTest2() async {
  Dio dio = Dio();
  Response response;
  response = await dio.get('http://192.168.0.109/api/douban.json');
  final data = jsonEncode(response);
  print(data.toString());

}

//api https://api.breakingbadquotes.xyz/v1/quotes/5/ http://www.weather.com.cn/data/sk/101010100.html
