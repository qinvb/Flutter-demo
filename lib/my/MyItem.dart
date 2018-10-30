import 'package:flutter/material.dart';


class ItemData {
  String topText;
  String downText;
  String itemImageSrc;
  bool   isText;
  ItemData(this.topText, this.downText, this.itemImageSrc, this.isText);
}

class ItemBookData {
  String bookName;
  String bookImageSrc;
  String bookPrice;
  ItemBookData(this.bookName, this.bookImageSrc, this.bookPrice,);
}


class ItemDataImageText {
  String downText;
  String itemImageSrc;
  ItemDataImageText(this.downText, this.itemImageSrc,);
}



final List<ItemData> List1 =<ItemData>[
  new ItemData('78', '公开文章', '', true),
  new ItemData('7',  '关注',    '', true),
  new ItemData('65', '粉丝',    '', true),
  new ItemData('',   '每日签到', './assets/my/sign.png', false),
];


final List<ItemDataImageText> List2 =<ItemDataImageText>[

      new ItemDataImageText('私密文章', './assets/my/my_lock.png'),
      new ItemDataImageText('我的收藏', './assets/my/my_shoucang.png'),
      new ItemDataImageText('我的喜欢', './assets/my/my_like.png'),
      new ItemDataImageText('已购内容', './assets/my/my_money.png'),

      new ItemDataImageText('我的专题', './assets/my/my_zhuanti.png'),
      new ItemDataImageText('我的文集', './assets/my/my_wenji.png'),
      new ItemDataImageText('关注内容', './assets/my/my_guanzhu.png'),
      new ItemDataImageText('我的钱包', './assets/my/my_qianbao.png'),

];


final List<ItemDataImageText> List2_1 =<ItemDataImageText>[

  new ItemDataImageText('千人拼购团', './assets/my/my_01.png'),
  new ItemDataImageText('简书大学堂', './assets/my/my_02.png'),
  new ItemDataImageText('年度写作课', './assets/my/my_03.png'),
  new ItemDataImageText('简书FM',    './assets/my/my_04.png'),

  new ItemDataImageText('排行榜', './assets/my/my_05.png'),
  new ItemDataImageText('日更挑战', './assets/my/my_06.png'),
  new ItemDataImageText('行距杯征文', './assets/my/my_07.png'),
  new ItemDataImageText('晨间日记', './assets/my/my_08.png'),

];


final List<ItemDataImageText> List3 =<ItemDataImageText>[
  new ItemDataImageText('夜间模式', './assets/my/my_yejian.png'),
  new ItemDataImageText('浏览记录', './assets/my/my_shili.png'),
  new ItemDataImageText('分享简书', './assets/my/my_fenxiang.png'),
  new ItemDataImageText('帮助与反馈', './assets/my/my_fankui.png'),
  new ItemDataImageText('给简书评分', './assets/my/my_pingfen.png'),
];


final List<ItemBookData> ListBook =<ItemBookData>[
  new ItemBookData('斗破苍穹', '48.00', 'https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=2749320941,959373088&fm=58'),
  new ItemBookData('绝世唐门', '26.00', 'https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1903483880,1044108592&fm=58'),
  new ItemBookData('超级兵王', '13.98', 'https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2266481637,4201518126&fm=58'),
  new ItemBookData('特种教师', '19.31', 'https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=3053098540,3259949006&fm=58'),
  new ItemBookData('很纯很暧昧', '32.00', 'https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3195181584,2320126022&fm=58'),
  new ItemBookData('最好的我们', '16.00', 'https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1861931712,2942880243&fm=58'),
];




////////顶部的公开文章 关注   粉丝   每日签到  操作栏
Widget MyItemText(BuildContext context, int index) {
  double ScreenWidth = MediaQuery.of(context).size.width;
  double ItemWidth   = ScreenWidth / 4.0;
  double ItemHeight  = 78.0;
  double TextHeight  = ItemHeight / 2.0;
  var Item = new GestureDetector(
    onTap: (){},
    child: new Container(
      width: ItemWidth,
      height: ItemHeight,
      child: new Column(
        children: <Widget>[


          ///顶部的text 或 图片
          new Container(
            alignment: Alignment.center,

            margin: new EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
            height: 20.0,
            child: List1[index].isText ? 
              new Text(
                  List1[index].topText, 
                  style: new TextStyle(fontSize: 20.0, color: new Color.fromARGB(255, 51, 51, 51)), 
                  softWrap:false, 
                  overflow: TextOverflow.ellipsis
              ) :
              new Container(
                alignment: Alignment.center,
                height: 20.0,
                width: 20.0,
                child: new Image.asset(List1[index].itemImageSrc),
              )

          ),

          //底部的text
          new Container(
            alignment: Alignment.center,
            margin: new EdgeInsets.only(left: 10.0, right: 10.0, top: 7.0),
            height: 14.0,
            child: new Text(List1[index].downText, style: new TextStyle(fontSize: 12.0, color: new Color.fromARGB(255, 123, 123, 123)), softWrap:false, overflow: TextOverflow.ellipsis),
          ),

        ],
      ),
    ),

  );
  return Item;
}






