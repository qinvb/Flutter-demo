import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {

  @override
  _MyPageState createState() => new _MyPageState();

}

class _MyPageState extends State<MyPage> {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('我的'),
          actions: <Widget>[
            new Container(

            )
          ],
        ),
        body: new Center(
            child: null
        ),
      ),
    );
  }

}