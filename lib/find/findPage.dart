import 'package:flutter/material.dart';
import './projectView.dart';
import './pushView.dart';
import './vipView.dart';

class FindPage extends StatefulWidget {

  @override
  _FindPageState createState() => new _FindPageState();

}


class _FindPageState extends State<FindPage> with SingleTickerProviderStateMixin {


  TabController _tabController;

  final List<Tab> myTabs = <Tab>[
    new Tab(text: '推荐'),
    new Tab(text: 'VIP'),
    new Tab(text: '专题'),
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


  @override
  Widget build(BuildContext context) {

    return new DefaultTabController(
     length: myTabs.length,
      child: new Scaffold(
        appBar: new AppBar(
          centerTitle: false,
          backgroundColor: Colors.white,
          actions: <Widget>[
            new Row(
              children: <Widget>[
                new Container(
                  child: new FlatButton(onPressed: (){}, child: new Icon(Icons.search)),
                  width: 64.0,
                ),
              ],
            )
          ],

          title: new TabBar(
            tabs: myTabs,
            unselectedLabelColor: new Color.fromARGB(255, 51, 51, 51),
            labelColor: new Color.fromARGB(255, 245, 132, 117),
            labelStyle: new TextStyle(fontSize: 16.0),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 2.0,
            indicatorColor:new Color.fromARGB(255, 245, 132, 117),
            controller: _tabController,
            isScrollable: true,
          ),

        ),
        body: new TabBarView(
          controller: _tabController,
          children: myTabs.map((Tab tab) {
            if(tab.text == '推荐'){
              return new Center(child: new Text(tab.text));
            }else if(tab.text == 'VIP'){
              return new Center(child: new Text(tab.text));
            }
            return new Center(child: new Text(tab.text));
          }).toList(),
        ),


      ),
    );


  }





}