////////中间部分的操作栏 私密文章 我的收藏 我的喜欢 等
Widget MyItemImageText(BuildContext context, int index) {
  double ScreenWidth = MediaQuery.of(context).size.width;
  double ItemWidth   = ScreenWidth / 4.0;
  double ItemHeight  = 70.0;
  var Item = new GestureDetector(
    onTap: (){},
    child: new Container(
      width: ItemWidth,
      height: ItemHeight,
//      color: Colors.red,
      child: new Column(
        children: <Widget>[
          ///顶部 图片
          new Container(
              alignment: Alignment.center,
              margin: new EdgeInsets.only(left: 10.0, right: 10.0, top: 14.0),
              height: 18.0,
              child: new Container(
                alignment: Alignment.center,
                height: 18.0,
                width: 18.0,
                child: new Image.asset(List2[index].itemImageSrc),
              )
          ),

          //底部的text
          new Container(
            alignment: Alignment.center,
            margin: new EdgeInsets.only(left: 10.0, right: 10.0, top: 7.0),
            height: 15.0,
            child: new Text(List2[index].downText, style: new TextStyle(fontSize: 12.0, color: new Color.fromARGB(255, 123, 123, 123)), softWrap:false, overflow: TextOverflow.ellipsis),
          ),

        ],
      ),
    ),

  );
  return Item;
}



////////中间部分彩色按钮部分
Widget MyItemImageText1(BuildContext context, int index) {
  double ScreenWidth = MediaQuery.of(context).size.width;
  double ItemWidth   = ScreenWidth / 4.0;
  double ItemHeight  = 90.0;
  var Item = new GestureDetector(
    onTap: (){},
    child: new Container(
      width: ItemWidth,
      height: ItemHeight,
//      color: index==0?Colors.red:Colors.grey,
      child: new Column(
        children: <Widget>[
          ///顶部 图片
          new Container(
              alignment: Alignment.center,
              margin: new EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
              height: 30.0,
              child: new Container(
                alignment: Alignment.center,
                height: 30.0,
                width: 30.0,
                child: new Image.asset(List2_1[index].itemImageSrc),
              )
          ),

          //底部的text
          new Container(
            alignment: Alignment.center,
            margin: new EdgeInsets.only(left: 10.0, right: 10.0, top: 7.0),
            height: 15.0,
            child: new Text(List2_1[index].downText, style: new TextStyle(fontSize: 12.0, color: new Color.fromARGB(255, 123, 123, 123)), softWrap:false, overflow: TextOverflow.ellipsis),
          ),

        ],
      ),
    ),

  );
  return Item;
}




////////设置部分 夜间模式 浏览记录等
Widget MyItemSetInfo(BuildContext context, int index) {
  double ScreenWidth = MediaQuery.of(context).size.width;
  double ItemHeight  = 44.0;
  var Item = new GestureDetector(
    onTap: (){},
    child: new Column(
      children: <Widget>[


        new Container(
          width: ScreenWidth - 30.0,
          height: index!=4 ? 43.0 : 44.0,
          child: new Row(
            children: <Widget>[
              new Container(
                  alignment: Alignment.center,
                  height: 43.0,
                  child: new Container(
                    alignment: Alignment.center,
                    height: 18.0,
                    width: 18.0,
                    child: new Image.asset(List3[index].itemImageSrc),
                  )
              ),

              new Container(
                margin: new EdgeInsets.only(left: 12.0),
                width: 200.0,
                child: new Text(List3[index].downText, style: new TextStyle(fontSize: 14.0, color: new Color.fromARGB(255, 51, 51, 51)), softWrap:false, overflow: TextOverflow.ellipsis),
              )


            ],
          )
        ),

        index != 4 ? new Container(
          width: ScreenWidth - 30.0,
          height: 1.0,
          color: new Color.fromARGB(255, 241, 241, 241),
        ) : new Container()



      ],
    )
  );
  return Item;
}



////////书籍部分
Widget MyItemBookInfo(BuildContext context, int index) {
  double ScreenWidth = MediaQuery.of(context).size.width;
  double ItemHeight  = 200.0;
  double ItemWidth  = 100.0;
  double RightFreeWidth  = 20.0;
  var Item = new GestureDetector(
      onTap: (){},
      child: new Container(
        width: ItemWidth,
//        color: index == 0?Colors.green:Colors.grey,
        height: ItemHeight,
        child: new Column(
          children: <Widget>[

            new Container(
              margin: new EdgeInsets.all(10.0),
              width: ItemWidth - 20.0,
              height: ItemHeight - 80.0,
              child: new Image.network(ListBook[index].bookPrice),
            ),

            new Container(
              alignment: Alignment.centerLeft,
              width: ItemWidth - 20.0,
              height: 20.0,
              child: new Text(ListBook[index].bookName, style: new TextStyle(fontSize: 13.0, color: new Color.fromARGB(255, 51, 51, 51)), softWrap:false, overflow: TextOverflow.ellipsis),
            ),

            new Container(
              margin: new EdgeInsets.only(top: 10.0),
              width: ItemWidth,
              height: 20.0,
              child: new Row(
                children: <Widget>[
                  new Container(
                    margin: new EdgeInsets.only(left: 10.0),
                    width: ItemWidth - 20.0 - RightFreeWidth,
                    child: new Text('¥'+ListBook[index].bookImageSrc, style: new TextStyle(fontSize: 10.0, color: new Color.fromARGB(255, 153, 153, 153)), softWrap:false, overflow: TextOverflow.ellipsis),
                  ),

                  new Container(
                    width: RightFreeWidth,
                    child: new Text('免费', style: new TextStyle(fontSize: 10.0, color: new Color.fromARGB(255, 241, 134, 119)), softWrap:false, overflow: TextOverflow.ellipsis),
                  ),


                ],
              ),
            ),



          ],
        ),
      ),
  );
  return Item;
}






