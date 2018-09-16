import 'package:flutter/material.dart';
import 'Liked.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => new _HomePageState();

}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  TabController _tabController;

  final List<Tab> myTabs = <Tab>[
    new Tab(text: '全部关注'),
    new Tab(text: '简友圈'),
    new Tab(text: '专题'),
    new Tab(text: '作者'),
    new Tab(text: '连载'),
    new Tab(text: '文集'),
    new Tab(text: '推送更新'),
  ];

  final List<Liked> likeLists = <Liked>[
    new Liked(
        "https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2328525025,492417511&fm=58&s=4B0883450E331284192065B30300C043",
        "@IT-互联网",
        "浅谈NSTimer是否精确？"
    ),
    new Liked(
        "https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1006387812,1107224606&fm=58&s=EFE6A5572D33439462EC58FE0300E070",
        "张冲2018",
        "《万历十五年》自如新解读"
    ),
    new Liked(
        "https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1231679303,3089912294&fm=58",
        "没故事的卓同学",
        "Swift API设计思考题"
    ),
    new Liked(
        "https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1729258001,2303063277&fm=58&s=FA80CB0B526362B40DA84CAA03001022",
        "螺纹的美丽",
        "SRWebSoclet源代码解析"
    ),
  ];


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 7);
  }

    Widget build(BuildContext context) {
      return new DefaultTabController(
        length: myTabs.length,
        child: new Scaffold(
          appBar: new AppBar(
          title: new Text('关注', style: new TextStyle(fontSize: 17.0, color: Colors.black),),
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
                  color: Colors.orange,
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
                  ),
                );
              }else if(tab.text == "简友圈"){
                return new Center(child: new Text(tab.text));
              }else if(tab.text == "专题"){
                return new Center(child: new Text(tab.text));
              }else if(tab.text == "作者"){
                return new Center(child: new Text(tab.text));
              }else if(tab.text == "连载"){
                return new Center(child: new Text(tab.text));
              }else if(tab.text == "文集"){
                return new Center(child: new Text(tab.text));
              }
              return new Center(child: new Text(tab.text));

            }).toList(),
          ),


        ),

      );
    }



  pushAnotherView(int index){
    Navigator.of(context).push(
        new MaterialPageRoute(
            builder: (BuildContext context) {

            }
        )
    );
  }



  Widget buildCellItem (BuildContext context, int index) {

    double ScreenWidth = MediaQuery.of(context).size.width;
    double backImageWidthHeight = 60.0+40.0;
    var cellItem = new GestureDetector(
      onTap: ()=>pushAnotherView(2),

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
                      width: ScreenWidth-backImageWidthHeight-20.0,
                      height: 20.0,
                      padding: new EdgeInsets.only(right: 20.0, top: 20.0),
                      child: new Text(likeLists[index].userName, style: new TextStyle(fontSize: 16.0, color: Colors.black),),
                    ),
                    new Container(
                      width: ScreenWidth-backImageWidthHeight-20.0,
                      height: 20.0,
                      padding: new EdgeInsets.only(right: 20.0, top: 40.0),
                      child: new Text(likeLists[index].articleTitle, style: new TextStyle(fontSize: 15.0, color: Colors.grey),),
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


    //new Divider(),


}






