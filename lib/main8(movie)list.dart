import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

//使用Dio插件
Dio dio = Dio();

//使用Dio从api取数据
  getMovieList() async {
    var response = await dio.get('http://192.168.0.109/api/douban.json');
    //服务器返回的数据
    var result = response.data;
    print(response.data['title']);
  }
  

class MovieList extends StatefulWidget {
  //传页面参数mt
  const MovieList({super.key, required this.mt});
  final String mt;

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {

    //电影列表数据
  var mlist = [];

  @override
    void initState() {
     super.initState();
     getMovieList();
    }

  @override
  Widget build(BuildContext context) {
      return Text('---'); 
/*     return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        var mitem = mlist[index];
        return Text(mitem['title']) ;*/
      }
  }




    //赋值，放到setState中，否则数据不会更新
/* setState(() {
      mlist = result[Title];
    });  */


  
