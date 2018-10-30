import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {

  @override
  _MessagePageState createState() => new _MessagePageState();

}

class _MessagePageState extends State<MessagePage> {



  @override
  Widget build(BuildContext context) {
    double ScreenWidth   = MediaQuery.of(context).size.width;
    double topSpace = 40.0;
    double middleDownSpace = 30.0;
    double btnHeight = 55.0;
    double TopViewHeight = topSpace + middleDownSpace * 2.0 + btnHeight * 2.0;
    double btnSpace = 35.0;
    double btnWidth = (ScreenWidth - btnSpace*4)/3.0;

    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('消息', style: new TextStyle(fontSize: 16.0, color: Colors.black),),
          centerTitle: false,
          backgroundColor: Colors.white,
          actions: <Widget>[
            new Row(
              children: <Widget>[
                new Container(
                  child: new FlatButton(onPressed: (){}, child: new Icon(Icons.message)),
                  width: 44.0,
                ),
                new Container(
                  child: new FlatButton(onPressed: (){}, child: new Icon(Icons.search)),
                  width: 64.0,
                ),
              ],
            )
          ],
        ),
        body: new Container(
          child: new ListView.builder(
            itemCount: 8,
            itemBuilder: buildCellItem,
          ),
        ),





      ),


    );

  }






  ////顶部的操作cell  或 消息列表的cell
  Widget buildCellItem (BuildContext context, int index) {
    double ScreenWidth   = MediaQuery.of(context).size.width;
    double topSpace = 40.0;
    double middleDownSpace = 30.0;
    double btnHeight = 55.0;
    double TopViewHeight = topSpace + middleDownSpace * 2.0 + btnHeight * 2.0;
    double btnSpace = 35.0;
    double btnWidth = (ScreenWidth - btnSpace*4)/3.0;

    var cellItem1 = new GestureDetector(
      onTap: ()=>{},
      child: new Container(
        color: new Color.fromARGB(255, 245, 245, 245),
        child: new Column(
          children: <Widget>[
            ////顶部的操作按钮
            new Container(
              width: ScreenWidth,
              height: TopViewHeight,
              color: Colors.white,
              child: new Column(
                children: <Widget>[
                  new Container(
                    margin: new EdgeInsets.only(left:btnSpace, right: btnSpace, top: topSpace),
                    width: ScreenWidth,
                    height: btnHeight,
                    child: new Row(
                      children: <Widget>[
                        new Container(
                          width: btnWidth,
                          height: btnHeight,
                          alignment: Alignment.center,
                          child: new Column(
                            children: <Widget>[
                              new Image(image: new AssetImage('./assets/message/messagecomment.png'), width: 25.0, height: 25.0,),
                              new Container(
                                  margin: new EdgeInsets.only(top: 10.0),
                                  height: 20.0,
                                  child: new Text('评论', style: new TextStyle(fontSize: 15.0, color: new Color.fromARGB(255, 153 , 153, 153)),)
                              )
                            ],

                          ),
                        ),

                        new Container(
                          margin: new EdgeInsets.only(left: btnSpace),
                          width: btnWidth,
                          height: btnHeight,
                          child: new Column(
                            children: <Widget>[
                              new Image(image: new AssetImage('./assets/message/messagelike.png'), width: 25.0, height: 25.0,),
                              new Container(
                                  margin: new EdgeInsets.only(top: 10.0),
                                  height: 20.0,
                                  child: new Text('喜欢和赞',
                                    style: new TextStyle(fontSize: 15.0, color: new Color.fromARGB(255, 153, 153, 153)), )
                              )
                            ],

                          ),
                        ),



                        new Container(
                          margin: new EdgeInsets.only(left: btnSpace),
                          width: btnWidth,
                          height: btnHeight,
                          child: new Column(
                            children: <Widget>[
                              new Image(image: new AssetImage('./assets/message/messageadd.png'), width: 25.0, height: 25.0,),
                              new Container(
                                  margin: new EdgeInsets.only(top: 10.0),
                                  height: 20.0,
                                  child: new Text('关注', style: new TextStyle(fontSize: 15.0, color: new Color.fromARGB(255, 153 , 153, 153)),)
                              )
                            ],

                          ),
                        ),


                      ],
                    ),

                  ),

                  new Container(
                    margin: new EdgeInsets.only(left:btnSpace, right: btnSpace, top: middleDownSpace),

                    width: ScreenWidth,
                    height: btnHeight,
                    child: new Row(
                      children: <Widget>[
                        new Container(
                          width: btnWidth,
                          height: btnHeight,
                          child: new Column(
                            children: <Widget>[
                              new Image(image: new AssetImage('./assets/message/messagepush.png'), width: 25.0, height: 25.0,),
                              new Container(
                                  margin: new EdgeInsets.only(top: 10.0),
                                  height: 20.0,
                                  child: new Text('投稿请求', style: new TextStyle(fontSize: 15.0, color: new Color.fromARGB(255, 153 , 153, 153)),)
                              )
                            ],

                          ),
                        ),

                        new Container(
                          margin: new EdgeInsets.only(left: btnSpace),
                          width: btnWidth,
                          height: btnHeight,
                          child: new Column(
                            children: <Widget>[
                              new Image(image: new AssetImage('./assets/message/messagemoney.png'), width: 25.0, height: 25.0,),
                              new Container(
                                  margin: new EdgeInsets.only(top: 10.0),
                                  height: 20.0,
                                  child: new Text('赞赏和付费', style: new TextStyle(fontSize: 15.0, color: new Color.fromARGB(255, 153 , 153, 153)),)
                              )
                            ],

                          ),
                        ),



                        new Container(
                          margin: new EdgeInsets.only(left: btnSpace),
                          width: btnWidth,
                          height: btnHeight,
                          child: new Column(
                            children: <Widget>[
                              new Image(image: new AssetImage('./assets/message/messagemore.png'), width: 25.0, height: 25.0,),
                              new Container(
                                  margin: new EdgeInsets.only(top: 10.0),
                                  height: 20.0,
                                  child: new Text('其他提醒', style: new TextStyle(fontSize: 15.0, color: new Color.fromARGB(255, 153 , 153, 153)),)
                              )
                            ],

                          ),
                        ),


                      ],
                    ),
                  ),



                ],
              ),
            ),

            new Divider(height: 1.0,),


            ////中间的简信要求
            new Container(
                margin: new EdgeInsets.only(top: 20.0),
                width: ScreenWidth,
                height: 44.0,
                color: Colors.white,
                child: new Row(
                  children: <Widget>[
                    new Container(
                      margin: new EdgeInsets.only(left: 15.0),
                      width: 100.0,
                      child: new Text('简信', style: new TextStyle(fontSize: 15.0, color: new Color.fromARGB(255, 51, 51, 51)),),
                    ),

                    new GestureDetector(
                      onTap: ()=>{},
                      child: new Container(
                        alignment: Alignment.centerRight,
                        margin: new EdgeInsets.only(left: ScreenWidth-30.0-100.0-80.0),
                        width: 80.0,
                        height: 44.0,
                        child: new Text('新简信', style: new TextStyle(fontSize: 15.0, color: new Color.fromARGB(255, 231, 119, 101)),),
                      ),
                    )


                  ],
                )
            ),

            new Divider(height: 1.0,),


          ],
        ),
      ),

    );



    double ImageWidthHeight = 38.0;
    double CellHeight = ImageWidthHeight + 30.0;
    //////底部消息列表cell
    var cellItem2 = new GestureDetector(
        onTap: ()=>{},
        child: new Container(
          width: ScreenWidth,
          height: CellHeight + 0.7,
          color: Colors.white,
          child: new Column(
            children: <Widget>[
              new Container(
                color: Colors.white,
                width: ScreenWidth,
                height: CellHeight-0.7,
                child: new Row(
                  children: <Widget>[
                    new Container(
                      width: 15.0+10.0+ImageWidthHeight,
                      height: CellHeight-0.7,
                      child: new Container(
                        margin: new EdgeInsets.only(top: 15.0, left: 15.0, bottom: 15.0, right: 10.0),
                        child: new CircleAvatar(
                          backgroundImage: new NetworkImage('https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2328525025,492417511&fm=58&s=4B0883450E331284192065B30300C043'),
                          radius: ImageWidthHeight/2.0,
                        ),
                      ),
                    ),

                    new Container(
                      child: new Column(
                        children: <Widget>[
                          //用户名字
                          new Container(
                            width: ScreenWidth-30.0-10.0-ImageWidthHeight,
                            height: 20.0,
                            margin: new EdgeInsets.only(top: 15.0),
                            child: new Row(
                              children: <Widget>[
                                new Container(
                                  width: (ScreenWidth-30.0-10.0-ImageWidthHeight)/2.0,
                                  child: new Text('可合法违法', style: new TextStyle(fontSize: 15.0, color: new Color.fromARGB(255, 51, 51, 51)), softWrap:false),
                                ),
                                new Container(
                                  width: (ScreenWidth-30.0-10.0-ImageWidthHeight)/2.0,
                                  child: new Text('09-17 16:11', style: new TextStyle(fontSize: 12.0, color: new Color.fromARGB(255, 207, 207, 207)), textAlign: TextAlign.right,),
                                ),

                              ],
                            ),

                          ),


                          new Container(
                            margin: new EdgeInsets.only(top: 5.0, bottom: 10.0),
                            width: ScreenWidth-30.0-10.0-ImageWidthHeight,
                            height: 15.0,
                            child: new Text('欢迎加入丰富多彩的原创内容社区-简书。新手有关简书的任何问题请点击链接查看', style: new TextStyle(fontSize: 12.0, color: new Color.fromARGB(255, 207, 207, 207)), softWrap:false, overflow: TextOverflow.ellipsis,),
                          ),


                        ],
                      ),
                    )




                  ],
                ),
              ),

              //分割线
              new Container(
                margin: new EdgeInsets.only(left: 15.0+ImageWidthHeight+10.0),
                width: ScreenWidth - ImageWidthHeight - 15.0 - 10.0,
                height: 0.7,
                color: new Color.fromARGB(255, 221, 221, 221),
              ),
            ],
          ),

        )

    );


    if(index==0){
      return cellItem1;
    }
    return cellItem2;

  }



}