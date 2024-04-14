import 'package:flutter/material.dart';
import './main8(movie)list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '电影APP',
      home: const MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    //底部TAB页要加控制TabController
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          //顶部
          appBar: AppBar(
            title: Text('电影列表'),
            backgroundColor: const Color.fromARGB(255, 1, 82, 149),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              )
            ],
          ),
          //侧边栏
          drawer: Drawer(
            width: 380,
            child: ListView(
              children: const <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text('张三'),
                  accountEmail: Text('abc@qq.com'),
                  currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://img01.sogoucdn.com/app/a/100520021/985ec5376b6e798dcf435915ce964d7a')),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'http://5b0988e595225.cdn.sohucs.com/images/20180720/7affa5ffd6c541daa3f14094006adb5c.jpeg')),
                  ),
                ),
                ListTile(
                  title: Text('用户反馈'),
                  trailing: Icon(Icons.feedback),
                ),
                ListTile(
                  title: Text('系统设置'),
                  trailing: Icon(Icons.settings),
                ),
                ListTile(
                  title: Text('我要发布'),
                  trailing: Icon(Icons.send),
                ),
                //分割线
                Divider(),
                ListTile(
                  title: Text('注销'),
                  trailing: Icon(Icons.exit_to_app),
                ),
              ],
            ),
          ),
          //3个展示页面Tab
          body: TabBarView(children: <Widget>[
            //导入3个stateful页面，其中参数不同参数为mt
            MovieList(mt: 'in_theaters'),
            MovieList(mt: 'top100'),
            MovieList(mt: 'coming_soon'),
          ]),
          //底部TabBar
          bottomNavigationBar: Container(
            //加颜色美化底菜单
            decoration: BoxDecoration(color: Colors.black12),
            height: 70,
            child: TabBar(
              //底菜单字体样式
              labelStyle: TextStyle(height: 0,fontSize: 16),
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.movie_filter),
                  text: '正在热映',
                ),
                Tab(
                  icon: Icon(Icons.movie_outlined),
                  text: '排行榜',
                ),
                Tab(
                  icon: Icon(Icons.movie_edit),
                  text: '即将上映',
                ),
              ],
            ),
          )),
    );
  }
}
