import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_refresh/flutter_refresh.dart';

import 'package:video_player/video_player.dart';




import 'dart:io';
import 'dart:convert';
import 'dart:async';


class JokeDetailPage extends StatefulWidget {

  JokeDetailPage ({var key,this.mapd}):super(key:key);//接收从上一个页面传来的值
  var mapd;

  @override
  _JokeDetailPageState createState() => new _JokeDetailPageState(mapd, mapd);

}


class _JokeDetailPageState extends State<JokeDetailPage>  {

  _JokeDetailPageState(var key, this.mapd);
  var mapd;
  int PAGE = 1;

  VideoPlayerController _controller;
  bool _isPlaying = false;


  @override
  void dispose() {
    super.dispose();
  }

  void initState() {
    super.initState();
    print(mapd);
//    _httpClient(PAGE);
//    _controller = VideoPlayerController.network(
//      mapd["video"],
//    )
//      ..addListener(() {
//        final bool isPlaying = _controller.value.isPlaying;
//        if (isPlaying != _isPlaying) {
//          setState(() {
//            _isPlaying = isPlaying;
//          });
//        }
//      })
//      ..initialize().then((_) {
//        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//        setState(() {});
//      });

  }


//  List dataSource;
//
//  void _httpClient(var page) async {
//    var responseBody;
//
//    var httpClient = new HttpClient();
//    var request = await httpClient.getUrl(
//        Uri.parse("https://www.apiopen.top/satinCommentApi?id=${mapd["soureid"]}&page=${page}"));
//    var response = await request.close();
//
//
//    if (response.statusCode == 200) {
//      print("======================================================================");
//      responseBody = await response.transform(utf8.decoder).join();
//      List hotComment    = jsonDecode(responseBody)["data"]["hot"]["list"];
//      List normalComment = jsonDecode(responseBody)["data"]["normal"]["list"];
////      print(hotComment);
////      print(normalComment);
//
//      if(page == 1 && dataSource != null) {
//        dataSource.clear();
//      }
//      //更新数据
//      setState(() {
//        if(page == 1) {
////          if(normalComment.length>0){
//            dataSource = hotComment;
//            dataSource.add(hotComment[0]);
////          }
////          if(hotComment.length > 0) {
//            for (int a = 0; a<normalComment.length; a++){
//              dataSource.add(normalComment[a]);
//            }
////          }
//
//        }else {
//
////          if(hotComment.length > 0) {
//            for (int a = 0; a<hotComment.length; a++){
//              dataSource.add(hotComment[a]);
//            }
////          }
//
////          if(normalComment.length > 0) {
//            for (int a = 0; a<normalComment.length; a++){
//              dataSource.add(normalComment[a]);
//            }
////          }
//
//        }
//      });
//    } else {
//      print("error");
//    }
//  }
//
//  // 底部刷新
//  Future<Null> onFooterRefresh() async {
//    return new Future.delayed(new Duration(seconds: 2), () {
//      setState(() {
//        PAGE += 1;
//        _httpClient(PAGE);
//      });
//    });
//  }


  @override
  Widget build(BuildContext context) {

    return new MaterialApp(

      home: new Scaffold(
        appBar: new AppBar(
          leading: new FlatButton(
            onPressed:(){
              Navigator.pop(context);
            },
            color: Colors.white,
            child: new Icon(Icons.keyboard_backspace,color: Colors.blue, ),
          ),
          title: new Text('详情', style: new TextStyle(fontSize: 17.0, color: Colors.black), ),
          backgroundColor: Colors.white,
        ),

        body: new Container(

//            child: new Refresh(
//            onFooterRefresh: onFooterRefresh,
            child:
            new ListView.builder(
              itemCount: 1,
              itemBuilder: buildCellTopItem,
            ) //:
//            new ListView.builder(
//              itemCount: 1,
//              itemBuilder: buildCellTopItem,
//            )
        ),
//      ),
    )

    );

  }




