import 'package:flutter/material.dart';
import 'Liked.dart';
import 'DataModel/jianyouquanData.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'jokesDetail.dart';

import 'package:flutter_refresh/flutter_refresh.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //导入网络请求相关的包


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => new _HomePageState();

}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  TabController _tabController;
  int PAGE = 1;

  final List<Tab> myTabs = <Tab>[
    new Tab(text: '全部关注'),
    new Tab(text: '简友圈'),
    new Tab(text: '专题'),
    new Tab(text: '作者'),
    new Tab(text: '连载'),
    new Tab(text: '段子'),
    new Tab(text: '推送更新'),
  ];



  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 7);
    _httpClient(PAGE);
  }

  List dataSource;
  void _httpClient(var page) async {
    var responseBody;

    var httpClient = new HttpClient();
    var request = await httpClient.getUrl(
        Uri.parse("https://www.apiopen.top/satinGodApi?type=1&page=${page}"));
    var response = await request.close();
    print(page);
    if (response.statusCode == 200) {
      responseBody = await response.transform(utf8.decoder).join();
      List newData = jsonDecode(responseBody)["data"];
      if(page == 1 && dataSource != null) {
        dataSource.clear();
      }
      //更新数据
      setState(() {
        if(page == 1) {
          dataSource = newData;
        }else {
          for (int a = 0; a<newData.length; a++){
            dataSource.add(newData[a]);
          }
        }
      });
    } else {
      print("error");
    }
  }


  // 顶部刷新
  Future<Null> onHeaderRefresh() {
    return new Future.delayed(new Duration(seconds: 2), () {
      setState(() {
        PAGE = 1;
        _httpClient(PAGE);
      });
    });
  }
  // 底部刷新
  Future<Null> onFooterRefresh() async {
    return new Future.delayed(new Duration(seconds: 2), () {
      setState(() {
        PAGE += 1;
        _httpClient(PAGE);
      });
    });
  }


  Widget build(BuildContext context) {

      return new DefaultTabController(
        length: myTabs.length,
        child: new Scaffold(
          appBar: new AppBar(
          title: new Text('关注', style: new TextStyle(fontSize: 16.0, color: Colors.black),),
          centerTitle: false,
          backgroundColor: Colors.white,
          actions: <Widget>[
            new Row(
              children: <Widget>[
                  new Container(
                    child: new FlatButton(onPressed: (){}, child: new Icon(Icons.people)),
                    width: 44.0,
                  ),
                  new Container(
                    child: new FlatButton(onPressed: (){}, child: new Icon(Icons.search)),
                    width: 64.0,
                  ),
              ],
            )
          ],

          bottom: new TabBar(
              tabs: myTabs,
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.white,

              indicatorSize: TabBarIndicatorSize.tab,

//              indicatorWeight: 15.0,

              indicator: new ShapeDecoration(
                  color: new Color.fromARGB(255, 245, 132, 117),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(0.0),

                    ),
                  ),
              ),
              controller: _tabController,
              isScrollable: true,
          ),

        ),

          body: new TabBarView(
            controller: _tabController,
            children: myTabs.map((Tab tab) {
              if(tab.text == "全部关注"){
                return new Container(
                  child: new ListView.builder(
                    itemCount: likeLists.length,
                    itemBuilder: buildCellItem,
                    addRepaintBoundaries: false,


                  ),
                );
              }else if(tab.text == "简友圈"){
                return new Container(
                  child: new ListView.builder(
                    itemCount: JianyouquanLists.length,
                    itemBuilder: buildCelljianyouquanItem,
                  ),
                );
              }else if(tab.text == "专题"){
                return new Center(child: new Text(tab.text));
              }else if(tab.text == "作者"){
                return new Center(child: new Text(tab.text));
              }else if(tab.text == "连载"){
                return new Center(child: new Text(tab.text));
              }else if(tab.text == "段子"){

                return new Container(
                  child: dataSource!= null ?
                    new Refresh(
                      onFooterRefresh: onFooterRefresh,
                      onHeaderRefresh: onHeaderRefresh,
                      child: new ListView.builder(
                        itemCount: dataSource.length,
                        itemBuilder: buildCelljianyouquanItem1,
                      )
                    ): new Container(child: new Text(tab.text)),

                );
              }
              return new Center(child: new Text(tab.text));

            }).toList(),
          ),


        ),

      );
    }




  ////跳转段子详情
  pushAnotherView(int index){
    print(index);
    Navigator.of(context).push(
        new MaterialPageRoute(
            builder: (BuildContext context) {
              var data = dataSource[index];
              return new JokeDetailPage(mapd: data);
            }
        )
    );
  }





  void showAlertDialog(BuildContext context) {

  }

  /////点击用户名 查看用户主页
  pushUserHomePage(int index, String message) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
            title: new Text("提示"),
            content: new Text(message),
            actions:<Widget>[
              new FlatButton(child:new Text("好的"), onPressed: (){

              },),
//              new FlatButton(child:new Text("OK"), onPressed: (){
//                Navigator.of(context).pop();
//
//              },)
            ]
        ));
  }




  ////全部关注的Cell
  Widget buildCellItem (BuildContext context, int index) {

    double ScreenWidth = MediaQuery.of(context).size.width;
    double backImageWidthHeight = 50.0+40.0;
    var cellItem = new GestureDetector(
      onTap: ()=>{},

      child: new Column(

        children: <Widget>[
          new Row(
            children: <Widget>[
              new Container(
                color: Colors.white,
                width: backImageWidthHeight,
                height: backImageWidthHeight,

                child: new Container(
                  width: backImageWidthHeight-40,
                  height: backImageWidthHeight-40,
                  padding: new EdgeInsets.all(20.0),
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage(likeLists[index].headUrl),
                    radius: (backImageWidthHeight-20.0)/2.0,
                  ),
                ),
              ),
              new Container(
                width: ScreenWidth-backImageWidthHeight,
                height: backImageWidthHeight,
                color: Colors.white,
                child: new Column(
                  children: <Widget>[
                    new Container(
                      margin:new EdgeInsets.only(right: 20.0, top: 25.0),
                      width: ScreenWidth-backImageWidthHeight-20.0,
                      height: 20.0,
                      child: new Text(likeLists[index].userName, style: new TextStyle(fontSize: 15.0, color: Colors.black),softWrap:false, overflow: TextOverflow.ellipsis),
                    ),
                    new Container(
                      margin:new EdgeInsets.only(right: 20.0, top: 5.0),
                      width: ScreenWidth-backImageWidthHeight-20.0,
                      height: 20.0,
                      child: new Text(likeLists[index].articleTitle, style: new TextStyle(fontSize: 12.0, color: Colors.grey),softWrap:false, overflow: TextOverflow.ellipsis),
                    ),

                  ],
                ),
            ),
        ],
    ),
          new Divider(height: 1.0,),

        ],


      ),

    );

      return cellItem;
    }




  Widget buildCelljianyouquanItem (BuildContext context, int index) {

    double ScreenWidth = MediaQuery.of(context).size.width;
    double headImageWidthHeight = 35.0;
    double topViewHeight = headImageWidthHeight + 30.0;
    double rightBtnWidth    = 44.0;
    double bigImageWidth    = ScreenWidth - 30.0;
    double downViewHeight   = 44.0;
    double lableWidth       = ScreenWidth - rightBtnWidth - topViewHeight;
    double btnWidth         = 55.0;

    var cellItem = new GestureDetector(
      onTap: ()=>{},
      child: new Column(

        children: <Widget>[

          //顶部用户信息
          new Container(
            width: ScreenWidth,
            height: topViewHeight,
            color: Colors.white,
            child: new Row(
              children: <Widget>[

                //头像
                new Container(
                  margin: new EdgeInsets.only(top: 15.0, bottom: 15.0, right: 15.0, left: 15.0),
                  width: headImageWidthHeight,
                  height: headImageWidthHeight,
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage(JianyouquanLists[index].headUrl),
                    radius: headImageWidthHeight/2.0,
                  ),
                ),

                //文章标题和时间
                new Container(
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        margin:new EdgeInsets.only(top: 15.0),
                        width: lableWidth,
                        height: 20.0,
                        child: new Text(JianyouquanLists[index].userName, style: new TextStyle(fontSize: 15.0, color: Colors.black),softWrap:false, overflow: TextOverflow.ellipsis),
                      ),
                      new Container(
                        width: lableWidth,
                        height: 10.0,
                        child: new Text(JianyouquanLists[index].articleTime, style: new TextStyle(fontSize: 12.0, color: Colors.grey),softWrap:false, overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  )
                ),


                //右边按钮
                new Container(

                  width: rightBtnWidth,
                  height: 35.0,
                  child: new FlatButton(
                      onPressed: ()=>{},
                      child: new Image.asset('assets/image/more.png', width: rightBtnWidth-10, height: 20.0, fit: BoxFit.cover,)
                  ),
                )



              ],
            ),
          ),


          //中间图片
          new Container(
            color: Colors.white,
            width: ScreenWidth,
            child: JianyouquanLists[index].articleImage.length == 0 ? new Container():
            new Container(
               height: bigImageWidth/2.0,
               margin: new EdgeInsets.only(left: 15.0, right: 15.0),
               child: new Image.network(JianyouquanLists[index].articleImage, fit: BoxFit.cover,)
            )

          ),



          //标题+内容
          new Container(
              color: Colors.white,
              child: new Column(
                children: <Widget>[
                  new Container(
                    width: ScreenWidth,
                    color: Colors.white,
                    child: new Container(
                      margin: new EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0,bottom: 10.0),
                      child: new Text(JianyouquanLists[index].articleTitle, style: new TextStyle(fontSize: 17.0, color: Colors.black), softWrap:false, overflow: TextOverflow.ellipsis),
                    )
                  ),
                  new Container(
                    width: ScreenWidth,
                    color: Colors.white,
                    child: Container(

                      margin: new EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10.0),
                      height: 40.0,
                      child: new Text(JianyouquanLists[index].articleContent, style: new TextStyle(fontSize: 14.0, color: Colors.grey), overflow: TextOverflow.ellipsis, maxLines: 2,),
                    )
                  ),
                ],
              )
          ),

          //底部的点赞或者喜欢
          new Container(
            width: ScreenWidth,
            height: downViewHeight,
            color: Colors.white,
            /////喜欢某人的文章的UI
            child: JianyouquanLists[index].isLike ? new Container(
                child: new Row(
                  children: <Widget>[

                    new Container(
                      margin: new EdgeInsets.only(left: 15.0),
                      width: 100.0,
                      height: downViewHeight,
                      alignment: Alignment.centerLeft,
                      child: new GestureDetector(
                        onTap: ()=>pushUserHomePage(index, '点击了用户名'),
                          child: new Text(JianyouquanLists[index].userName, style: new TextStyle(fontSize: 11.0, color: new Color.fromARGB(251, 60, 144, 198)), softWrap:false, overflow: TextOverflow.ellipsis)
                      ),
                    ),

                    new Container(
                      margin: new EdgeInsets.only(right: 15.0),
                      height: downViewHeight,
                      width: ScreenWidth - 30.0 - 100.0,
                      alignment: Alignment.centerRight,
                      child: new Text(JianyouquanLists[index].commentCount+'评论'+' * '+JianyouquanLists[index].likeCount+'喜欢', style: new TextStyle(fontSize: 13.0, color: Colors.grey))

                    )

                  ],
                ),
              ///////发表文章的UI
            ):new Container(
                width: btnWidth * 3.0 + 10.0,
                height: downViewHeight,
                margin: new EdgeInsets.only(left: ScreenWidth-30.0-btnWidth * 3.0 - 10.0,),
                child: new Row(
                  children: <Widget>[
                    
                    new Container(
                      margin: new EdgeInsets.only(left: 15.0),
                      width: btnWidth,
                      height: downViewHeight,
                      child: new Row(
                        children: <Widget>[
                          new Image(image: new AssetImage('./assets/image/comment.png'), width: 22.0, height: 22.0,),
                          new Container(
                            margin: new EdgeInsets.only(left: 5.0),
                            child: new Text('评论', style: new TextStyle(fontSize: 12.0, color: Colors.grey),),
                          )
                        ],
                      ),
                    ),

                    new Container(
                      margin: new EdgeInsets.only(left: 5.0),
                      width: btnWidth,
                      height: downViewHeight,
                      child: new Row(
                        children: <Widget>[
                          new Image(image: new AssetImage('./assets/image/like.png'), width: 22.0, height: 22.0,),
                          new Container(
                            margin: new EdgeInsets.only(left: 5.0),
                            child: new Text('喜欢', style: new TextStyle(fontSize: 12.0, color: Colors.grey),),
                          )
                        ],
                      ),
                    ),

                    new Container(
                      margin: new EdgeInsets.only(left: 5.0),
                      width: btnWidth,
                      height: downViewHeight,
                      child: new Row(
                        children: <Widget>[
                          new Image(image: new AssetImage('./assets/image/share.png'), width: 22.0, height: 22.0,),
                          new Container(
                            margin: new EdgeInsets.only(left: 5.0, top: 3.0),
                            child: new Text('分享', style: new TextStyle(fontSize: 12.0, color: Colors.grey),),
                          )

                        ],
                      ),
                    ),
                    
                    
                    
                  ],
                ),

            )
          ),

          new Divider(height: 1.0),
        ],


      )



    );

    return cellItem;
  }









  Widget buildCelljianyouquanItem1 (BuildContext context, int index) {

    double ScreenWidth = MediaQuery.of(context).size.width;
    double headImageWidthHeight = 35.0;
    double lableWidth = ScreenWidth-30.0-40.0-10.0;
    double rightBtnWidth    = 44.0;
    double bigImageWidth    = ScreenWidth - 30.0;
    double bigImageHeiht    = bigImageWidth * 0.5625;

    var cellItem = new GestureDetector(
        onTap: ()=>pushAnotherView(index),
        child: new Column(

          children: <Widget>[

            //时间+用户名
            new Container(
              color: Colors.white,
              width: ScreenWidth,
              height: 38.0,
              child: new Row(
                children: <Widget>[
                  //头像
                  new Container(
                    margin: new EdgeInsets.only(top: 10.0, left: 15.0),
                    width: 28.0,
                    height: 28.0,
                    child: new CircleAvatar(
                      backgroundImage: new NetworkImage(dataSource[index]["header"]),
                      radius: 28.0/2.0,
                    ),
                  ),

                  new Container(
                    alignment: Alignment.centerLeft,
                    width: lableWidth,
                    margin: new EdgeInsets.only(left: 10.0, top: 10.0),
                    child: new Text(dataSource[index]["username"], style: new TextStyle(fontSize: 12.0, color: Colors.blue), softWrap:false, overflow: TextOverflow.ellipsis),
                  )

                ],
              ),
            ),


            /////text
            new Container(
                width: ScreenWidth,
                color: Colors.white,
                child: Container(
                  margin: new EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10.0, top: 10.0),
                  child: new Text(dataSource[index]["text"], style: new TextStyle(fontSize: 15.0, color: Colors.black), softWrap: true,),
                )
            ),

            //中间图片
            new Container(
                color: Colors.white,
                width: ScreenWidth,
                child: dataSource[index]["thumbnail"]==null ? new Container() :
                  new Container(
                      height: bigImageHeiht,
                      margin: new EdgeInsets.only(left: 15.0, right: 20.0, bottom: 10.0),
                      child: new FadeInImage.memoryNetwork(
                        alignment: Alignment.centerLeft,
                        placeholder: kTransparentImage,
                        image: dataSource[index]["thumbnail"],
                        fit: BoxFit.cover,
                      )
                  )

            ),

            new Container(
              color: Colors.white,
              width: ScreenWidth,
              child: dataSource[index]["top_commentsName"] == null ? new Container():
              new Container(
                color: new Color.fromARGB(255, 241, 241, 241),
                margin: new EdgeInsets.only(bottom: 15.0, left: 15.0, right: 20.0),
                child: new Container(
                  margin: new EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                  child: new Text(dataSource[index]["top_commentsName"]+"："+dataSource[index]["top_commentsContent"], style: new TextStyle(fontSize: 12.0, color: Colors.black), ),
                ),
              )
            ),

            new Divider(height: 1.0),
          ],


        )



    );

    return cellItem;
  }





}






