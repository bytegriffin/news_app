import 'package:flutter/material.dart';
import '../models/free_movie.dart';
import '../util/image_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_free_movie_detail.dart';

//自定义的免费电影列表页面
class CustomFreeMovieListPage extends StatefulWidget {
  @override
  _CustomFreeMovieListPageState createState() => _CustomFreeMovieListPageState();
}

class _CustomFreeMovieListPageState extends State<CustomFreeMovieListPage> {

  List<FreeMovie> freeMovieList= List<FreeMovie>();

  _buildFreeMovies(){
    freeMovieList.add(FreeMovie("25905044",PageType.Movie,"刺猬索尼克","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2581703367.webp","https://s2.jxtvsb.com/2020/03/07/g6V4MDR3er8Q9du2/index.m3u8"));
    freeMovieList.add(FreeMovie("30160393",PageType.Movie,"哈莉·奎因：猛禽小队","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2575974437.webp","https://v3.szjal.cn/20200308/9pDBprOJ/index.m3u8"));
    freeMovieList.add(FreeMovie("34966347",PageType.Movie,"罗马：幕后纪实","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2585822823.webp","https://www.gentaji.com/20200213/exbCTG3q/index.m3u8"));
    freeMovieList.add(FreeMovie("30128985",PageType.Movie,"勇敢者游戏2：再战巅峰","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2575911093.webp","https://youku.haokzy-tudou.com/ppvod/DFe6WlBk.m3u8"));
    freeMovieList.add(FreeMovie("27000084",PageType.Movie,"变身特工","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2577340942.webp","https://v3.szjal.cn/20200307/3EnAmov2/index.m3u8"));
    freeMovieList.add(FreeMovie("27080656",PageType.Movie,"普罗米亚","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2546169134.webp","https://www.gentaji.com/20200206/LpP6h30h/index.m3u8"));
    freeMovieList.add(FreeMovie("30434174",PageType.Movie,"遗愿清单","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2555841251.webp","https://youku.haokzy-tudou.com/ppvod/TRNLZdzO.m3u8"));
    freeMovieList.add(FreeMovie("30257175",PageType.Movie,"燃烧女子的肖像","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2584308261.webp","https://youku.com-ok-56.com/20191218/20838_c8c7eaf0/index.m3u8"));
    freeMovieList.add(FreeMovie("30241298",PageType.Movie,"南山的部长们","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2581888792.webp","https://hallo.sc2yun.com/vod/hls/1582382365084_naann0f8nn8t.m3u8"));
    freeMovieList.add(FreeMovie("27062638",PageType.Movie,"剧场版 吹响！上低音号～誓言的终章～ 劇場版","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2542569367.webp","https://www.mmicloud.com/20191221/jMMXRADH/index.m3u8"));
    freeMovieList.add(FreeMovie("27132510",PageType.Movie,"教宗的承继","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2567299222.webp","https://www.mmicloud.com/20191221/wjfCQmYY/index.m3u8"));
    freeMovieList.add(FreeMovie("25842038",PageType.Movie,"理查德·朱维尔的哀歌","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2578705064.webp","https://youku.haokzy-tudou.com/ppvod/NRsO3luw.m3u8"));
    freeMovieList.add(FreeMovie("33424345",PageType.Movie,"紫罗兰永恒花园外传：永远与自动手记人偶","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2578722076.webp","https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_a168a1ef363f57a7e34d577748d3cae0.mp4"));
    freeMovieList.add(FreeMovie("34453138",PageType.Movie,"第92届奥斯卡颁奖典礼","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2584156190.webp","https://meng.wuyou-zuida.com/20200212/25740_1392b480/index.m3u8"));
    freeMovieList.add(FreeMovie("30329892",PageType.Movie,"航海王：狂热行动","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2570039912.webp","https://youku.haokzy-tudou.com/ppvod/jsFEkdYf.m3u8"));
    freeMovieList.add(FreeMovie("30252495",PageType.Movie,"1917","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2570243317.webp","https://youku.haokzy-tudou.com/ppvod/k71LPzr8.m3u8"));
    freeMovieList.add(FreeMovie("27119724",PageType.Movie,"小丑 Joker","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2567198874.webp","https://youku.haokzy-tudou.com/ppvod/4yf2LZrW.m3u8"));
    freeMovieList.add(FreeMovie("6981153",PageType.Movie,"爱尔兰人","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2568902055.webp","https://youku.haokzy-tudou.com/ppvod/0p8xRuyT.m3u8"));
    freeMovieList.add(FreeMovie("27010768",PageType.Movie,"寄生虫","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2561439800.webp","https://youku.haokzy-tudou.com/ppvod/gsCepFJN.m3u8"));
    freeMovieList.add(FreeMovie("6538866",PageType.Movie,"极速车王","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2568792942.webp","https://v3.szjal.cn/20200108/5kLLXfSq/index.m3u8"));
    freeMovieList.add(FreeMovie("25887288",PageType.Movie,"冰雪奇缘2","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2572847101.webp","https://youku.haokzy-tudou.com/ppvod/HF7UZpnv.m3u8"));
    freeMovieList.add(FreeMovie("4202982",PageType.Movie,"冰雪奇缘","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2166640945.webp","https://youku.haokzy-tudou.com/ppvod/zAdbVzTG.m3u8"));
    freeMovieList.add(FreeMovie("30241102",PageType.Movie,"行骗天下JP：浪漫篇","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2549891899.webp","https://youku.haokzy-tudou.com/ppvod/yNi5yllf.m3u8"));
    freeMovieList.add(FreeMovie("33415943",PageType.Movie,"我失去了身体","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2553909340.webp","https://youku.haokzy-tudou.com/ppvod/fTI8aBB1.m3u8"));
    freeMovieList.add(FreeMovie("27000981",PageType.Movie,"多力特的奇幻冒险","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2580751143.webp","https://youku.haokzy-tudou.com/ppvod/H5uCHgxW.m3u8"));
    freeMovieList.add(FreeMovie("30209084",PageType.Movie,"对不起，我们错过了你","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2572138412.webp","https://youku.haokzy-tudou.com/ppvod/dEVLzsON.m3u8"));
    freeMovieList.add(FreeMovie("34907421",PageType.Movie,"美利坚女士","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2580967404.webp","https://tv1.youkutv.cc/2020/02/01/KGwg74T06AGLGHM3/playlist.m3u8"));
    freeMovieList.add(FreeMovie("26348103",PageType.Movie,"小妇人","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2575325937.webp","https://youku.haokzy-tudou.com/ppvod/eE5NTMRm.m3u8"));
    freeMovieList.add(FreeMovie("34797487",PageType.Movie,"发之恋","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2583987514.webp","https://s1.135-cdn.com/20200210/2RGvyXWswjQmaPeC/index.m3u8"));
    freeMovieList.add(FreeMovie("34787747",PageType.Movie,"最初的梦想","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2570421055.webp","https://www.mmicloud.com/20191118/oJJLAstF/index.m3u8"));
    freeMovieList.add(FreeMovie("30329902",PageType.Movie,"青春期猪头少年不做怀梦少女的梦","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2565422819.webp","https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_4bfb07bf41cb13963cbcb6231327c06f.mp4"));
    freeMovieList.add(FreeMovie("30331965",PageType.Movie,"东京食尸鬼 真人版2","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2553264096.webp","https://www.gentaji.com/20200215/pH4gL7PO/index.m3u8"));
    freeMovieList.add(FreeMovie("26817016",PageType.Movie,"东京食尸鬼 真人版","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2480765579.webp","https://youku.com-youku.com/20171221/4wmbXmbZ/index.m3u8"));
    freeMovieList.add(FreeMovie("27073179",PageType.Movie,"邻里美好的一天","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2579889073.webp","https://v3.szjal.cn/20200101/G2lirT1C/index.m3u8"));
    freeMovieList.add(FreeMovie("30462527",PageType.Movie,"基督圣体","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2567988621.webp","https://v3.szjal.cn/20200214/spJi5H4S/index.m3u8"));
    freeMovieList.add(FreeMovie("26282448",PageType.Movie,"火影忍者剧场版：博人传","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2251539632.webp","https://youku.cdn6-okzy.com/20191106/6116_b92dd0af/index.m3u8"));
    freeMovieList.add(FreeMovie("30129008",PageType.Movie,"宝贝男孩","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2568099437.webp","https://www.gentaji.com/20200130/9BzZJ9Tm/index.m3u8"));
    freeMovieList.add(FreeMovie("4301043",PageType.Movie,"传染病","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p1213203384.webp","https://youku.haokzy-tudou.com/ppvod/asjyrjOD.m3u8"));
    freeMovieList.add(FreeMovie("30289194",PageType.Movie,"爆炸新闻","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2571554907.webp","https://youku.haokzy-tudou.com/ppvod/ilrW6Kct.m3u8"));
    freeMovieList.add(FreeMovie("30331959",PageType.Movie,"黑水","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2569450232.webp","https://v3.szjal.cn/20200127/esNP9duV/index.m3u8"));
    freeMovieList.add(FreeMovie("26858510",PageType.Movie,"克劳斯：圣诞节的秘密 Klaus","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2570825762.webp","https://youku.haokzy-tudou.com/ppvod/vA74tBbz.m3u8"));
    freeMovieList.add(FreeMovie("26786669",PageType.Movie,"决战中途岛","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2573582192.webp","https://youku.cdn6-okzy.com/20200217/12729_570d29a3/index.m3u8"));
    freeMovieList.add(FreeMovie("30394807",PageType.Movie,"蜡笔小新：新婚旅行飓风之遗失的野原广志","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2549326655.webp","https://baidu.com-ok-baidu.com/20191013/15331_62825e77/index.m3u8"));
    freeMovieList.add(FreeMovie("26100958",PageType.Movie,"复仇者联盟4：终局之战","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2552058346.webp","https://youku.haokzy-tudou.com/ppvod/fhAfitLK.m3u8"));
    freeMovieList.add(FreeMovie("24773958",PageType.Movie,"复仇者联盟3：无限战争","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2517753454.webp","https://youku.haokzy-tudou.com/ppvod/8f63xeju.m3u8"));
    freeMovieList.add(FreeMovie("10741834",PageType.Movie,"复仇者联盟2：奥创纪元","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2237747953.webp","https://youku.haokzy-tudou.com/ppvod/J7CqKh2U.m3u8"));
    freeMovieList.add(FreeMovie("1866479",PageType.Movie,"复仇者联盟","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1469137689.webp","https://youku.haokzy-tudou.com/ppvod/bGjLASyd.m3u8"));
    freeMovieList.add(FreeMovie("26931786",PageType.Movie,"蜘蛛侠：英雄远征","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2558293106.webp","https://baidu.com-ok-baidu.com/20190912/14950_e222f712/index.m3u8"));
    freeMovieList.add(FreeMovie("26374197",PageType.Movie,"蜘蛛侠：平行宇宙","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2542867516.webp","https://youku.haokzy-tudou.com/ppvod/T91XfGYS.m3u8"));
    freeMovieList.add(FreeMovie("30318116",PageType.Movie,"利刃出鞘","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2574172427.webp","https://youku.haokzy-tudou.com/ppvod/mhcf32Ti.m3u8"));
    freeMovieList.add(FreeMovie("30327842",PageType.Movie,"82年生的金智英","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2578045524.webp","https://youku.haokzy-tudou.com/ppvod/fhLte5FN.m3u8"));
    freeMovieList.add(FreeMovie("27087724",PageType.Movie,"好莱坞往事","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2551119672.webp","https://tv.youkutv.cc/2019/11/20/F0tvuB2KpNkFl0xf/playlist.m3u8"));
    freeMovieList.add(FreeMovie("26426056",PageType.Movie,"沉睡魔咒2","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2570105165.webp","https://youku.haokzy-tudou.com/ppvod/IBUkLScM.m3u8"));
    freeMovieList.add(FreeMovie("30327897",PageType.Movie,"漫长的告别","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2546226109.webp","https://www.mmicloud.com/20191208/wBSe5D2U/index.m3u8"));
    freeMovieList.add(FreeMovie("30271841",PageType.Movie,"多哥","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2575882765.webp","https://youku.haokzy-tudou.com/ppvod/2mNcpO98.m3u8"));
    freeMovieList.add(FreeMovie("27002635",PageType.Movie,"唐顿庄园","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2575400017.webp","https://youku.haokzy-tudou.com/ppvod/8EZvxIyB.m3u8"));
    freeMovieList.add(FreeMovie("30334073",PageType.Movie,"调音师","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2551995207.webp","https://youku.com-iqiyi.net/20190404/22397_5d2018a7/index.m3u8"));
    freeMovieList.add(FreeMovie("30208010",PageType.Movie,"名侦探柯南：绀青之拳","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2566225091.webp","https://youku.haokzy-tudou.com/ppvod/c0T6hYQu.m3u8"));
    freeMovieList.add(FreeMovie("27110363",PageType.Movie,"名侦探柯南：零的执行人","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2537694239.webp","https://youku.haokzy-tudou.com/ppvod/abpBRAMk.m3u8"));
    freeMovieList.add(FreeMovie("27615467",PageType.Movie,"女大法官金斯伯格 RBG","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2511664915.webp","https://youku.haokzy-tudou.com/ppvod/JjH1BNL2.m3u8"));
    freeMovieList.add(FreeMovie("26929010",PageType.Movie,"雪人奇缘","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2567925521.webp","https://youku.haokzy-tudou.com/ppvod/e72Z6Kpe.m3u8"));
    freeMovieList.add(FreeMovie("30167509",PageType.Movie,"徒手攀岩","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2566598269.webp","https://youku.haokzy-tudou.com/ppvod/43XXBkxp.m3u8"));
    freeMovieList.add(FreeMovie("30249161",PageType.Movie,"哆啦A梦：大雄的月球探险记","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2557500825.webp","https://baidu.com-l-baidu.com/20190808/14541_77c9f6ad/index.m3u8"));
    freeMovieList.add(FreeMovie("27179039",PageType.Movie,"朱迪 Judy","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2570099577.webp","https://youku.haokzy-tudou.com/ppvod/5EyVdBnX.m3u8"));
    freeMovieList.add(FreeMovie("6850547",PageType.Movie,"玩具总动员4","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2557284230.webp","https://youku.haokzy-tudou.com/ppvod/BapS0wUg.m3u8"));
    freeMovieList.add(FreeMovie("10432911",PageType.Movie,"流感","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2029391129.webp","https://youku.cdn-tudou.com/20180520/6062_c2434315/index.m3u8"));
    freeMovieList.add(FreeMovie("30170546",PageType.Movie,"乔乔的异想世界","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2567973073.webp","https://youku.haokzy-tudou.com/ppvod/5BhOPIxS.m3u8"));
    freeMovieList.add(FreeMovie("30198539",PageType.Movie,"痛苦与荣耀","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2554080075.webp","https://youku.haokzy-tudou.com/ppvod/GOclbi2Z.m3u8"));
    freeMovieList.add(FreeMovie("27166442",PageType.Movie,"夏目友人帐 劇場版","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2546745948.webp","https://youku.haokzy-tudou.com/ppvod/GIgblGFZ.m3u8"));
    freeMovieList.add(FreeMovie("2244426",PageType.Movie,"雷霆沙赞！","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2551249211.webp","https://youku.haokzy-tudou.com/ppvod/Htk4kCfT.m3u8"));
    freeMovieList.add(FreeMovie("1652592",PageType.Movie,"阿丽塔：战斗天使","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2544987866.webp","https://youku.haokzy-tudou.com/ppvod/KX6ti133.m3u8"));
    freeMovieList.add(FreeMovie("26835471",PageType.Movie,"大侦探皮卡丘","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2555538168.webp","https://youku.haokzy-tudou.com/ppvod/HopoKAxD.m3u8"));
    freeMovieList.add(FreeMovie("2998270",PageType.Movie,"大侦探福尔摩斯","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p1078047854.webp","https://youku.haokzy-tudou.com/ppvod/BmE1oMQE.m3u8"));
    freeMovieList.add(FreeMovie("4051753",PageType.Movie,"大侦探福尔摩斯2：诡影游戏","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p1327387815.webp","https://youku.haokzy-tudou.com/ppvod/Ar2WwjTN.m3u8"));
    freeMovieList.add(FreeMovie("25807345",PageType.Movie,"彗星来的那一夜","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2187896734.webp","https://56.com-t-56.com/20190219/5433_5623400f/index.m3u8"));
    freeMovieList.add(FreeMovie("25726614",PageType.Movie,"神奇动物在哪里","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2392444121.webp","https://youku.com-iqiyi.net/20180126/6IpyMvd9/index.m3u8"));
    freeMovieList.add(FreeMovie("26147417",PageType.Movie,"神奇动物：格林德沃之罪","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2538826177.webp","https://www6.yuboyun.com/hls/2019/07/26/iD5N7DZT/playlist.m3u8"));
    freeMovieList.add(FreeMovie("1819388",PageType.Movie,"波斯王子：时之刃","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p591951327.webp","https://youku.com-zx-iqiyi.com/20191129/9668_9edb8384/index.m3u8"));
    freeMovieList.add(FreeMovie("3006772",PageType.Movie,"第九区","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1086352249.webp","https://zuikzy.wb699.com/20180204/liuaBlF3/index.m3u8"));
    freeMovieList.add(FreeMovie("1966182",PageType.Movie,"霍比特人1：意外之旅","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p1862769025.webp","https://www3.yuboyun.com/hls/2018/11/12/LECh5h3U/playlist.m3u8"));
    freeMovieList.add(FreeMovie("11606328",PageType.Movie,"霍比特人2：史矛革之战","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2166784595.webp","https://www3.yuboyun.com/hls/2018/11/12/UyG4y6Mi/playlist.m3u8"));
    freeMovieList.add(FreeMovie("2973079",PageType.Movie,"霍比特人3：五军之战","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2219406504.webp","https://www3.yuboyun.com/hls/2018/11/12/L1Q6zaeV/playlist.m3u8"));
    freeMovieList.add(FreeMovie("26419637",PageType.Movie,"误杀瞒天记","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2574266567.webp","https://youku.haokzy-tudou.com/ppvod/WoVWMsDZ.m3u8"));
    freeMovieList.add(FreeMovie("25863940",PageType.Movie,"预告犯","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2232713173.webp","https://youku.cdn-56.com/20180129/8jgtO1WG/index.m3u8"));
    freeMovieList.add(FreeMovie("26387939",PageType.Movie,"摔跤吧！爸爸","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2457983084.webp","https://tudou.com-l-tudou.com/20181206/14831_ef71cd9f/index.m3u8"));
    freeMovieList.add(FreeMovie("26636712",PageType.Movie,"蚁人2：黄蜂女现身","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2529389608.webp","https://youku.haokzy-tudou.com/ppvod/xse7Nph4.m3u8"));
    freeMovieList.add(FreeMovie("1866473",PageType.Movie,"蚁人","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2266823371.webp","https://youku.com-iqiyi.net/20171128/JQPNBqRh/index.m3u8"));
    freeMovieList.add(FreeMovie("3878007",PageType.Movie,"海王","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2541280047.webp","https://youku.haokzy-tudou.com/ppvod/Uz62YShX.m3u8"));
    freeMovieList.add(FreeMovie("30330264",PageType.Movie,"最大的小小农场","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2553166408.webp","https://baidu.com-ok-baidu.com/20190907/14893_1e9ec534/index.m3u8"));
    freeMovieList.add(FreeMovie("27060077",PageType.Movie,"绿皮书","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2549177902.webp","https://youku.haokzy-tudou.com/ppvod/BdUYJI9F.m3u8"));
    freeMovieList.add(FreeMovie("3008715",PageType.Movie,"红色翅膀：火烈鸟故事","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2534777091.webp","https://yun.zxziyuan-yun.com/20180219/Khl3wXnJ/index.m3u8"));
    freeMovieList.add(FreeMovie("1294497",PageType.Movie,"飓风","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p1970425151.webp","https://vip.okokbo.com/20171213/6GLCEVlC/index.m3u8"));
    freeMovieList.add(FreeMovie("10741871",PageType.Movie,"地球之盐","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2205830188.webp","https://sina.com-h-sina.com/20180725/380_44431f91/index.m3u8"));
    freeMovieList.add(FreeMovie("26611804",PageType.Movie,"三块广告牌","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2510081688.webp","https://youku.haokzy-tudou.com/ppvod/AoniuTEL.m3u8"));
    freeMovieList.add(FreeMovie("26336252",PageType.Movie,"碟中谍6：全面瓦解","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2529365085.webp","https://youku.haokzy-tudou.com/ppvod/lfwemC7h.m3u8"));
    freeMovieList.add(FreeMovie("26580232",PageType.Movie,"看不见的客人","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2498971355.webp","https://youku.haokzy-tudou.com/ppvod/k9NS96Wm.m3u8"));
    freeMovieList.add(FreeMovie("30170448",PageType.Movie,"何以为家","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2555295759.webp","https://youku.haokzy-tudou.com/ppvod/h24kLZnX.m3u8"));
    freeMovieList.add(FreeMovie("26683290",PageType.Movie,"你的名字","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2395733377.webp","https://youku.haokzy-tudou.com/ppvod/gsjypRSO.m3u8"));
    freeMovieList.add(FreeMovie("3793023",PageType.Movie,"三傻大闹宝莱坞","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p579729551.webp","https://youku.haokzy-tudou.com/ppvod/zeeJTKRn.m3u8"));
    freeMovieList.add(FreeMovie("1294323",PageType.Movie,"第一滴血","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2485300934.webp","https://youku.haokzy-tudou.com/ppvod/uYzpl8w8.m3u8"));
    freeMovieList.add(FreeMovie("1300361",PageType.Movie,"第一滴血2","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2485316784.webp","https://youku.haokzy-tudou.com/ppvod/Zu2fFB50.m3u8"));
    freeMovieList.add(FreeMovie("1300399",PageType.Movie,"第一滴血3","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2243764496.webp","https://youku.haokzy-tudou.com/ppvod/zSmA1mWq.m3u8"));
    freeMovieList.add(FreeMovie("1440855",PageType.Movie,"第一滴血4","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p456972157.webp","https://youku.haokzy-tudou.com/ppvod/X9xbmcYT.m3u8"));
    freeMovieList.add(FreeMovie("10546436",PageType.Movie,"第一滴血5","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2564519086.webp","https://youku.haokzy-tudou.com/ppvod/OXOLjm96.m3u8"));
    freeMovieList.add(FreeMovie("6390825",PageType.Movie,"黑豹","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2512123434.webp","https://tudou.com-l-tudou.com/20180501/10726_d027d600/index.m3u8"));
    freeMovieList.add(FreeMovie("3025375",PageType.Movie,"奇异博士","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2388501883.webp","https://youku.haokzy-tudou.com/ppvod/qXmWcwRb.m3u8"));
    freeMovieList.add(FreeMovie("27024959",PageType.Movie,"绝杀慕尼黑","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2556883031.webp","https://youku.haokzy-tudou.com/ppvod/aXGCJbJB.m3u8"));
    freeMovieList.add(FreeMovie("6786002",PageType.Movie,"触不可及","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p1454261925.webp","https://zuikzy.wb699.com/20180123/S5jf6E1Q/index.m3u8"));
    freeMovieList.add(FreeMovie("1291561",PageType.Movie,"千与千寻","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2557573348.webp","https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_8a726c3f0e86246409ae5c63b5273cfb.mp4"));
    freeMovieList.add(FreeMovie("3541415",PageType.Movie,"盗梦空间","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p513344864.webp","https://cdn.letv-cdn.com/2019/04/20/KwnVRO0LUgBtvQkz/playlist.m3u8"));
    freeMovieList.add(FreeMovie("1291560",PageType.Movie,"龙猫","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2540924496.webp","https://zuikzy.wb699.com/20180227/A6pf9JHI/index.m3u8"));
    freeMovieList.add(FreeMovie("1304102",PageType.Movie,"谍影重重","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p1597183981.webp","https://youku.haokzy-tudou.com/ppvod/1ZumBUMX.m3u8"));
    freeMovieList.add(FreeMovie("1308767",PageType.Movie,"谍影重重2","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p667644866.webp","https://youku.haokzy-tudou.com/ppvod/G0jaRkyY.m3u8"));
    freeMovieList.add(FreeMovie("1578507",PageType.Movie,"谍影重重3","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p792223507.webp","https://youku.haokzy-tudou.com/ppvod/FasIG9i5.m3u8"));
    freeMovieList.add(FreeMovie("3001077",PageType.Movie,"谍影重重4","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1706819167.webp","https://youku.haokzy-tudou.com/ppvod/ok55yYdG.m3u8"));
    freeMovieList.add(FreeMovie("26266072",PageType.Movie,"谍影重重5","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2379032162.webp","https://youku.haokzy-tudou.com/ppvod/iib9yYh5.m3u8"));
    freeMovieList.add(FreeMovie("1309021",PageType.Movie,"康斯坦丁","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p907374250.webp","https://youku.haokzy-tudou.com/ppvod/us5uhmUA.m3u8"));
    freeMovieList.add(FreeMovie("1292052",PageType.Movie,"肖申克的救赎","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p480747492.webp","https://youku.haokzy-tudou.com/ppvod/wSJ3frKv.m3u8"));
    freeMovieList.add(FreeMovie("1292063",PageType.Movie,"美丽人生","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2578474613.webp","https://cdn.zypbo.com/20180826/Gwfqdx4H/index.m3u8"));
    freeMovieList.add(FreeMovie("1292001",PageType.Movie,"海上钢琴师","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2574551676.webp","https://youku.com-youku.net/20180708/18349_9474248c/index.m3u8"));
    freeMovieList.add(FreeMovie("2131459",PageType.Movie,"机器人总动员","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p1461851991.webp","https://bili.meijuzuida.com/20191006/21593_7bdbc82f/index.m3u8"));
    freeMovieList.add(FreeMovie("1485260",PageType.Movie,"返老还童","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2192535722.webp","https://yun.zxziyuan-yun.com/20180603/cjPrTYKM/index.m3u8"));
    freeMovieList.add(FreeMovie("2129039",PageType.Movie,"飞屋环游记","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p485887754.webp","https://vip.okokbo.com/20171212/dsQXLHpV/index.m3u8"));
    freeMovieList.add(FreeMovie("1292285",PageType.Movie,"微观世界","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2238284977.webp","https://youku.com-youku.com/20180109/HQGURyRN/index.m3u8"));
    freeMovieList.add(FreeMovie("24815950",PageType.Movie,"万物理论","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2210832820.webp","https://zy.512wx.com/20171204/hkzoeTVa/index.m3u8"));
    freeMovieList.add(FreeMovie("1291583",PageType.Movie,"天空之城","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1446261379.webp","https://vs1.baduziyuan.com/20180331/yrsGld67/index.m3u8"));
    freeMovieList.add(FreeMovie("21937445",PageType.Movie,"辩护人","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2158166535.webp","https://youku.com-iqiyi.net/20181223/20538_2f334110/index.m3u8"));
    freeMovieList.add(FreeMovie("3011336",PageType.Movie,"海底世界3D","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p1959641951.webp","https://youku.com-youku.com/20171228/soPImJV4/index.m3u8"));
    freeMovieList.add(FreeMovie("1292224",PageType.Movie,"飞越疯人院","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p792238287.webp","https://sina.com-h-sina.com/20180823/13064_b7b5a2c7/index.m3u8"));
    freeMovieList.add(FreeMovie("27191405",PageType.Movie,"进击的巨人剧场版：觉醒的咆哮","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2531265461.webp","https://sina.com-h-sina.com/20180908/19132_c4447db8/index.m3u8"));
    freeMovieList.add(FreeMovie("1303021",PageType.Movie,"小鞋子","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2173580536.webp","https://vip.okokbo.com/20171213/gnCkxpTr/index.m3u8"));
    freeMovieList.add(FreeMovie("3008247",PageType.Movie,"穿条纹睡衣的男孩","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p1473670352.webp","https://605ziyuan.com/20180516/WMirQhuT/index.m3u8"));
    freeMovieList.add(FreeMovie("1780330",PageType.Movie,"致命魔术","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p480383375.webp","https://feifei.feifeizuida.com/20191006/19503_5718cf70/index.m3u8"));
    freeMovieList.add(FreeMovie("25777512",PageType.Movie,"要听神明的话","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2207809849.webp","https://yingxiong.qiling-yongjiu.com/20191219/16208_659b1e4c/index.m3u8"));
    freeMovieList.add(FreeMovie("1292223",PageType.Movie,"七宗罪","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p457631605.webp","https://wuji.zhulong-zuida.com/20191006/10323_d7156298/index.m3u8"));
    freeMovieList.add(FreeMovie("1292343",PageType.Movie,"蝴蝶效应","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2209066019.webp","https://wuji.zhulong-zuida.com/20191006/10325_f4066326/index.m3u8"));
    freeMovieList.add(FreeMovie("25958717",PageType.Movie,"海蒂和爷爷","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2554525534.webp","https://cn2.zuidadianying.com/20190523/5Yazx784/index.m3u8"));
    freeMovieList.add(FreeMovie("1297359",PageType.Movie,"幽灵公主","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p1613191025.webp","https://zuikzy.wb699.com/20180223/y3bQPk64/index.m3u8"));
    freeMovieList.add(FreeMovie("6985810",PageType.Movie,"狩猎","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1546987967.webp","https://hls.aoxtv.com/v2.szjal.cn/20190406/pC6pHhO2/index.m3u8"));
    freeMovieList.add(FreeMovie("26799731",PageType.Movie,"请以你的名字呼唤我","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2505525050.webp","https://vs1.baduziyuan.com/20171223/yOh30dQL/index.m3u8"));
    freeMovieList.add(FreeMovie("10777687",PageType.Movie,"7号房的礼物","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p1816276065.webp","https://zy.zxziyuan-yun.com/20180304/ggstRZYH/index.m3u8"));
    freeMovieList.add(FreeMovie("3072124",PageType.Movie,"玛丽和马克思","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2162822165.webp","https://yi.jingdianzuida.com/20191122/lMlvSCji/index.m3u8"));
    freeMovieList.add(FreeMovie("21360417",PageType.Movie,"恐怖直播","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2016930906.webp","https://www.ziyuan605.com/20190222/KD5u9UpS/index.m3u8"));
    freeMovieList.add(FreeMovie("11026735",PageType.Movie,"超能陆战队","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2224568669.webp","https://video.suyunbo.tv/20171021/Vu4Qgaym/index.m3u8"));
    freeMovieList.add(FreeMovie("10577869",PageType.Movie,"时空恋旅人","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2070153774.webp","https://www.ziyuan605.com/20190210/bxyvwrgr/index.m3u8"));
    freeMovieList.add(FreeMovie("1295399",PageType.Movie,"七武士","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2572674785.webp","https://leshi.iqiyi-kuyunzy.com/20190224/3611_0bd210c2/index.m3u8"));
    freeMovieList.add(FreeMovie("1301777",PageType.Movie,"幻想曲2000","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p643090411.webp","https://www.mycqzx.com:65/20190923/HUjODKVK/index.m3u8"));
    freeMovieList.add(FreeMovie("26059437",PageType.Movie,"第四公民","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2206143129.webp","https://www.mycqzx.com:65/20190817/sI0v2lps/index.m3u8"));
    freeMovieList.add(FreeMovie("6307447",PageType.Movie,"被解救的姜戈","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1959232369.webp","https://cn2.zuidadianying.com/20190214/Vk7vszuG/index.m3u8"));
    freeMovieList.add(FreeMovie("1293318",PageType.Movie,"萤火虫之墓","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1157334208.webp","https://yi.jingdianzuida.com/20191122/hQpafoJ8/index.m3u8"));
    freeMovieList.add(FreeMovie("24750126",PageType.Movie,"荒蛮故事","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2231250054.webp","https://zuikzy.wb699.com/20180301/YP8TLSSY/index.m3u8"));
    freeMovieList.add(FreeMovie("4920389",PageType.Movie,"头号玩家","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2516578307.webp","https://youku.cdn-iqiyi.com/20180509/10854_73d2e0ca/index.m3u8"));
    freeMovieList.add(FreeMovie("26874505",PageType.Movie,"人生果实","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2544912792.webp","https://zuikzy.wb699.com/20180117/t4YPznrr/index.m3u8"));
    freeMovieList.add(FreeMovie("10533913",PageType.Movie,"头脑特工队","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2266293606.webp","https://hong.tianzhen-zuida.com/20191018/11245_50bb341c/index.m3u8"));
    freeMovieList.add(FreeMovie("1309163",PageType.Movie,"恋恋笔记本","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p483604864.webp","https://zuikzy.wb699.com/20180205/ssJrDWHc/index.m3u8"));
    freeMovieList.add(FreeMovie("26787574",PageType.Movie,"奇迹男孩","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2507709428.webp","https://v8.yongjiu8.com/20180320/aKGua8AB/index.m3u8"));
    freeMovieList.add(FreeMovie("10808442",PageType.Movie,"爱在午夜降临前","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2074715729.webp","https://hong.tianzhen-zuida.com/20191019/11320_ea4561f7/index.m3u8"));
    freeMovieList.add(FreeMovie("3075287",PageType.Movie,"源代码","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p988260245.webp","https://bili.meijuzuida.com/20191002/21558_71d5654c/index.m3u8"));
    freeMovieList.add(FreeMovie("1422063",PageType.Movie,"最终幻想7：圣子降临","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2221176547.webp","http://youku.com-ok-56.com/20191222/20905_613ff7ac/index.m3u8"));
    freeMovieList.add(FreeMovie("26762709",PageType.Movie,"最终幻想15：王者之剑","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2436217927.webp","https://hair.jingpin88.com/20171105/veLZnqgf/index.m3u8"));
    freeMovieList.add(FreeMovie("1298744",PageType.Movie,"十二猴子","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p627041570.webp","https://feifei.feifeizuida.com/20191009/19718_e647f5ac/index.m3u8"));
    freeMovieList.add(FreeMovie("1300618",PageType.Movie,"空中监狱","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2356027791.webp","https://zuikzy.wb699.com/20180224/KsltJ9c8/index.m3u8"));
    freeMovieList.add(FreeMovie("6146955",PageType.Movie,"寿司之神","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p1779492381.webp","https://www.mycqzx.com:65/20190813/aIR5cn5j/index.m3u8"));
    freeMovieList.add(FreeMovie("27024903",PageType.Movie,"天才枪手","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2501863104.webp","https://www.mmicloud.com/20190412/l9ly05n6/index.m3u8"));
    freeMovieList.add(FreeMovie("4023638",PageType.Movie,"国王的演讲","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p768879237.webp","https://www.mmicloud.com/20190323/r6Ir5Kaf/index.m3u8"));
    freeMovieList.add(FreeMovie("1418752",PageType.Movie,"万能钥匙","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p810384382.webp","https://www.mmicloud.com/20190310/bzsjf1Su/index.m3u8"));
    freeMovieList.add(FreeMovie("6791750",PageType.Movie,"起风了","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1998028598.webp","https://www.mmicloud.com/20190419/aP9FL89q/index.m3u8"));
    freeMovieList.add(FreeMovie("11584016",PageType.Movie,"与神同行：罪与罚","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2500130777.webp","https://www.mycqzx.com:65/20190707/cW2rFeZG/index.m3u8"));
    freeMovieList.add(FreeMovie("4301181",PageType.Movie,"特种部队2：全面反击","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p1811974432.webp","https://www.mmicloud.com/20190521/MfSuAHXE/index.m3u8"));
    freeMovieList.add(FreeMovie("1291585",PageType.Movie,"风之谷","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p1917567652.webp","https://www.mmicloud.com/20190419/KgQ3paFA/index.m3u8"));
    freeMovieList.add(FreeMovie("3011051",PageType.Movie,"恐怖游轮","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p462470694.webp","https://www.mmicloud.com/20190618/x9wjBevW/index.m3u8"));
    freeMovieList.add(FreeMovie("19899707",PageType.Movie,"驯龙高手3","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2546335362.webp","https://www.mycqzx.com:65/20190814/x8W6liPs/index.m3u8"));
    freeMovieList.add(FreeMovie("20438964",PageType.Movie,"无敌破坏王2：大闹互联网","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2537667301.webp","https://www.mmicloud.com/20190326/cAg3HBi6/index.m3u8"));
    freeMovieList.add(FreeMovie("3054150",PageType.Movie,"非洲猫科","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p1286333470.webp","https://you-cdn.maque-zuida.com/20191226/KNGp86d1/index.m3u8"));
    freeMovieList.add(FreeMovie("7059671",PageType.Movie,"最佳出价","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2039855496.webp","https://www.mmicloud.com/20190321/gRqcCQAH/index.m3u8"));
    freeMovieList.add(FreeMovie("25954475",PageType.Movie,"聚焦","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2263822658.webp","https://youku.com-t-youku.com/20190419/14604_86ba7537/index.m3u8"));
    freeMovieList.add(FreeMovie("2310158",PageType.Movie,"猫和老鼠：胡桃夹子的传奇","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2240126102.webp","https://www.mycqzx.com:65/20190703/O3spIWtq/index.m3u8"));
    freeMovieList.add(FreeMovie("1428175",PageType.Movie,"血钻","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p1244017073.webp","https://www.mmicloud.com/20190404/qlrRdH1S/index.m3u8"));
    freeMovieList.add(FreeMovie("10558447",PageType.Movie,"啪嗒啪嗒","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p1644911676.webp","https://www.mmicloud.com/20190601/jND3GbuB/index.m3u8"));
    freeMovieList.add(FreeMovie("1294461",PageType.Movie,"仙履奇缘","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p1833051594.webp","https://youku.com-l-youku.com/20181209/2393_c2491b0b/index.m3u8"));
    freeMovieList.add(FreeMovie("1291568",PageType.Movie,"东京物语","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p1925331564.webp","https://156zy.suyunbo.tv/2018/12/04/6WIjg3WTlllL6iLk/playlist.m3u8"));
    freeMovieList.add(FreeMovie("1296538",PageType.Movie,"小飞侠","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p1161429881.webp","https://hair.jingpin88.com/20171111/SgYxDRQB/index.m3u8"));
    freeMovieList.add(FreeMovie("1293374",PageType.Movie,"热天午后","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2100141196.webp","https://leshi.iqiyi-kuyunzy.com/20190309/4721_4d8e71ea/index.m3u8"));
    freeMovieList.add(FreeMovie("1293908",PageType.Movie,"城市之光","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2170238828.webp","https://www.mmicloud.com/20190619/s3ti6AbV/index.m3u8"));
    freeMovieList.add(FreeMovie("1300267",PageType.Movie,"乱世佳人","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p1963126880.webp","https://vip.okokbo.com/20171214/l3nQISrD/index.m3u8"));
  }

  @override
  void initState() {
    super.initState();
    _buildFreeMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text("免费观影"),
//        leading:GestureDetector(
//          child: Icon(Icons.arrow_back),
//          onTap: (){
//            Navigator.of(context).pop();
//          },
//        ),
//      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 0,
              childAspectRatio: 4 / 6,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return getMovieItem(freeMovieList[index]);
              },
              childCount: freeMovieList.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget getMovieItem(FreeMovie movie){
    return Container(
      padding: EdgeInsets.all(5.0),
      child: GestureDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(240),
              height: ScreenUtil().setHeight(260),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: getCachedImage(movie?.image??defaultCastImage),
              ),
            ),
            Container(
              width: ScreenUtil().setWidth(240),
              child: Text("${movie?.name}",overflow: TextOverflow.ellipsis,
                  maxLines: 1,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0,)),
            ),
          ],
        ),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => CustomFreeMovieDetailPage(movie)
          ));
        },
      ),
    );
  }

}
