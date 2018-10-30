class jianyouquan {
  String headUrl;
  String userName;
  String articleTitle;
  String articleImage;
  String articleTime;
  String commentCount;
  String likeCount;
  bool   isLike;
  bool   isPublish;
  String articleContent;
  String otherUserName;

  jianyouquan(this.headUrl, this.userName, this.articleTitle, this.articleImage, this.articleTime, this.isLike, this.isPublish, this.likeCount, this.commentCount, this.articleContent, this.otherUserName);
}

final List<jianyouquan> JianyouquanLists = <jianyouquan>[
//    new jianyouquan(
//      headUrl,
//      userName,
//      articleTitle,
//      articleImage,
//      articleTime,
//      isLike,
//      isPublish,
//      likeCount,
//      commentCount
//     ),
  new jianyouquan(
      "https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2328525025,492417511&fm=58&s=4B0883450E331284192065B30300C043",
      "@IT-互联网",
      "浅谈NSTimer是否精确？",
      "https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3475878960,1200548972&fm=173&app=25&f=JPEG?w=640&h=427&s=97006DA3400A3BED40A5750B0300A0C0",
      "2018.09.19 16:42",
      true,
      false,
      "46",
      "54",
      "想必看到这篇文章的同学已经知道了flutter是什么，作为一款前端编程sdk，正如火如荼的发展了起来，出生于谷歌，有介绍是谷歌的一款手机系统的核心组件。不管之后是否会跟现有操作系统分庭抗礼，目前来看flutter又是一个改变格局的技术。",
      "qinvb"
  ),
  new jianyouquan(
      "https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1006387812,1107224606&fm=58&s=EFE6A5572D33439462EC58FE0300E070",
      "张冲2018",
      "《万历十五年》自如新解读",
      "https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=3237745225,3543186468&fm=173&app=25&f=JPEG?w=218&h=146&s=3633568164C629435C19C58903006083",
      "2018.09.19 16:42",
      false,
      true,
      "46",
      "54",
      "想必看到这篇文章的同学已经知道了flutter是什么，作为一款前端编程sdk，正如火如荼的发展了起来，出生于谷歌，有介绍是谷歌的一款手机系统的核心组件。不管之后是否会跟现有操作系统分庭抗礼，目前来看flutter又是一个改变格局的技术。",
      ""
  ),
  new jianyouquan(
      "https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1231679303,3089912294&fm=58",
      "没故事的卓同学",
      "Swift API设计思考题",
      "https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3054608328,565539394&fm=173&app=25&f=JPEG?w=218&h=146&s=3FC798564A7C8DCC44A7EFAB0300E00E",
      "2018.09.19 16:42",
      false,
      true,
      "46",
      "54",
      "想必看到这篇文章的同学已经知道了flutter是什么，作为一款前端编程sdk，正如火如荼的发展了起来，出生于谷歌，有介绍是谷歌的一款手机系统的核心组件。不管之后是否会跟现有操作系统分庭抗礼，目前来看flutter又是一个改变格局的技术。",
      ""
  ),
  new jianyouquan(
      "https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1729258001,2303063277&fm=58&s=FA80CB0B526362B40DA84CAA03001022",
      "螺纹的美丽",
      "SRWebSoclet源代码解析",
      "https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=2279537648,4114309878&fm=173&app=25&f=JPEG?w=218&h=146&s=F62004E64E2386DA1638B0220300F041",
      "2018.09.19 16:42",
      false,
      true,
      "46",
      "54",
      "想必看到这篇文章的同学已经知道了flutter是什么，作为一款前端编程sdk，正如火如荼的发展了起来，出生于谷歌，有介绍是谷歌的一款手机系统的核心组件。不管之后是否会跟现有操作系统分庭抗礼，目前来看flutter又是一个改变格局的技术。",
      ""
  ),
  new jianyouquan(
      "https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=4265294863,276161381&fm=58",
      "handy9420",
      "看完这篇文章，你的Python基础就差不多了",
      "",
      "2018.09.19 16:42",
      false,
      true,
      "46",
      "54",
      "想必看到这篇文章的同学已经知道了flutter是什么，作为一款前端编程sdk，正如火如荼的发展了起来，出生于谷歌，有介绍是谷歌的一款手机系统的核心组件。不管之后是否会跟现有操作系统分庭抗礼，目前来看flutter又是一个改变格局的技术。",
      ""
  ),
  new jianyouquan(
      "https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=3103612049,1310234223&fm=58",
      "一束光线",
      "RecyclerView与ListVew的区别",
      "https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1870671615,1412105951&fm=173&app=25&f=JPEG?w=218&h=146&s=BD878F58BD6C031BC0BBF1870300B08B",
      "2018.09.19 16:42",
      true,
      false,
      "46",
      "54",
      "想必看到这篇文章的同学已经知道了flutter是什么，作为一款前端编程sdk，正如火如荼的发展了起来，出生于谷歌，有介绍是谷歌的一款手机系统的核心组件。不管之后是否会跟现有操作系统分庭抗礼，目前来看flutter又是一个改变格局的技术。",
      ""
  ),
  new jianyouquan(
      "https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=3515181095,2934747526&fm=58&s=F8A2BD52D6C390A4662119230300E0E1",
      "lumic000",
      "ReactNative快应用时代，是选择还是放弃？",
      "",
      "2018.09.19 16:42",
      true,
      false,
      "46",
      "54",
      "想必看到这篇文章的同学已经知道了flutter是什么，作为一款前端编程sdk，正如火如荼的发展了起来，出生于谷歌，有介绍是谷歌的一款手机系统的核心组件。不管之后是否会跟现有操作系统分庭抗礼，目前来看flutter又是一个改变格局的技术。",
      ""
  ),
  new jianyouquan(
      "https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2520045001,3964240571&fm=58&s=477C12C6B4BB2194FDA1AC280300F011",
      "为辅飞为",
      "仿即刻App滑动返回效果",
      "https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=3031055573,1284020654&fm=173&app=25&f=JPEG?w=218&h=146&s=BB716886BC1A22C6368FD89903006083",
      "2018.09.19 16:42",
      true,
      false,
      "46",
      "54",
      "想必看到这篇文章的同学已经知道了flutter是什么，作为一款前端编程sdk，正如火如荼的发展了起来，出生于谷歌，有介绍是谷歌的一款手机系统的核心组件。不管之后是否会跟现有操作系统分庭抗礼，目前来看flutter又是一个改变格局的技术。",
      ""
  ),
  new jianyouquan(
      "https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=110756926,1570806310&fm=58&s=9F307980C0E29ABF62209813030000C3",
      "世道无情",
      "腾讯X5WebView集成使用",
      "https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=870759638,1398649604&fm=173&app=25&f=JPEG?w=218&h=146&s=2B61736E9544877652EDED1A00009093",
      "2018.09.19 16:42",
      false,
      true,
      "46",
      "54",
      "想必看到这篇文章的同学已经知道了flutter是什么，作为一款前端编程sdk，正如火如荼的发展了起来，出生于谷歌，有介绍是谷歌的一款手机系统的核心组件。不管之后是否会跟现有操作系统分庭抗礼，目前来看flutter又是一个改变格局的技术。",
      "qinvb"
  ),
];



class DataSource {
    String curPage;
    List<Datachild> datas;
    int    offset;
    bool   over;
    int    pageCount;
    int    size;
    int    total;
    DataSource(this.curPage, this.datas, this.offset, this.over, this.pageCount, this.size, this.total);
}

class Datachild {
  String author;
  String title;
  String desc;
  String envelopePic;
  String link;
  int    publishTime;
  String niceDate;
  Datachild(this.author, this.title, this.desc, this.envelopePic, this.link, this.publishTime, this.niceDate);
}