  ////顶部的详情
  Widget buildCellTopItem (BuildContext context, int index) {

//    print("111111111111111111");
    double ScreenWidth = MediaQuery.of(context).size.width;
    double lableWidth = ScreenWidth-30.0-40.0-10.0;

    var cellItemInfo = new GestureDetector(
        onTap: ()=>{},
        child: new Column(

          children: <Widget>[


            //时间+用户名
            new Container(
              color: Colors.white,
              width: ScreenWidth,
              height: 70.0,
              child: new Row(
                children: <Widget>[
                  //头像
                  new Container(
                    margin: new EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0),
                    width: 40.0,
                    height: 40.0,
                    child: new CircleAvatar(
                      backgroundImage: new NetworkImage(mapd["header"],/*==null? "https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2328525025,492417511&fm=58&s=4B0883450E331284192065B30300C043": mapd["header"]*/),
                      radius: 40.0/2.0,
                    ),
                  ),

                  //https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2328525025,492417511&fm=58&s=4B0883450E331284192065B30300C043

                  new Column(
                    children: <Widget>[
                      new Container(
                        width: lableWidth,
                        margin: new EdgeInsets.only(left: 10.0, top: 18.0),
                        child: new Text(mapd["username"], style: new TextStyle(fontSize: 13.0, color: Colors.blue), softWrap:false, overflow: TextOverflow.ellipsis),
                      ),

                      new Container(
                        width: lableWidth,
                        margin: new EdgeInsets.only(left: 10.0, top: 5.0),
                        child: new Text(mapd["passtime"], style: new TextStyle(fontSize: 12.0, color: Colors.grey), softWrap:false, overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  )

                ],
              ),
            ),

            /////text
            new Container(
                width: ScreenWidth,
                color: Colors.white,
                child: Container(
                  margin: new EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
                  child: new Text(mapd["text"], style: new TextStyle(fontSize: 14.0, color: Colors.black), softWrap: true,),
                )
            ),

            //中间图片
            new Container(
                color: Colors.white,
                width: ScreenWidth,
                child: new Container(
                    margin: new EdgeInsets.only(left: 15.0, right: 20.0, bottom: 15.0),
                    child: new FadeInImage.memoryNetwork(
                      alignment: Alignment.centerLeft,
                      placeholder: kTransparentImage,
                      image: mapd["thumbnail"], //== null ?*/ "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1236557510,3858779538&fm=27&gp=0.jpg",
                    )
                )

            ),

//            new Container(
//              child: _controller.value.initialized
//                  ? AspectRatio(
//                aspectRatio: _controller.value.aspectRatio,
//                child: VideoPlayer(_controller),
//              ) : Container(),


//              floatingActionButton: FloatingActionButton(
//                onPressed: _controller.value.isPlaying
//                    ? _controller.pause
//                    : _controller.play,
//                child: Icon(
//                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//                ),
//              ),

//            ),


            new Divider(height: 1.0),
          ],


        )
    );



//    String content = dataSource[index]["content"];
//
//    var cellItemComment = new GestureDetector(
//        onTap: ()=>{},
//        child: new Container(
//          color: Colors.white,
//          child: new Column(
//            children: <Widget>[
//              new Container(
//                child: new Row(
//                  children: <Widget>[
//
//                    ///头像和点赞数量
//                    new Container(
//                      width: 35.0,
//                      height: 35.0+5.0+15.0,
//                      margin: new EdgeInsets.only(top: 10.0, left: 10.0, bottom: 10.0),
//                      child: new Column(
//                        children: <Widget>[
//                          //头像
//                          new Container(
//                            width: 35.0,
//                            height: 35.0,
//                            child: new CircleAvatar(
//                              backgroundImage: new NetworkImage(dataSource[index]["user"]["profile_image"]),
//                              radius: 35.0/2.0,
//                            ),
//                          ),
//
//                          //点赞数量
//                          new Container(
//                            width: 35.0,
//                            height: 15.0,
//                            alignment: Alignment.center,
//                            margin: new EdgeInsets.only(top: 5.0),
//                            color: new Color.fromARGB(255, 177, 198, 222),
//                            child: dataSource[index]["user"]["total_cmt_like_count"] == null ? new Text("99", style: new TextStyle(fontSize: 10.0, color: Colors.white),):new Text(dataSource[index]["user"]["total_cmt_like_count"], style: new TextStyle(fontSize: 10.0, color: Colors.white),)
//                          )
//
//
//                        ],
//                      ),
//                    ),
//
//
//                    /////名字和评论内容
//                    new Container(
//                      width: ScreenWidth-30.0-35.0,
//                      margin: new EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
//                      child: new Column(
//                        children: <Widget>[
//
//                          ///名字
//                          new Container(
//                            alignment: Alignment.centerLeft,
//                            child: new Text(dataSource[index]["user"]["username"], style: new TextStyle(fontSize: 13.0, color: Colors.blue),),
//                          ),
//
//
//                          /////内容
//                          new Container(
//                            margin: new EdgeInsets.only(top: 15.0),
//                            alignment: Alignment.centerLeft,
//
//                            child: content.length == 0 ? new Text("空评论，评论图片及其他，咱不处理", style: new TextStyle(fontSize: 15.0, color: Colors.black),) : new Text(dataSource[index]["content"], style: new TextStyle(fontSize: 15.0, color: Colors.black),),
//                          ),
//
//
//
//
//                        ],
//                      ),
//                    ),
//
//
//
//
//
//                  ],
//                ),
//              ),
//
//              new Divider(height: 1.0),
//
//            ],
//
//          ),
//        ),
//    );

//    if(index == 0) {
      return cellItemInfo;
//    }
//    return cellItemComment;
  }







}