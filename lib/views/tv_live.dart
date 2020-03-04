import 'package:flutter/material.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
import '../net/live_source.dart';
import '../components/sliver_appbar_delegate.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import '../util/color_util.dart';

//视频页面
class TvLivePage extends StatefulWidget {
  @override
  _TvLivePageState createState() => _TvLivePageState();
}

class _TvLivePageState extends State<TvLivePage> with TickerProviderStateMixin,AutomaticKeepAliveClientMixin{
  IjkMediaController _controller = IjkMediaController();
  TabController tabController;

  @override
  bool get wantKeepAlive => true;

  List<Tab> tabs = [
    Tab(text: 'CCTV'),
    Tab(text: '卫视'),
    Tab(text: '地方'),
    Tab(text: '港澳台'),
    Tab(text: '国外'),
    Tab(text: '少儿'),
    //Tab(text: '专题'),
  ];

  List<Widget> getTabContents(){
    return [
      _buildGrdView(_buildCCTV()),
      _buildGrdView(_buildWeiShi()),
      _buildGrdView(_buildLocal()),
      _buildGrdView(_buildGAT()),
      _buildGrdView(_buildAbroad()),
      _buildGrdView(_buildCartoon()),
      //_buildGrdView(_buildAlbum()),
    ];
  }

  @override
  void initState(){
    super.initState();
    _controller.setNetworkDataSource(CCTV1_HD, autoPlay: true);
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            actions: <Widget>[
            ],
            backgroundColor: Colors.transparent,
            expandedHeight: 230.0,
            flexibleSpace: FlexibleSpaceBar(
              background: _buildIjkPlayer(),
            ),
            pinned: true,
            floating: true,
            snap: true,
          ),
          SliverPersistentHeader(
              delegate: SliverAppBarDelegate(TabBar(
                isScrollable: true,
                labelColor: getTabColor(context),
                unselectedLabelColor: getUnselectedLabelColor(),
                tabs: tabs,
                controller: tabController,
              ))
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            child: TabBarView(
              controller: this.tabController,
              children: getTabContents(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGrdView(List<Widget> list){
    return GridView.builder(
      padding: EdgeInsets.all(4.0),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        //Widget Function(BuildContext context, int index)
        return list[index];
      },
      //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,
          childAspectRatio: 11/4 ),
    );
  }

  List<Widget> _buildAlbum(){
    return [
      _buildButton("周星驰", ZXC),
      _buildButton("刘德华", LDH),
      _buildButton("李连杰", LLJ),
      _buildButton("黄渤", HB),
      _buildButton("周润发", ZRF),
      _buildButton("甄子丹", ZZD),
      _buildButton("徐峥", XZ),
      _buildButton("成龙", CL),
      _buildButton("沈腾", ST),
      _buildButton("老友记", LYJ),
      _buildButton("名侦探柯南", MZTKN),
      _buildButton("生活大爆炸", BIGBANG),
      _buildButton("漫威电影", MWDY),
      _buildButton("好莱坞", HLW),
      _buildButton("蜡笔小新", LBXX),
      _buildButton("科幻系列", KHXL),
    ];
  }

  List<Widget> _buildCartoon(){
    return [
      _buildButton("北京卡酷",BJKK),
      _buildButton("重庆少儿",CQSE_HD),
      _buildButton("河北少儿",HBSE),
      _buildButton("嘉佳卡通",JJKT),
      _buildButton("优漫卡通",YMKT),
      _buildButton("卡酷少儿",KKSE),
      _buildButton("金鹰卡通",JYKT),
      _buildButton("炫动卡通",XDKT),
      _buildButton("甘肃少儿",GSSE),
      _buildButton("福州少儿",FZSE),
    ];
  }

  List<Widget> _buildCCTV(){
    return [
      _buildButton("CCTV1",CCTV1_HD),
      _buildButton("CCTV2",CCTV2_HD),
      _buildButton("CCTV3",CCTV3_HD),
      _buildButton("CCTV4",CCTV4_HD),
      _buildButton("CCTV5",CCTV5_HD),
      _buildButton("CCTV5+",CCTV5p_HD),
      _buildButton("CCTV6",CCTV6_HD),
      _buildButton("CCTV7",CCTV7_HD),
      _buildButton("CCTV8",CCTV8_HD),
      _buildButton("CCTV9",CCTV9_HD),
      _buildButton("CCTV10",CCTV10_HD),
      _buildButton("CCTV11",CCTV11),
      _buildButton("CCTV12",CCTV12_HD),
      _buildButton("CCTV13",CCTV13),
      _buildButton("CCTV14",CCTV14_HD),
      _buildButton("CCTV15",CCTV15),
      _buildButton("中国教育1",CETV1),
      _buildButton("中国教育3",CETV3),
      _buildButton("中国教育4",CETV4),
      _buildButton("第一剧场",DYJC),
      _buildButton("留学世界",LXSJ),
//      _buildButton("CGTN",CGTN),
      _buildButton("CGTN-法语",CGTNFY),
      _buildButton("CGTN-西语",CGTNXY),
      _buildButton("CGTN-阿语",CGTNAY),
      _buildButton("CGTN-俄语",CGTNEY),
      _buildButton("CHC电影",CHC_DY),
      _buildButton("CHC影院",CHC_JTYY),
      _buildButton("CHC动作",CHC_DZYY),
//      _buildButton("国防军事",GFJS),
//      _buildButton("怀旧剧场",HJJC),
//      _buildButton("风云剧场",FYJC),
//      _buildButton("风云足球",FYZJ),
//      _buildButton("风云音乐",FYYY),
//      _buildButton("世界地理",SJDL),

//      _buildButton("书画频道",SHUHUA),
//      _buildButton("靓装频道",LIANGZHUANG),
//      _buildButton("篮球频道",LANQIU),
//      _buildButton("车迷频道",CHEMI),
//      _buildButton("人物频道",RENWU),
//      _buildButton("家庭理财",JTLC),
//      _buildButton("茶频道",CHA),
    ];
  }

  List<Widget> _buildWeiShi(){
    return [
      _buildButton("北京卫视",BJWS_HD),
      _buildButton("江苏卫视",JSWS_HD),
      _buildButton("浙江卫视",ZJWS_HD),
      _buildButton("东方卫视",DFWS_HD),
      _buildButton("东南卫视",DNWS_HD),
      _buildButton("安徽卫视",AHWS_HD),
      _buildButton("广东卫视",GDWS_HD),
      _buildButton("山西卫视", SXRWS),
      _buildButton("山东卫视",SDWS_HD),
      _buildButton("湖北卫视",HUBWS_HD),
      _buildButton("四川卫视",SCWS_HD),
      _buildButton("天津卫视",TJWS_HD),
      _buildButton("河北卫视",HEBWS_HD),
      _buildButton("深圳卫视",SZWS_HD),
      _buildButton("星空卫视", XKWS_HD),
      _buildButton("重庆卫视", CQWS_HD),
      _buildButton("兵团卫视", BTWS_HD),
      _buildButton("广西卫视", GXWS),
      _buildButton("甘肃卫视", GSWS),
      _buildButton("贵州卫视", GZWS),
      _buildButton("湖南卫视", HUNWS),
      _buildButton("陕西卫视", SXWS),
      _buildButton("河南卫视", HENWS),
      _buildButton("江西卫视", GZWS),
      _buildButton("吉林卫视", JLWS),
      _buildButton("宁夏卫视", NXWS),
      _buildButton("青海卫视", QHWS),
      _buildButton("吉林卫视", JLWS),
      _buildButton("新疆卫视", XJWS),
      _buildButton("西藏卫视", XJWS),
      _buildButton("海南卫视", LYWS),
      _buildButton("澳亚卫视", AYWS),
      _buildButton("黑龙江卫视",HLJWS_HD),
      _buildButton("内蒙古卫视", NMGWS),
    ];
  }
  
  List<Widget> _buildLocal(){
    List<Widget> list = [
      _buildButton("北京新闻",BJXW),
      _buildButton("北京影视",BJYS),
      _buildButton("北京体育",BJTY),
      _buildButton("北京文艺",BJWY),
      _buildButton("北京财经",BJCJ),
      _buildButton("北京科教",BJKJ),
      _buildButton("北京生活",BJSH),
      _buildButton("北京青年",BJQN),
      _buildButton("北京纪实",BJTY),
      _buildButton("怀柔电视",HR),
      _buildButton("重庆新闻",CQXW_HD),
//      _buildButton("重庆都市",CQDU_HD),
//      _buildButton("重庆时尚",CQSS_HD),
//      _buildButton("重庆影视",CQYS_HD),
      _buildButton("湖北影视",HBYS),
      _buildButton("蚌埠新闻",BBXW),
      _buildButton("蚌埠公共",BBGG),
      _buildButton("蚌埠生活",BBSH),
      _buildButton("南京娱乐",NJYL),
      _buildButton("南京十八",NJSB),
      _buildButton("南阳新闻",NYXW),
      _buildButton("孝感新闻",XGXW),
      _buildButton("娄底综合",LDZH),
      _buildButton("温州新闻",WZXW),
      _buildButton("温州经济",WZJJ),
//      _buildButton("蚌埠文教",BBWJ),
//      _buildButton("蚌埠公交",BBGJ),
      _buildButton("宁德新闻",NingDeXW),
      _buildButton("安州新闻",AZXW),
      _buildButton("甘肃公共",GSGG),
      _buildButton("荆州新闻",XingZhouXW),
      _buildButton("荣昌综合",RCZH),
      _buildButton("宿州新闻",SZXW),
      _buildButton("宿州公共",SZGG),
      _buildButton("宿州科教",SZKJ),
      _buildButton("亳州新闻",HZXW),
      _buildButton("亳州农村",HZNC),
      _buildButton("亳州农村",HZNC),
      _buildButton("芜湖新闻",WHXW),
      _buildButton("芜湖生活",WHSH),
      _buildButton("芜湖公共",WHGG),
      _buildButton("芜湖教育",WHJY),
      _buildButton("六安新闻",LAXW),
      _buildButton("六安公共",LAGG),
      _buildButton("河北都市",HBDS),
      _buildButton("河北影视",HeBeiYS),
      _buildButton("河北公共",HBGG),
      _buildButton("河北购物",HBGW),
      _buildButton("河北农民",HBNM),
      _buildButton("衡水新闻",HSXW),
      _buildButton("衡水影视",HSYS),
      _buildButton("黄冈新闻",HGXW),
      _buildButton("黄冈公共",HGGG),
      _buildButton("长治1台",CZ1),
      _buildButton("长治2台",CZ2),
      _buildButton("长治3台",CZ3),
      _buildButton("长治县台",CZX),
      _buildButton("长沙新闻",CSXW),
      _buildButton("长沙女性",CSNX),
      _buildButton("长沙经贸",CSJM),
      _buildButton("长沙购物",CSGW),
      _buildButton("长沙公交",CSGJ),
      _buildButton("长沙地铁",CSDT),
      _buildButton("长沙政法",CSZF),
      _buildButton("西安新闻",XAXW),
      _buildButton("西安都市",XADS),
      _buildButton("西安商务",XASW),
      _buildButton("西安影视",XAYS),
      _buildButton("西安丝路",XASL),
      _buildButton("广东科教",GDKJ),
      _buildButton("广东影视",GDYS),
      _buildButton("广元综合",GYZH),
      _buildButton("延边新闻",YBXW),
      _buildButton("湘潭新闻",XFXW),
      _buildButton("滨州新闻",BZXW),
      _buildButton("滁州新闻",XZXW),
      _buildButton("潮安综合",CAZH),
      _buildButton("白城新闻",BCXW),
      _buildButton("福州影视",FZYS),
      _buildButton("福州综合",FZZH),
      _buildButton("襄阳综合",XYZH),
      _buildButton("萧山综合",XSZH),
      _buildButton("遂宁综合",SNZH),
      _buildButton("通化新闻",THXW),
      _buildButton("三明新闻",SMXW),
      _buildButton("中山公共",ZSGG),
      _buildButton("乐清新闻",LQXW),
      _buildButton("包头新闻",BTXW),
      _buildButton("仙桃新闻",XTXW),
      _buildButton("松原新闻",SYXW),
      _buildButton("枣庄新闻",ZZXW),
      _buildButton("梅州综合",MZZH),
      _buildButton("横山新闻",HengShuiXW),
      _buildButton("横山综合",HSZH),
      _buildButton("新疆经济",XJJJ),
      _buildButton("济南影视",JNYS),
      _buildButton("张家口一套",ZJKYT),
      _buildButton("张家港新闻",ZJGXW),
      _buildButton("九寨沟新闻",JZGXW),
      _buildButton("金鹰纪实",JYJS_HD),
//      _buildButton("秦皇岛新闻",QHDXW),
//      _buildButton("秦皇岛政法",QHDZF),
//      _buildButton("秦皇岛影视",QHDYS),
      _buildButton("国家地理",GJDL),
      _buildButton("点掌财经",DZCJ),
      _buildButton("耀才财经",YCCJ),
    ];
    return list;
  }

  List<Widget> _buildGAT(){
    return [
      _buildButton("凤凰中文", FHZW_HD),
      _buildButton("凤凰咨询", FHZX_HD),
      _buildButton("凤凰电影", FHDY_HD),
      _buildButton("香港卫视", HKS),
//      _buildButton("中天综合", ZTZH),
 //     _buildButton("中天新闻", ZTXW),
      _buildButton("TVBS", TVBS),
     // _buildButton("年代新闻", NianDaiXW),
      _buildButton("三立新闻", SLXW),
      _buildButton("东森新闻", DSXW),
      _buildButton("澳门莲花", AMLH),
      _buildButton("澳门卫视", AMWS),
      _buildButton("澳视葡文", ASPW),
      _buildButton("互动新闻", HDXW),
      _buildButton("唯心頻道", WXPD),
      _buildButton("TVB翡翠", FCT),
      _buildButton("TVB明珠", TVBMZ),
      _buildButton("TG频道", TGPD),
      _buildButton("有线新闻", YXXW),
      _buildButton("博斯魅力", BSML),
      _buildButton("澳门1台", AM1),
      _buildButton("澳门2台", AM2),
      _buildButton("大爱I", DA1),
      _buildButton("大爱II", DA2),
      _buildButton("大爱海外", DAHW),

//      _buildButton("东森财经", DSCJ),
//      _buildButton("东森电影", DSDY),
//      _buildButton("东森洋片", DSYP),
//      _buildButton("东森戏剧", DSXJ),
//      _buildButton("靖天戏剧", JTXJ),
//      _buildButton("靖天日本", JTRB),
//      _buildButton("靖天电影", JTDY),
//      _buildButton("寰宇新闻", HYXW),
//      _buildButton("寰宇新闻2", HYXW2),
//      _buildButton("三立台湾", SLTW),
//      _buildButton("卫视电影", WSDY),
//      _buildButton("卫视洋片", WSYP),
//      _buildButton("八大第一", BDDY),
//      _buildButton("八大娱乐", BDYL),
//      _buildButton("八大戏剧", BDXJ),
//      _buildButton("龙华电影", LHDY),
//      _buildButton("龙华经典", LHJD),
//      _buildButton("龙华洋片", LHYP),
//      _buildButton("龙华戏剧", LHXJ),
//      _buildButton("龙华偶像", LHOX),
//      _buildButton("龙华影剧", LHYJ),
//      _buildButton("智林体育", ZLTY),
//      _buildButton("博斯高球1", BSGQ1),
//      _buildButton("博斯高球2", BSGQ2),
//      _buildButton("美食星球", MSXQ),
      _buildButton("台视", TS),
      _buildButton("华视", HS),
      _buildButton("民视", MS),
//      _buildButton("公视", GS),
//      _buildButton("公视二", GS2),
//      _buildButton("公视三", GS3),
      _buildButton("中视", ZS),
//      _buildButton("中视新闻", ZSXW),
//      _buildButton("中视经典", ZSJD),
//      _buildButton("FOX", FOX),
//      _buildButton("FOX SPORT", FOXSPORT),
//      _buildButton("FOX SPORT2", FOXSPORT2),
//      _buildButton("FOX SPORT3", FOXSPORT3),
//      _buildButton("FOX MOVIE", FOXMOVIE),
//      _buildButton("FOX家庭电影", FOXJT),
//      _buildButton("ELEVVEN SPORTS", ELEVVEN),
//      _buildButton("ELEVVEN SPORTS 2", ELEVVEN2),
//      _buildButton("HISTORY", HISTORY),
//      _buildButton("CINEMAX", CINEMAX),
//      _buildButton("Cinema World", CinemaWorld),
//      _buildButton("AXN", AXN),
    ];
  }

  List<Widget> _buildAbroad(){
    return [
      _buildButton("Discovery",DISCOVERY),
     // _buildButton("HBO",HBO),
      _buildButton("Star Sports", START_SPORT),
      _buildButton("Channel[V]",CHANNELV),
      _buildButton("BBC",BBC),
     // _buildButton("TRT WORLD",TRTWORLD),
      _buildButton("VOA",VOA),
      _buildButton("VOTV",VOTV),
      _buildButton("France",FRANCE),
      _buildButton("MTV Now",MTVLove),
      _buildButton("CGNTV",CGNTV),
      _buildButton("CNEX",CNEX),
      _buildButton("MBC",MBC),
      _buildButton("GSTV",GSTV),
      _buildButton("WBRZ",WBRZ),
      _buildButton("JBS",JBS),
      _buildButton("CBN",CBN),
      _buildButton("ABC News",ABCNews),
      _buildButton("Al Hurra",AlHurra),
      _buildButton("NHK World",NHK),
      _buildButton("NHK华语视界",NHKhuayu),
      _buildButton("Buffalo",BUFFALO),
      _buildButton("CBS News",CBSNEWS),
      _buildButton("MediaCorp 8",mediacorp8),
      _buildButton("History 2",History2),
      _buildButton("Newsmax",Newsmax),
      _buildButton("Red Bull TV",REDBULLTV),
      _buildButton("AllSports",ALLSPORTS),
      _buildButton("Rede Atividade",READATIVIDADE),
      _buildButton("Radio Bruno",RB),
      _buildButton("NBC News",NBCNEWS),
      _buildButton("Good TV",GOODTV),
      _buildButton("DD News",DDNEWS),
    ];
  }

  Widget _buildIjkPlayer() {
    IjkPlayer player = IjkPlayer(
      mediaController: _controller,
    );
    return Card(
      margin: EdgeInsets.only(left: 5,right: 5,top: 0,bottom: 0),
      child: Container(
        height: 230,
        child: player,
      )
    );
  }

  Widget _buildButton(String name, String url){
     var pb = ProgressButton(
       defaultWidget: Text(name, style: TextStyle(color: Colors.blue)),
       progressWidget: const CircularProgressIndicator(
           valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)),
       height: 10,
       color: Colors.blueAccent,
       borderRadius: 5,
       animate: false,
       width: double.infinity,
       type: ProgressButtonType.Outline,
       onPressed: () async {
         await _controller.setNetworkDataSource(url, autoPlay: true);
         await Future.delayed(Duration(milliseconds: 3000), () => 42);
       },
     );
     return pb;
  }

}

