import 'package:flutter/material.dart';
import './MyItem.dart';

class MyPage extends StatefulWidget {

  @override
  _MyPageState createState() => new _MyPageState();

}

class _MyPageState extends State<MyPage> {

  final List<ItemData> data1 = <ItemData>[
    new ItemData('', '', '', true),
    new ItemData('', '', '', true),
    new ItemData('', '', '', true),
    new ItemData('', '', '', true),
  ];


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('我的', style: new TextStyle(fontSize: 16.0, color: Colors.black),),
          centerTitle: false,
          backgroundColor: Colors.white,
          actions: <Widget>[
            new Row(
              children: <Widget>[
                new Container(
                  child: new FlatButton(onPressed: (){}, child: new Icon(Icons.settings)),
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
        body: new  Container(
          color: new Color.fromARGB(255, 241, 241, 241),
          child: new ListView.builder(
            itemCount: 6,
            itemBuilder: buildCellItem,
          ),
        ),
      ),
    );
  }


  Widget buildCellItem (BuildContext context, int index) {
    double ScreenWidth = MediaQuery.of(context).size.width;
    double Space = 15.0;
    double HeadImageWdthHeight = 65.0;
    double HeadUserInfoHeight = HeadImageWdthHeight + Space * 2;
    double RightVipWidth = 100.0;
    double EditUserInfoWidth = 44.0;


    double SmallInfoHeight      =  78.0;
    double SmallMiddleHeight    =  70.0;
    double SmallMiddleHeight1   =  90.0;

    var cellItemUserInfo = new GestureDetector(
      onTap: () => {},
      child: new Column(
        children: <Widget>[
          new Container(
            height: 15.0,
          ),
          new Divider(height: 1.0,),

          new Container(

            width: ScreenWidth,
            height: HeadUserInfoHeight,
            color: Colors.white,

            child: new Row(
              children: <Widget>[

                //头像
                new Container(
                  width: HeadUserInfoHeight,
                  child: new Container(
                    margin: new EdgeInsets.all(Space),
                    child: new CircleAvatar(
                      backgroundImage: new NetworkImage('https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2328525025,492417511&fm=58&s=4B0883450E331284192065B30300C043'),
                      radius: HeadUserInfoHeight/2.0,
                    ),
                  ),
                ),

                ////用户名称 + 积分显示 + 积分商城显示
                new Container(
                  width: ScreenWidth - HeadUserInfoHeight,

                  child: new Column(
                    children: <Widget>[
                      new Container(
                        width:ScreenWidth - HeadUserInfoHeight,

                        margin: new EdgeInsets.only(top: 20.0,),
                        height: 30.0,

                        child: new Row(
                          children: <Widget>[
                            //名字
                            new Container(
                              height: 18.0,

                              child: new Text(
                                'qinvb',
                                style: new TextStyle(fontSize: 17.0, color: new Color.fromARGB(251, 51, 51, 51)),
                                softWrap:false,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                              )
                            ),


                            //编辑按钮
                            new Container(
                              width: EditUserInfoWidth,
                              child: new Container(
                                margin: new EdgeInsets.only(left: (EditUserInfoWidth-15.0)/2, right: (EditUserInfoWidth-15.0)/2, top: 5.5, bottom: 8.5),
                                child: new Image.asset('./assets/my/edit.png', )
                              )

                            ),


                            //会员显示
                            new GestureDetector(
                              onTap: (){},
                              child: new Container(
                                width: RightVipWidth,
                                margin: new EdgeInsets.only(left: Space),
//                                color: Colors.red,
                              )
                            )






                          ],
                        ),

                      ),

                      new Container(
                        margin: new EdgeInsets.only(right: 15.0),
                        height: 30.0,
                        child: new Row(

                          children: <Widget>[

                            new Container(
                              margin: new EdgeInsets.only(top: 2.5, bottom: 2.5),
                              height: 25.0,
                              child: new OutlineButton(
                                onPressed: ()=>{},
                                highlightElevation:5.0,
                                borderSide:new BorderSide(color: new Color.fromARGB(255, 241, 134, 119)),
                                child: new Text('积分 290',style: new TextStyle(fontSize: 13.0, color: new Color.fromARGB(255, 241, 134, 119)),),
                              )
                            ),

                            new Container(
                                margin: new EdgeInsets.only( left: Space),
                                height: 25.0,
                                child: new OutlineButton(
                                  onPressed: ()=>{},
                                  highlightElevation:5.0,
                                  borderSide:new BorderSide(color: new Color.fromARGB(255, 241, 134, 119)),
                                  child: new Text('积分商城',style: new TextStyle(fontSize: 13.0, color: new Color.fromARGB(255, 241, 134, 119)),),
                                )
                            ),



                          ],
                        ),
                      )


                    ],
                  ),

                )





              ],
            ),

          ),

          new Divider(height: 1.0,),

        ],
      ),

    );


    var cellItemSmallInfo = new GestureDetector(
      onTap: ()=>{},
      child: new Container(
        width: ScreenWidth,
        child: new Column(
          children: <Widget>[
            new Container(
              width: ScreenWidth,
              height: SmallInfoHeight,
              color: Colors.white,
              child: new ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: MyItemText,
              ),

            ),
            new Divider(height: 1.0,),

            new Container(
              width: ScreenWidth,
              height: 15.0,
            ),
            new Divider(height: 1.0,),

          ],
        )
      ),

    );


    double ItemWidth   = ScreenWidth / 4.0;
    double ItemHeight  = 70.0;
    var cellItemMiddleInfo = new GestureDetector(
      onTap: ()=>{},
      child: new Container(
          width: ScreenWidth,
          child: new Column(
            children: <Widget>[
              new Container(
                width: ScreenWidth,
                height: SmallMiddleHeight * 2.0,
                color: Colors.white,
                child: new GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisSpacing: 0.0,//竖向间距
//                    crossAxisCount: 4,//横向Item的个数
                      maxCrossAxisExtent: ScreenWidth/4.0,
                      crossAxisSpacing: 0.0,//横向间距
                      childAspectRatio:(ItemWidth/ItemHeight)
                    ),
                    primary: false,
                    itemCount: List2.length,
                    itemBuilder: MyItemImageText,
                )
              ),
              new Divider(height: 1.0,),

              new Container(
                width: ScreenWidth,
                height: 15.0,
              ),
              new Divider(height: 1.0,),

            ],
          )
      ),

    );





    double RightBtnWidth = 65.0;
    var cellItemMiddleInfo2 = new GestureDetector(
      onTap: ()=>{},
      child: new Container(
          width: ScreenWidth,
          child: new Column(
            children: <Widget>[
              new Container(
                width: ScreenWidth,
                height: 44.0,
                color: Colors.white,
                child: new Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Container(

                          alignment: Alignment.centerLeft,
                          height: 43.0,
                          width: ScreenWidth - RightBtnWidth - 30.0,
                          margin: new EdgeInsets.only(left: 15.0),
                          child: new Text('创作灵感', style: new TextStyle(fontSize: 15.0, color: new Color.fromARGB(255, 51, 51, 51)),),
                        ),
                        new GestureDetector(
                          onTap: (){},
                          child: new Container(
                            height: 43.0,

                            alignment: Alignment.centerRight,
                            width: RightBtnWidth,
                            child: new Text('开始创作', style: new TextStyle(fontSize: 15.0, color: new Color.fromARGB(255, 241, 134, 119)),),
                          ),
                        )
                      ],
                    ),

                    new Container(
                      width: ScreenWidth - 30.0,
                      height: 1.0,
                      margin: new EdgeInsets.only(left: 15.0, right: 15.0),
                      color: new Color.fromARGB(255, 241, 241, 241),
                    )

                  ],
                ),
              ),


              new Container(
                  width: ScreenWidth,
                  height: SmallMiddleHeight1 * 2.0,
                  color: Colors.white,
                  child: new GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        mainAxisSpacing: 0.0,//竖向间距
//                    crossAxisCount: 4,//横向Item的个数
                        maxCrossAxisExtent: ScreenWidth/4.0,
                        crossAxisSpacing: 0.0,//横向间距
                        childAspectRatio:(ItemWidth/SmallMiddleHeight1)
                    ),
                    primary: false,
                    itemCount: 8,
                    itemBuilder: MyItemImageText1,
                  )
              ),
              new Divider(height: 1.0,),

              new Container(
                width: ScreenWidth,
                height: 15.0,
              ),
              new Divider(height: 1.0,),

            ],
          )
      ),

    );



    var cellItemSetInfo = new GestureDetector(
      onTap: ()=>{},
      child: new Container(
          width: ScreenWidth,
          child: new Column(
            children: <Widget>[
              new Container(
                  width: ScreenWidth,
                  height: 44.0*5,
                  color: Colors.white,
                  child: new ListView.builder(
                    physics: new NeverScrollableScrollPhysics(),
                    itemCount: 5,
                      itemBuilder: MyItemSetInfo,
                  )
              ),
              new Divider(height: 1.0,),

              new Container(
                width: ScreenWidth,
                height: 15.0,
              ),
              new Divider(height: 1.0,),

            ],
          )
      ),

    );




    double RightBtnWidthMore = 44.0;
    var cellItemVip = new GestureDetector(
      onTap: ()=>{},
      child: new Container(
          width: ScreenWidth,
          child: new Column(
            children: <Widget>[
              new Container(
                width: ScreenWidth,
                height: 44.0,
                color: Colors.white,
                child: new Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Container(

                          alignment: Alignment.centerLeft,
                          height: 43.0,
                          width: ScreenWidth - RightBtnWidthMore - 30.0,
                          margin: new EdgeInsets.only(left: 15.0),
                          child: new Text('会员免费看', style: new TextStyle(fontSize: 15.0, color: new Color.fromARGB(255, 51, 51, 51)),),
                        ),
                        new GestureDetector(
                          onTap: (){},
                          child: new Container(
                            height: 43.0,
                            alignment: Alignment.centerRight,
                            width: RightBtnWidthMore,
                            child: new Container(
                              width: 28.0,
                              height: 28.0,
                              child: new Image.asset('./assets/image/more.png',),
                            )
                          ),
                        )
                      ],
                    ),

                    new Container(
                      width: ScreenWidth - 30.0,
                      height: 1.0,
                      margin: new EdgeInsets.only(left: 15.0, right: 15.0),
                      color: new Color.fromARGB(255, 241, 241, 241),
                    )

                  ],
                ),
              ),


              new Container(
                  width: ScreenWidth,
                  height: 200.0,
                  color: Colors.white,
                  child: new ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: MyItemBookInfo,
                  )
              ),
              new Divider(height: 1.0,),

              new Container(
                width: ScreenWidth,
                height: 15.0,
              ),

            ],
          )
      ),

    );


    if(index == 0){
      return cellItemUserInfo;
    }else if (index == 1) {
      return cellItemSmallInfo;
    }else if (index == 2) {
      return cellItemMiddleInfo;
    }else if (index == 3) {
      return cellItemMiddleInfo2;
    }else if (index == 5) {
      return cellItemVip;
    }

    return cellItemSetInfo;
  }




}