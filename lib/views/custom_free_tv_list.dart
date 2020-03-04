import 'package:flutter/material.dart';
import '../models/free_movie.dart';
import '../util/image_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_free_tv_detail.dart';

//自定义的免费剧集列表页面
class CustomFreeTVListPage extends StatefulWidget {
  @override
  _CustomFreeTVListPageState createState() => _CustomFreeTVListPageState();
}

class _CustomFreeTVListPageState extends State<CustomFreeTVListPage> {

  List<FreeTV> freeTVList= List<FreeTV>();
  List<String> list;
  _buildFreeTVs(){
    list =[
      "https://mu.qqxy100.com/ts/2/71694094929231872/index.m3u8","https://mu.qqxy100.com/ts/2/71694098305646592/index.m3u8", "https://mu.qqxy100.com/ts/2/71899978523475968/index.m3u8",
      "https://mu.qqxy100.com/ts/2/72266141627580416/index.m3u8", "https://mu.qqxy100.com/ts/2/74374036276117505/index.m3u8","https://mu.qqxy100.com/ts/2/74890820905336832/index.m3u8",
    ];
    freeTVList.add(FreeTV("30395843","我的天才女友 第二季","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2583759735.webp",list));

    list =[
      "https://mu.qqxy100.com/ts/2/76537521416175616/index.m3u8",
    ];
    freeTVList.add(FreeTV("34429146","大逃脱 第三季","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2586164358.webp",list));
    list =[
      "https://mu.qqxy100.com/ts/2/69887583663947776/index.m3u8","https://mu.qqxy100.com/ts/2/70367810919858176/index.m3u8", "https://mu.qqxy100.com/ts/2/72997862304120832/index.m3u8",
      "https://mu.qqxy100.com/ts/2/73268696025399296/index.m3u8", "https://mu.qqxy100.com/ts/2/74812305572888576/index.m3u8","https://mu.qqxy100.com/ts/2/76520162437627904/index.m3u8",
    ];
    freeTVList.add(FreeTV("30347869","开玩笑 第二季","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2582367907.webp",list));
    list =[
      "https://mu.qqxy100.com/ts/2/37888390196101120/index.m3u8","https://mu.qqxy100.com/ts/2/37888392037400576/index.m3u8","https://mu.qqxy100.com/ts/2/37888393899671552/index.m3u8",
      "https://mu.qqxy100.com/ts/2/37888395740971008/index.m3u8","https://mu.qqxy100.com/ts/2/37888397917814784/index.m3u8","https://mu.qqxy100.com/ts/2/37888400019161088/index.m3u8",
      "https://mu.qqxy100.com/ts/2/37888401826906112/index.m3u8","https://mu.qqxy100.com/ts/2/37888403785646080/index.m3u8","https://mu.qqxy100.com/ts/2/37888405895380992/index.m3u8",
      "https://mu.qqxy100.com/ts/2/37888408458100736/index.m3u8","https://mu.qqxy100.com/ts/2/37888410773356544/index.m3u8","https://mu.qqxy100.com/ts/2/37888413159915520/index.m3u8",
      "https://mu.qqxy100.com/ts/2/37888415286427648/index.m3u8","https://mu.qqxy100.com/ts/2/37888417719123968/index.m3u8","https://mu.qqxy100.com/ts/2/37888419782721536/index.m3u8",
      "https://mu.qqxy100.com/ts/2/37888422160891904/index.m3u8","https://mu.qqxy100.com/ts/2/37888424656502784/index.m3u8","https://mu.qqxy100.com/ts/2/37888427395383296/index.m3u8",
      "https://mu.qqxy100.com/ts/2/37888429698056192/index.m3u8","https://mu.qqxy100.com/ts/2/37888431900065792/index.m3u8"
    ];
    freeTVList.add(FreeTV("26302614","请回答1988","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2272563445.webp",list));

    list =[
      "https://mu.qqxy100.com/ts/2/69225962910253056/index.m3u8","https://mu.qqxy100.com/ts/2/71534916248010752/index.m3u8", "https://mu.qqxy100.com/ts/2/74054208650739712/index.m3u8",
      "https://mu.qqxy100.com/ts/2/76604424130134016/index.m3u8"
    ];
    freeTVList.add(FreeTV("26854276","国土安全 第八季","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2576258389.webp",list));
    list =[
      "https://mu.qqxy100.com/ts/2/56014082578317312/index.m3u8","https://mu.qqxy100.com/ts/2/56014085447221248/index.m3u8","https://mu.qqxy100.com/ts/2/58483153886511104/index.m3u8",
      "https://mu.qqxy100.com/ts/2/61022179059302402/index.m3u8","https://mu.qqxy100.com/ts/2/63556563964526592/index.m3u8","https://mu.qqxy100.com/ts/2/66098069548040192/index.m3u8",
      "https://mu.qqxy100.com/ts/2/68637645835599872/index.m3u8","https://mu.qqxy100.com/ts/2/71178081783513088/index.m3u8","https://mu.qqxy100.com/ts/2/73707648372965376/index.m3u8",
      "https://mu.qqxy100.com/ts/2/76242965449670656/index.m3u8",
    ];
    freeTVList.add(FreeTV("34456027","异度侵入","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2576381820.webp",list));

    list =[
      "https://mu.qqxy100.com/ts/2/35747341243777024/index.m3u8","https://mu.qqxy100.com/ts/2/38159264509853696/index.m3u8", "https://mu.qqxy100.com/ts/2/40918988938543104/index.m3u8",
      "https://mu.qqxy100.com/ts/2/43213757572186112/index.m3u8","https://mu.qqxy100.com/ts/2/45823193608355840/index.m3u8","https://mu.qqxy100.com/ts/2/51165373625532416/index.m3u8",
      "https://mu.qqxy100.com/ts/2/51165377488486400/index.m3u8","https://mu.qqxy100.com/ts/2/53698485173616640/index.m3u8","https://mu.qqxy100.com/ts/2/56234104252792832/index.m3u8",
      "https://mu.qqxy100.com/ts/2/58762267059027968/index.m3u8","https://mu.qqxy100.com/ts/2/61306057829384192/index.m3u8"
    ];
    freeTVList.add(FreeTV("30450209","无耻之徒(美版) 第十季","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2571274882.webp",list));

    list =[
      "https://mu.qqxy100.com/ts/2/68102833488003072/index.m3u8","https://mu.qqxy100.com/ts/2/68191735020257280/index.m3u8","https://mu.qqxy100.com/ts/2/70367821762134016/index.m3u8",
      "https://mu.qqxy100.com/ts/2/72920802319663104/index.m3u8"
    ];
    freeTVList.add(FreeTV("30475705","神烦警探 第七季","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2583239107.webp",list));

    list =[
      "https://mu.qqxy100.com/ts/2/66616851563544576/index.m3u8","https://mu.qqxy100.com/ts/2/69078163623247872/index.m3u8","https://mu.qqxy100.com/ts/2/71615862661971968/index.m3u8",
    ];
    freeTVList.add(FreeTV("30142227","9号秘事 第五季","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2584555460.webp",list));

    list =[
      "https://mu.qqxy100.com/ts/2/56013821692608512/index.m3u8","https://mu.qqxy100.com/ts/2/58561665473445888/index.m3u8","https://mu.qqxy100.com/ts/2/61036263599243264/index.m3u8",
      "https://mu.qqxy100.com/ts/2/63566023223148544/index.m3u8","https://mu.qqxy100.com/ts/2/66140228724719616/index.m3u8","https://mu.qqxy100.com/ts/2/68637615372369920/index.m3u8",
      "https://mu.qqxy100.com/ts/2/71171588086562816/index.m3u8","https://mu.qqxy100.com/ts/2/73723741321822208/index.m3u8","https://mu.qqxy100.com/ts/2/76247016237170688/index.m3u8",
    ];
    freeTVList.add(FreeTV("33438250","别对映像研出手！","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2575204199.webp",list));

    list =[
      "https://mu.qqxy100.com/ts/2/59123617580974080/index.m3u8","https://mu.qqxy100.com/ts/2/61342283026399232/index.m3u8","https://mu.qqxy100.com/ts/2/64220152253644800/index.m3u8",
      "https://mu.qqxy100.com/ts/2/66009391437971456/index.m3u8","https://mu.qqxy100.com/ts/2/68541067137384448/index.m3u8","https://mu.qqxy100.com/ts/2/71101119895437312/index.m3u8",
      "https://mu.qqxy100.com/ts/2/73677529168216064/index.m3u8","https://mu.qqxy100.com/ts/2/76152691797000192/index.m3u8"
    ];
    freeTVList.add(FreeTV("30377019","异兽魔都","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2571185490.webp",list));

    list =[
      "https://mu.qqxy100.com/ts/2/58848772460904448/index.m3u8","https://mu.qqxy100.com/ts/2/58848776751677440/index.m3u8","https://mu.qqxy100.com/ts/2/61377446611517441/index.m3u8",
      "https://mu.qqxy100.com/ts/2/63920207235645440/index.m3u8","https://mu.qqxy100.com/ts/2/66383814171033600/index.m3u8","https://mu.qqxy100.com/ts/2/68997456574021632/index.m3u8",
      "https://mu.qqxy100.com/ts/2/71838180294262784/index.m3u8","https://mu.qqxy100.com/ts/2/74051927914053632/index.m3u8","https://mu.qqxy100.com/ts/2/76602415956099072/index.m3u8"
    ];
    freeTVList.add(FreeTV("30246686","局外人","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2576096389.webp",list));

    /** ==============================================以下为完结片，以上还要更新================================================== **/

    list =[
      "https://mu.qqxy100.com/ts/2/31903647860387840/index.m3u8","https://mu.qqxy100.com/ts/2/31903647864582144/index.m3u8", "https://mu.qqxy100.com/ts/2/31903647868776448/index.m3u8",
      "https://mu.qqxy100.com/ts/2/31903647872970752/index.m3u8","https://mu.qqxy100.com/ts/2/31903647877165056/index.m3u8","https://mu.qqxy100.com/ts/2/31903647881359360/index.m3u8",
      "https://mu.qqxy100.com/ts/2/31903647885553664/index.m3u8","https://mu.qqxy100.com/ts/2/31903647889747968/index.m3u8"
    ];
    freeTVList.add(FreeTV("3703650","黑袍纠察队 第一季","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2558948000.webp",list));
    list =[
      "https://mu.qqxy100.com/ts/2/31231855755788288/index.m3u8","https://mu.qqxy100.com/ts/2/33432668221734912/index.m3u8", "https://mu.qqxy100.com/ts/2/36307309814611968/index.m3u8",
      "https://mu.qqxy100.com/ts/2/38550982027640832/index.m3u8","https://mu.qqxy100.com/ts/2/41090055942438912/index.m3u8","https://mu.qqxy100.com/ts/2/43912936254603264/index.m3u8",
      "https://mu.qqxy100.com/ts/2/46460425738387456/index.m3u8"
    ];
    freeTVList.add(FreeTV("30194648","硅谷 第六季","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2571694925.webp",list));

    list =[
      "https://mu.qqxy100.com/ts/2/43028308601864192/index.m3u8","https://mu.qqxy100.com/ts/2/48316839540817920/index.m3u8","https://mu.qqxy100.com/ts/2/48316841986097152/index.m3u8",
      "https://mu.qqxy100.com/ts/2/53748796659597312/index.m3u8","https://mu.qqxy100.com/ts/2/55648535722328064/index.m3u8","https://mu.qqxy100.com/ts/2/55648538721255424/index.m3u8",
      "https://mu.qqxy100.com/ts/2/58202264602411008/index.m3u8","https://mu.qqxy100.com/ts/2/60779529697755136/index.m3u8","https://mu.qqxy100.com/ts/2/63516886435889152/index.m3u8",
      "https://mu.qqxy100.com/ts/2/65675333805801472/index.m3u8","https://mu.qqxy100.com/ts/2/68250119727742976/index.m3u8","https://mu.qqxy100.com/ts/2/71161535929516032/index.m3u8",
      "https://mu.qqxy100.com/ts/2/73323272090943488/index.m3u8"
    ];
    freeTVList.add(FreeTV("27205208","哈莉·奎茵 第一季","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2575491932.webp",list));

    list =[
      "https://mu.qqxy100.com/ts/2/36908275920273408/index.m3u8","https://mu.qqxy100.com/ts/2/37497544330182656/index.m3u8", "https://mu.qqxy100.com/ts/2/40019797802483712/index.m3u8",
      "https://mu.qqxy100.com/ts/2/42556203556929536/index.m3u8","https://mu.qqxy100.com/ts/2/45026859468980224/index.m3u8","https://mu.qqxy100.com/ts/2/47702510420361216/index.m3u8",
      "https://mu.qqxy100.com/ts/2/49700776741699584/index.m3u8"
    ];
    freeTVList.add(FreeTV("30344167","曼达洛人 第一季","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2566627804.webp",list));

    list =[
      "https://mu.qqxy100.com/ts/2/34161338905264128/index.m3u8","https://mu.qqxy100.com/ts/2/34161341430235136/index.m3u8", "https://mu.qqxy100.com/ts/2/34846565298339840/index.m3u8",
      "https://mu.qqxy100.com/ts/2/35304355791896576/index.m3u8","https://mu.qqxy100.com/ts/2/35304358560137216/index.m3u8","https://mu.qqxy100.com/ts/2/35581040042967040/index.m3u8",
    ];
    freeTVList.add(FreeTV("30399803","少年犯 第二季","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2573391635.webp",list));

    list =[
      "https://mu.qqxy100.com/ts/2/31980006796165120/index.m3u8","https://mu.qqxy100.com/ts/2/31980007387561984/index.m3u8","https://mu.qqxy100.com/ts/2/31980008012513280/index.m3u8",
      "https://mu.qqxy100.com/ts/2/31980008708767744/index.m3u8","https://mu.qqxy100.com/ts/2/31980009325330432/index.m3u8","https://mu.qqxy100.com/ts/2/31980009979641856/index.m3u8",
      "https://mu.qqxy100.com/ts/2/31985369180274688/index.m3u8","https://mu.qqxy100.com/ts/2/31985369792643072/index.m3u8","https://mu.qqxy100.com/ts/2/31985370396622848/index.m3u8",
      "https://mu.qqxy100.com/ts/2/31985371008991232/index.m3u8","https://mu.qqxy100.com/ts/2/31985371604582400/index.m3u8","https://mu.qqxy100.com/ts/2/31985372250505216/index.m3u8"
    ];
    freeTVList.add(FreeTV("33218376","高分少女 第二季","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2568131686.webp",list));

    list =[
      "https://mu.qqxy100.com/ts/2/29157995153719296/index.m3u8","https://mu.qqxy100.com/ts/2/29157995719950336/index.m3u8","https://mu.qqxy100.com/ts/2/31595810751774720/index.m3u8",
      "https://mu.qqxy100.com/ts/2/34157747570212864/index.m3u8","https://mu.qqxy100.com/ts/2/36659196191571968/index.m3u8","https://mu.qqxy100.com/ts/2/44259414772809728/index.m3u8",
      "https://mu.qqxy100.com/ts/2/46799962234683392/index.m3u8","https://mu.qqxy100.com/ts/2/49330315499405312/index.m3u8","https://mu.qqxy100.com/ts/2/51922335967477760/index.m3u8",
      "https://mu.qqxy100.com/ts/2/54402378366976000/index.m3u8"
    ];
    freeTVList.add(FreeTV("30371751","伍六七之最强发型师","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2571634144.webp",list));

    list =[
      "https://mu.qqxy100.com/ts/2/31903742676824064/index.m3u8","https://mu.qqxy100.com/ts/2/31903742693601280/index.m3u8", "https://mu.qqxy100.com/ts/2/31903742710378496/index.m3u8",
      "https://mu.qqxy100.com/ts/2/31903742727155712/index.m3u8", "https://mu.qqxy100.com/ts/2/31903742743932928/index.m3u8","https://mu.qqxy100.com/ts/2/31903742764904448/index.m3u8",
      "https://mu.qqxy100.com/ts/2/31903742781681664/index.m3u8","https://mu.qqxy100.com/ts/2/31903742798458880/index.m3u8",
    ];
    freeTVList.add(FreeTV("28427782","我的天才女友 第一季","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2538458633.webp",list));
    list =[
      "https://youku.haokzy-tudou.com/ppvod/Uur8eyte.m3u8","https://youku.haokzy-tudou.com/ppvod/M9Gp2DHb.m3u8", "https://youku.haokzy-tudou.com/ppvod/wCdr8Y6J.m3u8",
      "https://youku.haokzy-tudou.com/ppvod/YhUpVwa3.m3u8","https://youku.haokzy-tudou.com/ppvod/JUCcgJKL.m3u8","https://youku.haokzy-tudou.com/ppvod/UoKlNy6P.m3u8",
      "https://youku.haokzy-tudou.com/ppvod/bxmDxT74.m3u8","https://youku.haokzy-tudou.com/ppvod/c8oJl5D4.m3u8", "https://youku.haokzy-tudou.com/ppvod/EQjH90Uh.m3u8",
      "https://youku.haokzy-tudou.com/ppvod/jOisF1V9.m3u8","https://youku.haokzy-tudou.com/ppvod/g3UTeYSf.m3u8", "https://youku.haokzy-tudou.com/ppvod/mitTCtYG.m3u8",
      "https://youku.haokzy-tudou.com/ppvod/Q3yv3nUe.m3u8","https://youku.haokzy-tudou.com/ppvod/Gk6ehHB6.m3u8", "https://youku.haokzy-tudou.com/ppvod/V6cWVW4o.m3u8",
      "https://youku.haokzy-tudou.com/ppvod/bBaE37jq.m3u8", "https://youku.haokzy-tudou.com/ppvod/DOyvRBgb.m3u8","https://youku.haokzy-tudou.com/ppvod/iTJUbYef.m3u8"
    ];
    freeTVList.add(FreeTV("30424374","爱，死亡和机器人 第一季","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2548248276.webp",list));
    list =[
      "https://mu.qqxy100.com/ts/2/33784561431216128/index.m3u8","https://mu.qqxy100.com/ts/2/33784563922632704/index.m3u8", "https://mu.qqxy100.com/ts/2/33784566170779648/index.m3u8",
      "https://mu.qqxy100.com/ts/2/33784568523784192/index.m3u8","https://mu.qqxy100.com/ts/2/33784570876788736/index.m3u8","https://mu.qqxy100.com/ts/2/33784573196238848/index.m3u8",
      "https://mu.qqxy100.com/ts/2/33784575205310464/index.m3u8","https://mu.qqxy100.com/ts/2/33784577461846016/index.m3u8"
    ];
    freeTVList.add(FreeTV("27625457","去他*的世界 第二季","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2570938064.webp",list));
    list =[
      "https://mu.qqxy100.com/ts/2/36010799591849984/index.m3u8","https://mu.qqxy100.com/ts/2/36010799596044288/index.m3u8", "https://mu.qqxy100.com/ts/2/36003747452682240/index.m3u8",
      "https://mu.qqxy100.com/ts/2/38699421751312384/index.m3u8","https://mu.qqxy100.com/ts/2/41351494028492800/index.m3u8","https://mu.qqxy100.com/ts/2/43808605928947712/index.m3u8",
      "https://mu.qqxy100.com/ts/2/46376588815630336/index.m3u8"
    ];
    freeTVList.add(FreeTV("33387353","七个世界，一个星球","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2572676219.webp",list));

    list =[
      "https://mu.qqxy100.com/ts/2/43415046641942528/index.m3u8","https://mu.qqxy100.com/ts/2/43415050618142720/index.m3u8", "https://mu.qqxy100.com/ts/2/43415055261237248/index.m3u8",
      "https://mu.qqxy100.com/ts/2/43415059157745664/index.m3u8","https://mu.qqxy100.com/ts/2/43415063192666112/index.m3u8","https://mu.qqxy100.com/ts/2/43415067181449216/index.m3u8",
      "https://mu.qqxy100.com/ts/2/43415069165355008/index.m3u8","https://mu.qqxy100.com/ts/2/43415071149260800/index.m3u8","https://mu.qqxy100.com/ts/2/43415073124777984/index.m3u8",
      "https://mu.qqxy100.com/ts/2/43415075960127488/index.m3u8","https://mu.qqxy100.com/ts/2/43415078472515584/index.m3u8","https://mu.qqxy100.com/ts/2/43415081152675840/index.m3u8",
    ];
    freeTVList.add(FreeTV("26339248","一拳超人","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2234184583.webp",list));

    list =[
      "https://mu.qqxy100.com/ts/2/50039615708463104/index.m3u8","https://mu.qqxy100.com/ts/2/50039615716851712/index.m3u8","https://mu.qqxy100.com/ts/2/50039615716851713/index.m3u8",
      "https://mu.qqxy100.com/ts/2/50039615721046016/index.m3u8","https://mu.qqxy100.com/ts/2/50039615725240320/index.m3u8","https://mu.qqxy100.com/ts/2/50039615729434624/index.m3u8",
      "https://mu.qqxy100.com/ts/2/50039615733628928/index.m3u8","https://mu.qqxy100.com/ts/2/50039615737823232/index.m3u8"
    ];
    freeTVList.add(FreeTV("26637615","猎魔人 第一季","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2574764569.webp",list));
    list =[
      "https://mu.qqxy100.com/ts/2/31903724859420672/index.m3u8","https://mu.qqxy100.com/ts/2/31903724876197888/index.m3u8","https://mu.qqxy100.com/ts/2/31903724888780800/index.m3u8",
      "https://mu.qqxy100.com/ts/2/31903724905558016/index.m3u8","https://mu.qqxy100.com/ts/2/31903724918140928/index.m3u8","https://mu.qqxy100.com/ts/2/31903724934918144/index.m3u8",
      "https://mu.qqxy100.com/ts/2/31903724947501056/index.m3u8","https://mu.qqxy100.com/ts/2/31903724964278272/index.m3u8"
    ];
    freeTVList.add(FreeTV("27594217","性爱自修室 第一季","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2569324883.webp",list));

    list =[
      "https://mu.qqxy100.com/ts/2/56991655080755200/index.m3u8","https://mu.qqxy100.com/ts/2/56991658121625600/index.m3u8","https://mu.qqxy100.com/ts/2/56991661607092224/index.m3u8",
      "https://mu.qqxy100.com/ts/2/56991665352605696/index.m3u8","https://mu.qqxy100.com/ts/2/56991669228142592/index.m3u8","https://mu.qqxy100.com/ts/2/56991672709414912/index.m3u8",
      "https://mu.qqxy100.com/ts/2/56991675481849856/index.m3u8","https://mu.qqxy100.com/ts/2/56991678329782272/index.m3u8","https://mu.qqxy100.com/ts/2/56991681228046336/index.m3u8",
      "https://mu.qqxy100.com/ts/2/56991685346852864/index.m3u8",
    ];
    freeTVList.add(FreeTV("24697949","半泽直树","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2411814194.webp",list));

    list =[
      "https://mu.qqxy100.com/ts/2/31980006796165120/index.m3u8","https://mu.qqxy100.com/ts/2/31980007387561984/index.m3u8","https://mu.qqxy100.com/ts/2/31980008012513280/index.m3u8",
      "https://mu.qqxy100.com/ts/2/31980008708767744/index.m3u8","https://mu.qqxy100.com/ts/2/31980009325330432/index.m3u8","https://mu.qqxy100.com/ts/2/31980009979641856/index.m3u8",
      "https://mu.qqxy100.com/ts/2/31985369180274688/index.m3u8","https://mu.qqxy100.com/ts/2/31985369792643072/index.m3u8","https://mu.qqxy100.com/ts/2/31985370396622848/index.m3u8",
      "https://mu.qqxy100.com/ts/2/31985371008991232/index.m3u8","https://mu.qqxy100.com/ts/2/31985371604582400/index.m3u8","https://mu.qqxy100.com/ts/2/31985372250505216/index.m3u8"
    ];
    freeTVList.add(FreeTV("34800559","拳愿阿修罗 Part 2","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2566436229.webp",list));


    list =[
      "https://youku.haokzy-tudou.com/ppvod/eKhLPdf6.m3u8","https://youku.haokzy-tudou.com/ppvod/yMl94Njn.m3u8","https://youku.haokzy-tudou.com/ppvod/KMgM0mpE.m3u8",
      "https://youku.haokzy-tudou.com/ppvod/OzheVlIB.m3u8","https://youku.haokzy-tudou.com/ppvod/LWTUfJpH.m3u8","https://youku.haokzy-tudou.com/ppvod/lOk08WKx.m3u8",
      "https://youku.haokzy-tudou.com/ppvod/1hY4gp8j.m3u8","https://youku.haokzy-tudou.com/ppvod/IgnG0nMM.m3u8","https://youku.haokzy-tudou.com/ppvod/v0idIPjy.m3u8",
      "https://youku.haokzy-tudou.com/ppvod/cSQJomk2.m3u8"
    ];
    freeTVList.add(FreeTV("30401122","致命女人 第一季","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2566967861.webp",list));

    list =[
      "https://mu.qqxy100.com/ts/2/44913741141114880/index.m3u8","https://mu.qqxy100.com/ts/2/44913741145309184/index.m3u8","https://mu.qqxy100.com/ts/2/44913741149503488/index.m3u8",
      "https://mu.qqxy100.com/ts/2/44913741153697792/index.m3u8","https://mu.qqxy100.com/ts/2/44913741157892096/index.m3u8","https://mu.qqxy100.com/ts/2/44913741157892097/index.m3u8",
      "https://mu.qqxy100.com/ts/2/44913741162086400/index.m3u8","https://mu.qqxy100.com/ts/2/44913741166280704/index.m3u8"
    ];
    freeTVList.add(FreeTV("30227139","了不起的麦瑟尔夫人 第三季","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2566289967.webp",list));
    list =[
      "https://mu.qqxy100.com/ts/2/38346694881968128/index.m3u8","https://mu.qqxy100.com/ts/2/38346697369190400/index.m3u8","https://mu.qqxy100.com/ts/2/38346699667668992/index.m3u8",
      "https://mu.qqxy100.com/ts/2/38346701961953280/index.m3u8","https://mu.qqxy100.com/ts/2/38346703799058432/index.m3u8","https://mu.qqxy100.com/ts/2/38346705590026240/index.m3u8",
      "https://mu.qqxy100.com/ts/2/38346707481657344/index.m3u8","https://mu.qqxy100.com/ts/2/38346709566226432/index.m3u8","https://mu.qqxy100.com/ts/2/38346711634018304/index.m3u8",
      "https://mu.qqxy100.com/ts/2/38346714863632384/index.m3u8"
    ];
    freeTVList.add(FreeTV("27182502","王冠 第三季","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2575305336.webp",list));

    list =[
      "https://mu.qqxy100.com/ts/2/31904689943605248/index.m3u8","https://mu.qqxy100.com/ts/2/31904690010714112/index.m3u8","https://mu.qqxy100.com/ts/2/31904690073628672/index.m3u8",
      "https://mu.qqxy100.com/ts/2/31904690136543232/index.m3u8","https://mu.qqxy100.com/ts/2/31904690199457792/index.m3u8","https://mu.qqxy100.com/ts/2/31904690262372352/index.m3u8",
      "https://mu.qqxy100.com/ts/2/31904690325286912/index.m3u8","https://mu.qqxy100.com/ts/2/31904690392395776/index.m3u8","https://mu.qqxy100.com/ts/2/31904690459504640/index.m3u8",
      "https://mu.qqxy100.com/ts/2/31904690526613504/index.m3u8","https://mu.qqxy100.com/ts/2/31904690593722368/index.m3u8","https://mu.qqxy100.com/ts/2/31904690656636928/index.m3u8",
      "https://mu.qqxy100.com/ts/2/31904690719551488/index.m3u8","https://mu.qqxy100.com/ts/2/31904690786660352/index.m3u8","https://mu.qqxy100.com/ts/2/31904690845380608/index.m3u8",
      "https://mu.qqxy100.com/ts/2/31904690904100864/index.m3u8"
    ];
    freeTVList.add(FreeTV("6952149","绝命毒师 第五季","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p1579021082.webp",list));

    list =[
      "https://mu.qqxy100.com/ts/2/27182000313991168/index.m3u8","https://mu.qqxy100.com/ts/2/27182000884416512/index.m3u8","https://mu.qqxy100.com/ts/2/27182001379344384/index.m3u8",
      "https://mu.qqxy100.com/ts/2/27182001895243776/index.m3u8","https://mu.qqxy100.com/ts/2/31947057681924098/index.m3u8","https://mu.qqxy100.com/ts/2/34535146753359872/index.m3u8",
      "https://v1.szjal.cn/ppvod/92FD235462B15B175420086B601FEF86.m3u8","https://mu.qqxy100.com/ts/2/44638318234697728/index.m3u8","https://mu.qqxy100.com/ts/2/47252801864073216/index.m3u8",
      "https://mu.qqxy100.com/ts/2/57306952807481345/index.m3u8","https://mu.qqxy100.com/ts/2/59882318361264128/index.m3u8","https://mu.qqxy100.com/ts/2/62436465082105856/index.m3u8",
      "https://mu.qqxy100.com/ts/2/70004609480916992/index.m3u8","https://mu.qqxy100.com/ts/2/72545721638715392/index.m3u8"
    ];
    freeTVList.add(FreeTV("30454227","摩登家庭 第十一季","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2584872902.webp",list));


    list =[
      "https://mu.qqxy100.com/ts/2/31905441801957376/index.m3u8","https://mu.qqxy100.com/ts/2/31905441894232064/index.m3u8","https://mu.qqxy100.com/ts/2/31905441986506752/index.m3u8",
      "https://mu.qqxy100.com/ts/2/31905442078781440/index.m3u8","https://mu.qqxy100.com/ts/2/31905442171056128/index.m3u8","https://mu.qqxy100.com/ts/2/31905442263330816/index.m3u8",
      "https://mu.qqxy100.com/ts/2/31905442351411200/index.m3u8","https://mu.qqxy100.com/ts/2/31905442443685888/index.m3u8","https://mu.qqxy100.com/ts/2/31905442527571968/index.m3u8",
      "https://mu.qqxy100.com/ts/2/31905442615652352/index.m3u8","https://mu.qqxy100.com/ts/2/31905442707927040/index.m3u8","https://mu.qqxy100.com/ts/2/31905442800201728/index.m3u8",
      "https://mu.qqxy100.com/ts/2/31905442892476416/index.m3u8","https://mu.qqxy100.com/ts/2/31905442980556800/index.m3u8","https://mu.qqxy100.com/ts/2/31905443072831488/index.m3u8",
      "https://mu.qqxy100.com/ts/2/31905443165106176/index.m3u8","https://mu.qqxy100.com/ts/2/31905443261575168/index.m3u8"
    ];
    freeTVList.add(FreeTV("3286552","老友记 第十季","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2187822907.webp",list));

  }

  @override
  void initState() {
    super.initState();
    _buildFreeTVs();
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
                return getTVItem(freeTVList[index]);
              },
              childCount: freeTVList.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget getTVItem(FreeTV tv){
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
                child: getCachedImage(tv?.image??defaultCastImage),
              ),
            ),
            Container(
              width: ScreenUtil().setWidth(240),
              child: Text("${tv?.name}",overflow: TextOverflow.ellipsis,
                  maxLines: 1,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0,)),
            ),
          ],
        ),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => CustomFreeTVDetailPage(tv)
          ));
        },
      ),
    );
  }

}
