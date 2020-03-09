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
      "https://www.chifenghualvlvxingshe.com/20200212/CuomiUR7/index.m3u8","https://www.chifenghualvlvxingshe.com/20200213/861BKSJD/index.m3u8", "https://www.chifenghualvlvxingshe.com/20200219/Lf9TZSIm/index.m3u8",
      "https://www.chifenghualvlvxingshe.com/20200220/5HjRA7eh/index.m3u8","https://www.chifenghualvlvxingshe.com/20200226/DjJbxWsR/index.m3u8","https://www.chifenghualvlvxingshe.com/20200227/I4qEshD2/index.m3u8",
      "https://www.chifenghualvlvxingshe.com/20200304/RLvSmscV/index.m3u8","https://www.chifenghualvlvxingshe.com/20200304/H7uFfpDa/index.m3u8"
    ];
    freeTVList.add(FreeTV("30395843","我的天才女友 第二季","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2583759735.webp",list));

    list =[
      "https://www.gentaji.com/20200303/ajBep15v/index.m3u8",
    ];
    freeTVList.add(FreeTV("34429146","大逃脱 第三季","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2586164358.webp",list));
    list =[
      "https://www.chifenghualvlvxingshe.com/20200210/490loAre/index.m3u8","https://www.chifenghualvlvxingshe.com/20200210/BWi2jhZ5/index.m3u8","https://www.chifenghualvlvxingshe.com/20200217/BpuIPXOg/index.m3u8",
      "https://www.chifenghualvlvxingshe.com/20200217/vTZCBPoi/index.m3u8","https://www.chifenghualvlvxingshe.com/20200224/qhdYfjbu/index.m3u8","https://www.chifenghualvlvxingshe.com/20200224/ZTLMdxFD/index.m3u8",
      "https://www.chifenghualvlvxingshe.com/20200301/bNDHfUZB/index.m3u8","https://www.chifenghualvlvxingshe.com/20200302/1ConyMZs/index.m3u8","https://www.chifenghualvlvxingshe.com/20200308/f7hG1ZL3/index.m3u8",
      "https://www.chifenghualvlvxingshe.com/20200308/UxdfGw25/index.m3u8"
    ];
    freeTVList.add(FreeTV("30347869","开玩笑 第二季","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2582367907.webp",list));

    list =[
      "https://www.chifenghualvlvxingshe.com/20200210/Y2naSi79/index.m3u8","https://www.chifenghualvlvxingshe.com/20200217/0miI1UW6/index.m3u8", "https://www.chifenghualvlvxingshe.com/20200224/1vFHEG4M/index.m3u8",
      "https://www.chifenghualvlvxingshe.com/20200302/JkmaF7of/index.m3u8","https://www.chifenghualvlvxingshe.com/20200308/KZErR9w4/index.m3u8"
    ];
    freeTVList.add(FreeTV("26854276","国土安全 第八季","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2576258389.webp",list));
    list =[
      "https://www.mzy2000.com/20200106/5bwtixQP/index.m3u8","https://www.mzy2000.com/20200106/vVy24xaO/index.m3u8","https://www.nmgxwhz.com:65/20200113/RID6ncjv/index.m3u8",
      "https://www.gentaji.com/20200120/YAk6ynPg/index.m3u8","https://www.gentaji.com/20200127/27ymssN3/index.m3u8","https://www.gentaji.com/20200203/w621G7mU/index.m3u8",
      "https://www.gentaji.com/20200210/YugNGV6P/index.m3u8","https://www.gentaji.com/20200217/AOOu013g/index.m3u8","https://www.gentaji.com/20200224/Hfuhgmwq/index.m3u8",
      "https://www.gentaji.com/20200302/eyd5OXJV/index.m3u8","https://www.gentaji.com/20200309/MOb9mjhB/index.m3u8"
    ];
    freeTVList.add(FreeTV("34456027","异度侵入","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2576381820.webp",list));

    list =[
      "https://tv.youkutv.cc/2019/11/10/AaHBX7ZEQeaXLZeA/playlist.m3u8","https://tv.youkutv.cc/2019/11/17/zyzLK7M2sCbqa8L1/playlist.m3u8","https://tv.youkutv.cc/2019/11/24/e7cQSN9mL1MUFRHz/playlist.m3u8",
      "https://tv.youkutv.cc/2019/12/01/ap4pdDN4o8P1xlbl/playlist.m3u8","https://tv.youkutv.cc/2019/12/08/uMRbrG59RTQtTTcv/playlist.m3u8","https://tv.youkutv.cc/2019/12/15/sCuqpRG5RfuDsCw5/playlist.m3u8",
      "https://tv.youkutv.cc/2019/12/23/GqbxZHxHH52IqIcZ/playlist.m3u8","https://tv.youkutv.cc/2019/12/29/302jc7LMZtzgXaiD/playlist.m3u8","https://tv.youkutv.cc/2020/01/06/GBPXDJh6v384ZKvf/playlist.m3u8",
      "https://tv.youkutv.cc/2020/01/12/EBWG6vgGFFY093t2/playlist.m3u8","https://tv.youkutv.cc/2020/01/20/N31mvUQuQOn1KIET/playlist.m3u8","https://tv.youkutv.cc/2020/01/26/Y5Bu5c2HEGZt4BIB/playlist.m3u8"
    ];
    freeTVList.add(FreeTV("30450209","无耻之徒(美版) 第十季","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2571274882.webp",list));

    list =[
      "https://tv1.youkutv.cc/2020/02/08/BsFAJosaLnJOuxpp/playlist.m3u8","https://tv1.youkutv.cc/2020/02/09/qphCBuHeoOt5hU6x/playlist.m3u8","https://tv1.youkutv.cc/2020/02/15/plR3wT9licpe6Xth/playlist.m3u8",
      "https://tv1.youkutv.cc/2020/02/22/5pXjWTYzyaja155I/playlist.m3u8","https://tv1.youkutv.cc/2020/02/29/mWEq9fFf5s9teLih/playlist.m3u8","https://tv1.youkutv.cc/2020/03/07/O2PAxRtPUoCCdb3e/playlist.m3u8"
    ];
    freeTVList.add(FreeTV("30475705","神烦警探 第七季","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2584555460.webp",list));

    list =[
      "https://tv1.youkutv.cc/2020/02/05/ESD82wrduqScVjC4/playlist.m3u8","https://tv1.youkutv.cc/2020/02/12/I5GEXcJzhJnhQYmT/playlist.m3u8","https://tv1.youkutv.cc/2020/02/18/W9z7G2KNlsUBP6g2/playlist.m3u8",
      "https://tv1.youkutv.cc/2020/02/26/oBUXSeAD9tCiQMjm/playlist.m3u8","https://tv1.youkutv.cc/2020/03/04/oHKYafh4Dxc5dYHB/playlist.m3u8","https://v2.szjal.cn/ppvod/2D454C2ECE034CF5ABC3C920DC92F99E.m3u8",
    ];
    freeTVList.add(FreeTV("30142227","9号秘事 第五季","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2583239107.webp",list));

    list =[
      "https://www.mzy2000.com/20200106/ei2ZSX26/index.m3u8","https://www.nmgxwhz.com:65/20200114/NydcEyJe/index.m3u8","https://www.gentaji.com/20200120/QCaATybS/index.m3u8",
      "https://www.gentaji.com/20200127/tnwjIgpR/index.m3u8","https://www.gentaji.com/20200203/F9iofCER/index.m3u8","https://www.gentaji.com/20200210/PtDFbQYS/index.m3u8",
      "https://www.gentaji.com/20200217/4ibesqYb/index.m3u8","https://www.gentaji.com/20200224/bksS7Y2B/index.m3u8","https://www.gentaji.com/20200302/hEYwLKcZ/index.m3u8",
      "https://www.gentaji.com/20200309/Mp4JDR8t/index.m3u8"
    ];
    freeTVList.add(FreeTV("33438250","别对映像研出手！","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2575204199.webp",list));

    list =[
      "https://www.nmgxwhz.com:65/20200114/yvWoDQYm/index.m3u8","https://www.gentaji.com/20200120/2KMSloMg/index.m3u8","https://www.gentaji.com/20200127/TmTSXxrg/index.m3u8",
      "https://www.gentaji.com/20200202/m6GwJgvw/index.m3u8","https://www.gentaji.com/20200209/0qUQwCLo/index.m3u8","https://www.gentaji.com/20200216/kWFjLOlH/index.m3u8",
      "https://www.gentaji.com/20200223/YOXigBaR/index.m3u8","https://www.gentaji.com/20200302/NGql6DmL/index.m3u8","https://www.gentaji.com/20200308/NcVEmQ7l/index.m3u8"
    ];
    freeTVList.add(FreeTV("30377019","异兽魔都","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2571185490.webp",list));

    list =[
      "https://tv.youkutv.cc/2020/01/13/1VC6CcH9Vwd11aBB/playlist.m3u8","https://tv.youkutv.cc/2020/01/13/tE2eLI3DdTRjYGOO/playlist.m3u8","https://tv.youkutv.cc/2020/01/20/SPvPexjHxAXXAu6R/playlist.m3u8",
      "https://tv.youkutv.cc/2020/01/27/jvy9YejAgKFPiV6U/playlist.m3u8","https://tv1.youkutv.cc/2020/02/02/ymgdRrNYyO3VmYbn/playlist.m3u8","https://tv1.youkutv.cc/2020/02/11/gPEXkWtR77tKajt3/playlist.m3u8",
      "https://tv1.youkutv.cc/2020/02/18/0bLnVfLPB00fe4Ho/playlist.m3u8","https://tv1.youkutv.cc/2020/02/25/bfw2lYQCjmGJjFwj/playlist.m3u8","https://tv1.youkutv.cc/2020/03/02/xENjCGGEJnYhDrwT/playlist.m3u8"
    ];
    freeTVList.add(FreeTV("30246686","局外人","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2576096389.webp",list));

    list =[
      "https://v2.szjal.cn/ppvod/B01E2092B5023EE6636A499C7CEF8F56.m3u8","https://v2.szjal.cn/ppvod/ECE4A8A2EAB975262922F6955B6EE351.m3u8","https://v2.szjal.cn/ppvod/258DEF3A3E1E2D9E1BEDF1394EC854CC.m3u8",
      "https://v2.szjal.cn/ppvod/799E99F384AF65FB09C68F4471C806CA.m3u8","https://v2.szjal.cn/ppvod/6F7F1CD134FCCBF62DA5A37EC8F39F51.m3u8",
    ];
    freeTVList.add(FreeTV("27166039","瑞克和莫蒂 第四季","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2573033857.webp",list));

    /** ==============================================以下为完结片，以上还要更新================================================== **/

    list =[
      "https://tv1.youkutv.cc/2020/02/14/SReoGkpTe3Vhmdkl/playlist.m3u8","https://tv1.youkutv.cc/2020/02/14/Nh34Cn4doCjL3vzB/playlist.m3u8","https://tv1.youkutv.cc/2020/02/14/l8kLQltcdMhCpIs3/playlist.m3u8",
      "https://tv1.youkutv.cc/2020/02/14/FYDywFANjbhnZwIi/playlist.m3u8","https://tv1.youkutv.cc/2020/02/14/fYy6nXEbzWJDowsh/playlist.m3u8","https://tv1.youkutv.cc/2020/02/14/PhJRMWpVincfsSzZ/playlist.m3u8",
      "https://tv1.youkutv.cc/2020/02/14/MyRILQ700Dj2keqz/playlist.m3u8","https://tv1.youkutv.cc/2020/02/14/lQKY1CxQJcEni4Rz/playlist.m3u8","https://tv1.youkutv.cc/2020/02/14/3e6YYyJOurstdNGk/playlist.m3u8",
      "https://tv1.youkutv.cc/2020/02/14/mYe0ftOClz7WymS1/playlist.m3u8"
    ];
    freeTVList.add(FreeTV("30395836","毒枭：墨西哥 第二季","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2582588237.webp",list));

    list =[
      "https://www.chifenghualvlvxingshe.com/20200305/Wf1xslvH/index.m3u8","https://www.chifenghualvlvxingshe.com/20200305/3Evumzwb/index.m3u8","https://www.chifenghualvlvxingshe.com/20200305/OJQW079A/index.m3u8",
      "https://www.chifenghualvlvxingshe.com/20200305/k3DygprV/index.m3u8","https://www.chifenghualvlvxingshe.com/20200305/XEgBbqeG/index.m3u8","https://www.chifenghualvlvxingshe.com/20200305/g3fs8qaG/index.m3u8",
      "https://www.chifenghualvlvxingshe.com/20200305/E3xQ8R9q/index.m3u8","https://www.chifenghualvlvxingshe.com/20200305/q65acQGd/index.m3u8","https://www.chifenghualvlvxingshe.com/20200305/oygvniIW/index.m3u8",
      "https://www.chifenghualvlvxingshe.com/20200305/yk4DGxdu/index.m3u8"
    ];
    freeTVList.add(FreeTV("30364831","恶魔城 第三季","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2584251274.webp",list));

//    list =[
//      "https://www.szhysws.com/20190403/MLrJ9QgB/index.m3u8","https://yingshi.1977zy-youku.com/20190725/FglaUEJK/index.m3u8","https://yingshi.1977zy-youku.com/20190725/f8tuCDuE/index.m3u8",
//      "https://www.szhysws.com/20190403/hbNR4U3X/index.m3u8","https://www.szhysws.com/20190403/XJkPOhy9/index.m3u8","https://www.szhysws.com/20190403/dGCoLcCh/index.m3u8",
//      "https://www.szhysws.com/20190403/gkDhjgW2/index.m3u8","https://www.szhysws.com/20190403/7KsjLF5i/index.m3u8","https://www.szhysws.com/20190403/6KHvRyuC/index.m3u8",
//      "https://mu.qqxy100.com/ts/2/37888408458100736/index.m3u8","https://mu.qqxy100.com/ts/2/37888410773356544/index.m3u8","https://mu.qqxy100.com/ts/2/37888413159915520/index.m3u8",
//      "https://mu.qqxy100.com/ts/2/37888415286427648/index.m3u8","https://mu.qqxy100.com/ts/2/37888417719123968/index.m3u8","https://mu.qqxy100.com/ts/2/37888419782721536/index.m3u8",
//      "https://mu.qqxy100.com/ts/2/37888422160891904/index.m3u8","https://mu.qqxy100.com/ts/2/37888424656502784/index.m3u8","https://mu.qqxy100.com/ts/2/37888427395383296/index.m3u8",
//      "https://mu.qqxy100.com/ts/2/37888429698056192/index.m3u8","https://mu.qqxy100.com/ts/2/37888431900065792/index.m3u8"
//    ];
//    freeTVList.add(FreeTV("26302614","请回答1988","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2272563445.webp",list));

    list =[
      "https://v1.szjal.cn/ppvod/1045BFA3E005907DCE98909E8D281D13.m3u8","https://v1.szjal.cn/ppvod/5407B88DA78D563A7F50AD051E63D16D.m3u8","https://v1.szjal.cn/ppvod/A887A2015E4336052DE6FBF0DACD40CA.m3u8",
      "https://v1.szjal.cn/ppvod/94FF503DB49A817ECC86CD6FF6743BAF.m3u8","https://v1.szjal.cn/ppvod/8842090FFE8EB85C96F9C86926E868D8.m3u8","https://v1.szjal.cn/ppvod/1C08100C30A515BAD86A012049ABF82C.m3u8",
      "https://v1.szjal.cn/ppvod/76D390AE94C26FE1101AA4F5F676F74F.m3u8","https://v1.szjal.cn/ppvod/F250F93F6D20D31C385CDCC11F47AD2C.m3u8","https://v2.szjal.cn/ppvod/EBD55022D028AEA80186C0DE5AD2BA39.m3u8",
      "https://v2.szjal.cn/ppvod/9CFCCA7D369FEB348F3EA4B761AFD231.m3u8","https://v2.szjal.cn/ppvod/CD328BE23CF475A34EC2E098F3B32FCC.m3u8","https://v2.szjal.cn/ppvod/9DA9DEBBA6FF320056475D73E0BEF55F.m3u8",
      "https://v2.szjal.cn/ppvod/1EF173D59BC4579F7F71467ADC90333E.m3u8","https://v2.szjal.cn/ppvod/911324BA3F919E66FE31F3579FA04C5B.m3u8","https://v2.szjal.cn/ppvod/8BCD0005DE603C4883A0352BC9842AF3.m3u8",
      "https://v2.szjal.cn/ppvod/A2A64C276FB8EBC48D22F886567F84FB.m3u8","https://v2.szjal.cn/ppvod/25B4DC0858D95C5D725D92E064FF466C.m3u8","https://v2.szjal.cn/ppvod/11EA3858733960AF82F964F557B5F6D3.m3u8",
    ];
    freeTVList.add(FreeTV("30454230","良医 第三季","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2569610369.webp",list));

    list =[
      "https://v2.szjal.cn/ppvod/265B037F2904D040AFB55FD90DC76A0F.m3u8","https://v2.szjal.cn/ppvod/170D4A83203F06028F2EDEFD03E96A96.m3u8","https://v2.szjal.cn/ppvod/2245BB32F380456F441BDA339F358607.m3u8",
      "https://v2.szjal.cn/ppvod/BDDEC10C1F00403D448F3E41318DF339.m3u8","https://v2.szjal.cn/ppvod/53916BA953D80201F9521A09A31BEEA5.m3u8","https://v2.szjal.cn/ppvod/ED473E3B08F4542E32C66AF4F5FBDDA6.m3u8",
      "https://v2.szjal.cn/ppvod/7C682BF752474F9E583BE08171E4FA27.m3u8","https://v2.szjal.cn/ppvod/75FBD75008C6C2468D279C2CC45CA0A1.m3u8","https://v2.szjal.cn/ppvod/CB8D2C3A0B828595C83609740048E0F2.m3u8",
      "https://v2.szjal.cn/ppvod/2A26023841855E07C293F85E62621A1E.m3u8","https://v2.szjal.cn/ppvod/489D416E6C334A0E56C711225706AF46.m3u8","https://v2.szjal.cn/ppvod/18F6B0BA70859E47EFF360D8C47EF589.m3u8",
    ];
    freeTVList.add(FreeTV("34660475","房间露营△","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2574296707.webp",list));

    list =[
      "https://youku.letv-cdn.com/2019/07/25/ZJNbU9pVxAtR1nLc/playlist.m3u8","https://youku.letv-cdn.com/2019/07/25/KV4Q3F1P7Jc1qEWB/playlist.m3u8","https://youku.letv-cdn.com/2019/07/25/0fDM5xWt9W2Ca5wD/playlist.m3u8",
      "https://youku.letv-cdn.com/2019/07/25/kmK7G6fzHFMY0RkD/playlist.m3u8","https://youku.letv-cdn.com/2019/07/25/6zBn7la7sZQ3Tg7V/playlist.m3u8","https://youku.letv-cdn.com/2019/07/25/Uj7Jc3PUSE6ktJxD/playlist.m3u8",
      "https://youku.letv-cdn.com/2019/07/25/ExknyxMugIq2UWbK/playlist.m3u8","https://youku.letv-cdn.com/2019/07/25/0iUladh89k8AlJlz/playlist.m3u8"
    ];
    freeTVList.add(FreeTV("3703650","黑袍纠察队 第一季","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2558948000.webp",list));

    list =[
      "https://tv.youkutv.cc/2019/10/29/2jH1g5jm3TrrusJq/playlist.m3u8","https://tv.youkutv.cc/2019/11/04/kwwObo91gkZkj9dl/playlist.m3u8","https://tv.youkutv.cc/2019/11/11/Y4WqHL8ltpR4hoHA/playlist.m3u8",
      "https://tv.youkutv.cc/2019/11/18/ExZLeTAbsROerULx/playlist.m3u8","https://tv.youkutv.cc/2019/11/25/yiM9JShEy33iNWY5/playlist.m3u8","https://tv.youkutv.cc/2019/12/02/srPKBwNRrduE6TmZ/playlist.m3u8",
      "https://tv.youkutv.cc/2019/12/09/B5OpMQ1YT7rzdhG8/playlist.m3u8"
    ];
    freeTVList.add(FreeTV("30194648","硅谷 第六季","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2571694925.webp",list));

    list =[
      "https://www.chifenghualvlvxingshe.com/20191130/ZDJqW5Tf/index.m3u8","https://www.chifenghualvlvxingshe.com/20191207/IJx4tQ9j/index.m3u8","https://www.chifenghualvlvxingshe.com/20191215/T74WPHKR/index.m3u8",
      "https://www.chifenghualvlvxingshe.com/20191222/hBO8EXGS/index.m3u8","https://www.chifenghualvlvxingshe.com/20200105/Jncg8oG0/index.m3u8","https://www.chifenghualvlvxingshe.com/20200105/wdbRi7sf/index.m3u8",
      "https://www.chifenghualvlvxingshe.com/20200112/Iafe0kDX/index.m3u8","https://www.chifenghualvlvxingshe.com/20200119/GHRPDSkb/index.m3u8","https://www.chifenghualvlvxingshe.com/20200129/KBObemLz/index.m3u8",
      "https://www.gentaji.com/20200202/RKSwkQlq/index.m3u8","https://www.gentaji.com/20200209/xi1k481I/index.m3u8","https://www.chifenghualvlvxingshe.com/20200216/6jUfiZrX/index.m3u8",
      "https://www.chifenghualvlvxingshe.com/20200222/mpOV4kxP/index.m3u8"
    ];
    freeTVList.add(FreeTV("27205208","哈莉·奎茵 第一季","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2575491932.webp",list));

    list =[
      "https://tv.youkutv.cc/2019/11/13/wv967Lwu1vyvH0D7/playlist.m3u8","https://tv.youkutv.cc/2019/11/16/6Uck5MHkAnFYv4U2/playlist.m3u8","https://tv.youkutv.cc/2019/11/23/4SLfev0wuM6oaScc/playlist.m3u8",
      "https://tv.youkutv.cc/2019/11/29/KwfPm21lhE8ijno8/playlist.m3u8","https://tv.youkutv.cc/2019/12/06/2BLrCLhTuuVJqiJT/playlist.m3u8","https://tv.youkutv.cc/2019/12/13/jyd1YZR1St1mzLRX/playlist.m3u8",
      "https://tv.youkutv.cc/2019/12/19/ucU8zjMx1y3jcxDv/playlist.m3u8","https://tv.youkutv.cc/2019/12/27/sv6qAIBb3a32xjfM/playlist.m3u8"
    ];
    freeTVList.add(FreeTV("30344167","曼达洛人 第一季","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2566627804.webp",list));

    list =[
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/1440_a5b90216d93f470873e7744a03c2d932.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_46b82913f6dab972429629761b5bd95f.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/1440_e159b8ceaf50a95de5f2f6dc02f67507.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/25330672_bdd3ddefdd6bc1e9e8f9d447b06c89cd.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/25330672_cae5570d1d5e4af7cde03c7714f8a89e.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/25330672_422831b63596c57e72a1e5dfca0b4fca.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_b0ccb23c051241447b7cd1c445401ea5.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_da81bae8fb8ec560615ccc69f81c85dd.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_3c489dbb7cad8b35813e5cfecc637fd5.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_d357e7ecf0efadfe56d0980f8546ebb3.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_f60bc19f58e4326e432c57a5b13b75e7.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_87b335f39f1da94a73f0834602a5bdad.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_2ceb11a0e3a0c90de623fc7dbb98d8fa.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_327f43326b10a9cad40114e0ca155bd6.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_ed3709f5001b42394b9c3d84ef762c04.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_b3fd06411d2d04b7ae9072d0d834b7fb.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_9df53251e4fe402bb3c8456b5ec9f40e.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_fa6d311d57686a7da7537a55e31b4782.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_adbc9acdd8546229fc425f958dea654e.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_dc7e6b7c46c8ff7922e7b9cb5727939b.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_9f3518627452a4d5cd796098ef4eb5aa.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_cc136d127e00697400372bfbc3cb1cdb.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_2d804152005d66f340d061db5d9b2ca4.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_993832d69bcca7fa67ebf6931538af34.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_7fc082c6cd9f9ef944eec15cd7072419.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_51691c08c97761bbb552b8089720dd67.mp4"
    ];
    freeTVList.add(FreeTV("30210221","鬼灭之刃","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2556173060.webp",list));

    list =[
      "https://tv.youkutv.cc/2020/01/09/9ezbNQQIcRR8k1of/playlist.m3u8","https://tv.youkutv.cc/2020/01/10/iKHVPtwGmeajlzcS/playlist.m3u8","https://tv.youkutv.cc/2020/01/16/Q46Pvm0OPkhvoo6m/playlist.m3u8",
      "https://tv.youkutv.cc/2020/01/24/DIBsSG0DrleliO9i/playlist.m3u8","https://tv.youkutv.cc/2020/01/30/Z6XOpa1s3owS2lBb/playlist.m3u8","https://tv1.youkutv.cc/2020/02/07/MbGtGqo3TRqgVccM/playlist.m3u8",
      "https://tv1.youkutv.cc/2020/02/07/pUWOJ8NzNVbOduzd/playlist.m3u8","https://tv1.youkutv.cc/2020/02/14/JJLbcMyYILuhd3Ni/playlist.m3u8","https://tv1.youkutv.cc/2020/02/21/DABgEQP9YQvMHkGG/playlist.m3u8",
      "https://tv1.youkutv.cc/2020/02/21/zNlWIQssu9Urw5uE/playlist.m3u8"
    ];
    freeTVList.add(FreeTV("30428027","犯罪心理 第十五季","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2560011498.webp",list));

    list =[
      "https://www.mzy2000.com/20191009/TbzHBhAJ/index.m3u8","https://www.mzy2000.com/20191017/K9d67F2f/index.m3u8","https://www.mzy2000.com/20191024/JQgysnQC/index.m3u8",
      "https://www.mzy2000.com/20191031/1L3zJxNr/index.m3u8","https://www.mzy2000.com/20191107/f9RKlpWK/index.m3u8","https://www.mzy2000.com/20191114/QkSzZKMc/index.m3u8",
      "https://www.mzy2000.com/20191121/KHcTWawK/index.m3u8","https://www.mzy2000.com/20191128/bmBrOiGw/index.m3u8","https://www.mzy2000.com/20191205/yzeZEKvO/index.m3u8",
      "https://www.mzy2000.com/20191212/peTgGKHK/index.m3u8","https://www.mzy2000.com/20191226/mPEMdik2/index.m3u8","https://www.mzy2000.com/20191226/sluZAjmk/index.m3u8"
    ];
    freeTVList.add(FreeTV("30458442","动物狂想曲","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2562089872.webp",list));

    list =[
      "https://tv.youkutv.cc/2019/11/05/OUrSMyjd8ntFL83I/playlist.m3u8","https://tv.youkutv.cc/2019/11/06/EHpHjIqDC0JeoN6T/playlist.m3u8","https://tv.youkutv.cc/2019/11/08/K6jzFb5QuYZFZyYE/playlist.m3u8",
      "https://tv.youkutv.cc/2019/11/10/EU26yppqPyzM2JhF/playlist.m3u8","https://tv.youkutv.cc/2019/11/10/uVIBn8KrJHPiZ8VM/playlist.m3u8"
    ];
    freeTVList.add(FreeTV("30399803","少年犯 第二季","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2573391635.webp",list));

    list =[
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_f0bb66b6d80b22fdf45021e300c5df16.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_edd85fec510a6a41a9540cf8cbdabe93.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_f492d95cd9d9c02b6d9d474e74d4a678.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_766a941fbe941094b8f90a612a51519a.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_bd305aa9a8c66b1ce02a058596221605.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_7fdcc07616c8a65c9ac8e3bdc9cd74d1.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_029cce94d073f50707bc2ec87242e0f9.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_edefdea6c2de1b716a367cc821a4fa43.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_e3236abc41e2406d34a19804861b1613.mp4"
    ];
    freeTVList.add(FreeTV("33218376","高分少女 第二季","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2568131686.webp",list));

    list =[
      "https://www.mzy2000.com/20191023/iVHe86lS/index.m3u8","https://www.mzy2000.com/20191023/DIKm86tf/index.m3u8","https://www.mzy2000.com/20191030/VJeSAETs/index.m3u8",
      "https://www.mzy2000.com/20191106/Zj0EmF9p/index.m3u8","https://www.mzy2000.com/20191113/znNVDUVn/index.m3u8","https://www.mzy2000.com/20191225/ZiOZkJWM/index.m3u8",
      "https://www.mzy2000.com/20191225/Xue1u6no/index.m3u8","https://www.mzy2000.com/20191225/TEucqNCh/index.m3u8","https://www.mzy2000.com/20191225/f38cpGMH/index.m3u8",
      "https://www.gentaji.com/20200214/we2m8Wae/index.m3u8"
    ];
    freeTVList.add(FreeTV("30371751","伍六七之最强发型师","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2571634144.webp",list));

    list =[
      "https://pptv.com-l-pptv.com/20181119/9366_6ee87168/index.m3u8","https://pptv.com-l-pptv.com/20181121/9435_9a29aaf0/index.m3u8","https://pptv.com-l-pptv.com/20181126/9828_819f3518/index.m3u8",
      "https://pptv.com-l-pptv.com/20181128/9942_482591a1/index.m3u8","https://pptv.com-l-pptv.com/20181203/10358_18081fa7/index.m3u8","https://pptv.com-l-pptv.com/20181204/10409_cf7d9f88/index.m3u8",
      "https://pptv.com-l-pptv.com/20181211/11005_eb08a3ca/index.m3u8","https://pptv.com-l-pptv.com/20181212/11081_366f2e9e/index.m3u8",
    ];
    freeTVList.add(FreeTV("28427782","我的天才女友 第一季","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2538458633.webp",list));

    list =[
      "https://135zyv6.xw0371.com/2019/03/15/OheL5qyTaFNzx5cW/playlist.m3u8","https://135zyv6.xw0371.com/2019/03/15/m1e6Z62duwQe3XZR/playlist.m3u8","https://135zyv6.xw0371.com/2019/03/15/ayUI2nNSmbrejmCY/playlist.m3u8",
      "https://135zyv6.xw0371.com/2019/03/15/YvMKCpwDW6HZ8lUk/playlist.m3u8","https://135zyv6.xw0371.com/2019/03/15/vLGmNyqf3pOty0GY/playlist.m3u8","https://135zyv6.xw0371.com/2019/03/15/R4Xi5BTDEv5A7sN2/playlist.m3u8",
      "https://135zyv6.xw0371.com/2019/03/15/cd5q9tYgQMClzLpZ/playlist.m3u8","https://135zyv6.xw0371.com/2019/03/15/JfH5Dlzb7X8lg2O4/playlist.m3u8","https://135zyv6.xw0371.com/2019/03/15/pUPt9HTIUfY4eYxe/playlist.m3u8",
      "https://135zyv6.xw0371.com/2019/03/15/9blzrxe2EzRCqs13/playlist.m3u8","https://135zyv6.xw0371.com/2019/03/15/9PDHOePCpyfeuwZo/playlist.m3u8","https://135zyv6.xw0371.com/2019/03/15/13hk1L0NoTD8C8bB/playlist.m3u8",
      "https://135zyv6.xw0371.com/2019/03/15/x9ZqtrJ3rbKDvyP2/playlist.m3u8","https://135zyv6.xw0371.com/2019/03/15/uMfAIeyEzjEMMBgu/playlist.m3u8","https://135zyv6.xw0371.com/2019/03/15/DfwK7G4nI7cwLVEk/playlist.m3u8",
      "https://135zyv6.xw0371.com/2019/03/15/SvbB2iLOdWbotmTA/playlist.m3u8","https://135zyv6.xw0371.com/2019/03/15/C0ys0c0H3cI725tA/playlist.m3u8","https://135zyv6.xw0371.com/2019/03/15/ZhT8KF9CE43DXbyL/playlist.m3u8"
    ];
    freeTVList.add(FreeTV("30424374","爱，死亡和机器人 第一季","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2548248276.webp",list));

    list =[
      "https://www.chifenghualvlvxingshe.com/20191105/aMDeu87t/index.m3u8","https://www.chifenghualvlvxingshe.com/20191106/jm4shTwa/index.m3u8","https://www.chifenghualvlvxingshe.com/20191106/2dQqNVsS/index.m3u8",
      "https://www.chifenghualvlvxingshe.com/20191106/TA89oGuE/index.m3u8","https://www.chifenghualvlvxingshe.com/20191106/hiBSmjex/index.m3u8","https://www.chifenghualvlvxingshe.com/20191106/S0yvH2un/index.m3u8",
      "https://www.chifenghualvlvxingshe.com/20191106/RqNG8puh/index.m3u8","https://www.chifenghualvlvxingshe.com/20191106/TGzScO7E/index.m3u8"
    ];
    freeTVList.add(FreeTV("27625457","去他*的世界 第二季","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2570938064.webp",list));

    list =[
      "https://tv.youkutv.cc/2019/10/28/nHaqByXuKw3mkfIe/playlist.m3u8","https://tv.youkutv.cc/2019/11/04/S2JpThusp9Xcnv9e/playlist.m3u8","https://tv.youkutv.cc/2019/11/12/9oEaYKg9g8tpQnd6/playlist.m3u8",
      "https://tv.youkutv.cc/2019/11/18/DwTGoq4CgNf3OeyN/playlist.m3u8","https://tv.youkutv.cc/2019/11/25/ZMhJPbdTu5QsmLzO/playlist.m3u8","https://tv.youkutv.cc/2019/12/03/51RNClY9kikoB3d6/playlist.m3u8",
      "https://tv.youkutv.cc/2019/12/10/39Y2PgLWuyyvUSCV/playlist.m3u8"
    ];
    freeTVList.add(FreeTV("33387353","七个世界，一个星球","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2572676219.webp",list));

    list =[
      "https://www.lthjjlb.com/20190429/Rl8DUYEa/index.m3u8","https://www.lthjjlb.com/20190429/CLYZtb37/index.m3u8","https://www.lthjjlb.com/20190429/KxgV5qg1/index.m3u8",
      "https://www.lthjjlb.com/20190429/hq0iJCHi/index.m3u8","https://www.lthjjlb.com/20190429/9hKkgAEC/index.m3u8","https://www.lthjjlb.com/20190429/ARbmGjK6/index.m3u8",
      "https://www.lthjjlb.com/20190429/H5gh5md6/index.m3u8","https://www.lthjjlb.com/20190429/ODilSovS/index.m3u8","https://www.lthjjlb.com/20190429/hnnQ5l6J/index.m3u8",
      "https://www.lthjjlb.com/20190429/NHCKMn3B/index.m3u8","https://www.lthjjlb.com/20190429/7ZJOhAP0/index.m3u8","https://www.lthjjlb.com/20190429/ty7mQvwN/index.m3u8",
    ];
    freeTVList.add(FreeTV("26339248","一拳超人","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2234184583.webp",list));

    list =[
      "https://www.chifenghualvlvxingshe.com/20191223/1SEmy9ib/index.m3u8","https://www.chifenghualvlvxingshe.com/20191223/Xzu4hI6Y/index.m3u8","https://www.chifenghualvlvxingshe.com/20191223/2oquQy5i/index.m3u8",
      "https://www.chifenghualvlvxingshe.com/20191223/joUqvTbs/index.m3u8","https://www.chifenghualvlvxingshe.com/20191223/3ZKisI4N/index.m3u8","https://www.chifenghualvlvxingshe.com/20191223/5s0kHvo3/index.m3u8",
      "https://www.chifenghualvlvxingshe.com/20191223/nSmR3uIl/index.m3u8","https://www.chifenghualvlvxingshe.com/20191223/WtlJiEnZ/index.m3u8"
    ];
    freeTVList.add(FreeTV("26637615","猎魔人 第一季","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2574764569.webp",list));

    list =[
      "https://www.mzy2000.com/20191025/ebX2hBmf/index.m3u8","https://www.mzy2000.com/20191101/dwZCBsIO/index.m3u8","https://www.mzy2000.com/20191109/TfhRTgLC/index.m3u8",
      "https://www.mzy2000.com/20191115/D7jidUlG/index.m3u8","https://www.mzy2000.com/20191122/nhdcjAqR/index.m3u8","https://www.mzy2000.com/20191206/jkqdmJ1N/index.m3u8",
      "https://www.mzy2000.com/20191206/NGe5tXrw/index.m3u8","https://www.mzy2000.com/20191213/6Ud1fw8A/index.m3u8"
    ];
    freeTVList.add(FreeTV("30486591","心理测量者3","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2569880216.webp",list));

    list =[
      "https://www.mzy2000.com/20190813/zOc8WAaf/index.m3u8","https://www.mzy2000.com/20190813/oskrz9kM/index.m3u8","https://www.mzy2000.com/20190813/IJupmO2W/index.m3u8",
      "https://www.mzy2000.com/20190813/Oxk23FOv/index.m3u8","https://www.mzy2000.com/20190813/lT4OCeK3/index.m3u8","https://www.mzy2000.com/20190813/6QKJcUDR/index.m3u8",
      "https://www.mzy2000.com/20190813/CJlKRFVm/index.m3u8","https://www.mzy2000.com/20190813/l1wKCcsO/index.m3u8","https://www.mzy2000.com/20190813/WNbM5kjG/index.m3u8",
      "https://www.mzy2000.com/20190813/CqQNX9pZ/index.m3u8"
    ];
    freeTVList.add(FreeTV("24697949","半泽直树","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2411814194.webp",list));

    list =[
      "https://www.mzy2000.com/20191101/17bntEi1/index.m3u8","https://www.mzy2000.com/20191101/oB7WYwTC/index.m3u8","https://www.mzy2000.com/20191101/MRlrefBR/index.m3u8",
      "https://www.mzy2000.com/20191101/epT4dfuv/index.m3u8","https://www.mzy2000.com/20191101/LWhGXr5T/index.m3u8","https://www.mzy2000.com/20191101/B4cQxC83/index.m3u8",
      "https://www.mzy2000.com/20191101/OycXPqyv/index.m3u8","https://www.mzy2000.com/20191101/LH5kpWJZ/index.m3u8","https://www.mzy2000.com/20191101/FxG0WdiZ/index.m3u8",
      "https://www.mzy2000.com/20191101/9Oc03Jfg/index.m3u8","https://www.mzy2000.com/20191101/Miz92019/index.m3u8","https://www.mzy2000.com/20191101/r55fwqcL/index.m3u8"
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
      "https://www.mmicloud.com/20191231/AFElSPK7/index.m3u8","https://www.mmicloud.com/20191231/8z2ppsBj/index.m3u8","https://www.mmicloud.com/20191231/4E5P7tGR/index.m3u8",
      "https://www.mmicloud.com/20191231/5TM5Gdjt/index.m3u8","https://www.mmicloud.com/20191231/fW3efmdc/index.m3u8","https://www.mmicloud.com/20191231/QFHka7NU/index.m3u8",
    ];
    freeTVList.add(FreeTV("33379430","齐木楠雄的灾难 Ψ始动篇","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2574157911.webp",list));

    list =[
      "https://tv.youkutv.cc/2019/12/06/0jMZq33A2ZHOHaQR/playlist.m3u8","https://tv.youkutv.cc/2019/12/06/B1evYRTv7aYh2DDp/playlist.m3u8","https://tv.youkutv.cc/2019/12/06/X6ufPcUx8PkhFOA4/playlist.m3u8",
      "https://tv.youkutv.cc/2019/12/06/Mx1lZvZYpFwFGca2/playlist.m3u8","https://tv.youkutv.cc/2019/12/06/eRuVoNMtNYuqjV4p/playlist.m3u8","https://tv.youkutv.cc/2019/12/06/zUN1rTGW5iteZsG1/playlist.m3u8",
      "https://tv.youkutv.cc/2019/12/06/hJT1JFdu1CHoyZLU/playlist.m3u8","https://tv.youkutv.cc/2019/12/06/Ysee9WBhWRs7aimb/playlist.m3u8"
    ];
    freeTVList.add(FreeTV("30227139","了不起的麦瑟尔夫人 第三季","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2566289967.webp",list));

    list =[
      "https://www.lthjjlb.com/20190531/reHSmtM8/index.m3u8","https://www.lthjjlb.com/20190531/liIBt9dl/index.m3u8","https://www.lthjjlb.com/20190531/DP2zrB9z/index.m3u8",
      "https://www.lthjjlb.com/20190531/fSjjogf3/index.m3u8","https://www.lthjjlb.com/20190531/naTFmrHm/index.m3u8","https://www.lthjjlb.com/20190531/yICsJ4pk/index.m3u8",
      "https://www.lthjjlb.com/20190531/XZHXbqZe/index.m3u8","https://www.lthjjlb.com/20190531/Av4Pxez1/index.m3u8","https://www.lthjjlb.com/20190531/gS8V2aZH/index.m3u8",
      "https://www.lthjjlb.com/20190531/M0OfgbMp/index.m3u8","https://www.lthjjlb.com/20190531/sp5BpIfF/index.m3u8"
    ];
    freeTVList.add(FreeTV("26936271","犬屋敷","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2500888174.webp",list));

    list =[
      "https://tv.youkutv.cc/2019/11/17/8Jp1jBmET5439YYU/playlist.m3u8","https://tv.youkutv.cc/2019/11/17/THGJyeisxO8rLdZ4/playlist.m3u8","https://tv.youkutv.cc/2019/11/17/KedHYi0m269KTiJn/playlist.m3u8",
      "https://tv.youkutv.cc/2019/11/17/lxdQeSdOyWe7vRq6/playlist.m3u8","https://tv.youkutv.cc/2019/11/17/OQxkA8qqxKSyuxAF/playlist.m3u8","https://tv.youkutv.cc/2019/11/17/xYExVhwGxGAvwOSH/playlist.m3u8",
      "https://tv.youkutv.cc/2019/11/17/NhDuwipo9RZ70rrE/playlist.m3u8","https://tv.youkutv.cc/2019/11/17/F9c3mvjH3iJ2vLMg/playlist.m3u8","https://tv.youkutv.cc/2019/11/17/SmmAzjboHMIxiFCb/playlist.m3u8",
      "https://tv.youkutv.cc/2019/11/17/kaKb5r01Slbh6Fsm/playlist.m3u8"
    ];
    freeTVList.add(FreeTV("27182502","王冠 第三季","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2575305336.webp",list));

    list =[
      "https://www.chifenghualvlvxingshe.com/20190927/Du81sEVQ/index.m3u8","https://www.chifenghualvlvxingshe.com/20191004/yOd9zpkJ/index.m3u8","https://www.chifenghualvlvxingshe.com/20191012/4JWH6qST/index.m3u8",
      "https://www.chifenghualvlvxingshe.com/20191019/GBuzU1rW/index.m3u8","https://www.chifenghualvlvxingshe.com/20191026/dADZ9u86/index.m3u8","https://www.chifenghualvlvxingshe.com/20191108/df8CWBGp/index.m3u8",
      "https://www.chifenghualvlvxingshe.com/20191115/yOAe2nkK/index.m3u8","https://www.chifenghualvlvxingshe.com/20191123/btTm7IX8/index.m3u8","https://www.chifenghualvlvxingshe.com/20191206/DzeEB7L2/index.m3u8",
      "https://www.chifenghualvlvxingshe.com/20191213/vniWLkem/index.m3u8","https://www.chifenghualvlvxingshe.com/20200110/zuW9XYVg/index.m3u8","https://www.chifenghualvlvxingshe.com/20200117/Rgiys6pt/index.m3u8",
      "https://www.chifenghualvlvxingshe.com/20200131/vsURNQgx/index.m3u8","https://www.chifenghualvlvxingshe.com/20200208/LS2Yo69D/index.m3u8","https://www.chifenghualvlvxingshe.com/20200215/XlFHd0TU/index.m3u8",
      "https://www.chifenghualvlvxingshe.com/20200221/KkH2eEF3/index.m3u8","https://www.chifenghualvlvxingshe.com/20200307/sCDoU7OZ/index.m3u8"
    ];
    freeTVList.add(FreeTV("30454223","极品老妈 第七季","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2569859887.webp",list));

    list =[
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_eb2dbada8b0611ccbc13301fc14f181a.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_6fa281fb3e8046a2404b361bec9bc8f5.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_5dc6bf9f354c29d427ad0edf39a298d3.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_a514615c97f54f9654be469be4a0ea04.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_8190db389e56b573ddfb7257bda078e4.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_a30dd690f8ddd062bf94a0e06aa1c0a0.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_27ee42b6e858f8de2071df0788e40c88.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_1b8869da80ab486453f3c13bf6653081.mp4",
      "https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/60_fe2665be9bfb7956fdac3e4c6b26be04.mp4"
    ];
    freeTVList.add(FreeTV("30411330","排球少年 第四季","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2569422684.webp",list));

    list =[
      "https://www.mzy2000.com/20200109/2ceWY2US/index.m3u8","https://www.mzy2000.com/20200109/44qO5PRy/index.m3u8","https://www.mzy2000.com/20200109/ga9xIaY0/index.m3u8",
      "https://www.mzy2000.com/20200109/fbyd1EJM/index.m3u8","https://www.mzy2000.com/20200109/Gnm88EWO/index.m3u8","https://www.mzy2000.com/20200109/oplD0111/index.m3u8",
      "https://www.mzy2000.com/20200109/XwDUlkJp/index.m3u8","https://www.mzy2000.com/20200109/enRzF7AU/index.m3u8","https://www.mzy2000.com/20200109/burGmlO3/index.m3u8",
      "https://www.mzy2000.com/20200109/8r44LmqS/index.m3u8"
    ];
    freeTVList.add(FreeTV("30183785","我是大哥大","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2543113206.webp",list));

    list =[
      "https://youku.cdn2-youku.com/20180521/11542_fe1ba8b9/index.m3u8","https://youku.cdn2-youku.com/20180521/11543_bea1f7cf/index.m3u8","https://youku.cdn2-youku.com/20180521/11544_e2424406/index.m3u8",
      "https://youku.cdn2-youku.com/20180521/11545_d5cc7cc1/index.m3u8","https://youku.cdn2-youku.com/20180521/11546_b42887d2/index.m3u8","https://youku.cdn2-youku.com/20180521/11547_0bf8cd64/index.m3u8",
      "https://youku.cdn2-youku.com/20180521/11548_e7224456/index.m3u8","https://youku.cdn2-youku.com/20180521/11549_2bf9c819/index.m3u8","https://youku.cdn2-youku.com/20180521/11550_96b4fc66/index.m3u8",
      "https://youku.cdn2-youku.com/20180521/11551_b43eb86f/index.m3u8","https://youku.cdn2-youku.com/20180521/11552_8e13a905/index.m3u8","https://youku.cdn2-youku.com/20180521/11553_6ea03b2d/index.m3u8",
      "https://youku.cdn2-youku.com/20180521/11554_fbbd31e8/index.m3u8","https://youku.cdn2-youku.com/20180521/11555_f2c74c92/index.m3u8","https://youku.cdn2-youku.com/20180521/11556_1b312d0a/index.m3u8",
      "https://youku.cdn2-youku.com/20180521/11557_f2667e25/index.m3u8"
    ];
    freeTVList.add(FreeTV("6952149","绝命毒师 第五季","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p1579021082.webp",list));

    list =[
      "https://www.mzy2000.com/20191002/K7jGgXb9/index.m3u8","https://www.mzy2000.com/20191013/2oa8aJJ1/index.m3u8","https://www.mzy2000.com/20191020/SDkqF4L9/index.m3u8",
      "https://www.mzy2000.com/20191026/u2RZKUDI/index.m3u8","https://www.mzy2000.com/20191102/Gtj6axGH/index.m3u8","https://www.mzy2000.com/20191110/zQkBCmuA/index.m3u8",
      "https://www.mzy2000.com/20191116/SV2DCWTm/index.m3u8","https://www.mzy2000.com/20191123/MNnXuTXc/index.m3u8","https://www.mzy2000.com/20191201/uEnOG4ws/index.m3u8",
      "https://www.mzy2000.com/20191208/X60H3neG/index.m3u8","https://www.mzy2000.com/20191214/JoF8h4v9/index.m3u8","https://www.mzy2000.com/20191222/nfghEzCb/index.m3u8",
    ];
    freeTVList.add(FreeTV("34801559","孤独的美食家 第八季","https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2569294195.webp",list));

    list =[
      "https://youku.com-ok-pptv.com/20190926/7441_8c2e6eea/index.m3u8","https://youku.com-ok-pptv.com/20191003/7689_d8d4b4a6/index.m3u8","https://youku.com-ok-pptv.com/20191010/7949_b7f3a662/index.m3u8",
      "https://youku.com-ok-pptv.com/20191017/8211_b4e0c741/index.m3u8","https://youku.cdn1-okzy.com/20191031/8783_6a00abb7/index.m3u8","https://youku.cdn1-okzy.com/20191107/9099_5b329da2/index.m3u8",
      "https://v1.szjal.cn/ppvod/92FD235462B15B175420086B601FEF86.m3u8","https://youku.cdn1-okzy.com/20191205/10081_3c7eb0dc/index.m3u8","https://youku.cdn1-okzy.com/20191212/10404_d304cdde/index.m3u8",
      "https://youku.cdn1-okzy.com/20200109/11277_02cd7d01/index.m3u8","https://youku.cdn1-okzy.com/20200116/11536_2d7ac7b1/index.m3u8","https://youku.cdn1-okzy.com/20200123/11799_ec8ee829/index.m3u8",
      "https://youku.cdn1-okzy.com/20200213/12677_9b91c196/index.m3u8","https://youku.cdn1-okzy.com/20200220/12985_b02b3b73/index.m3u8"
    ];
    freeTVList.add(FreeTV("30454227","摩登家庭 第十一季","https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2584872902.webp",list));

    list =[
      "https://youku.cdn6-okzy.com/20200106/8803_bd08a9e0/index.m3u8","https://youku.cdn6-okzy.com/20200106/8804_cdd33f95/index.m3u8","https://youku.cdn6-okzy.com/20200106/8805_fd9f7629/index.m3u8",
      "https://youku.cdn6-okzy.com/20200106/8806_348ec221/index.m3u8","https://youku.cdn6-okzy.com/20200106/8807_31c34964/index.m3u8","https://youku.cdn6-okzy.com/20200106/8808_5b9f069f/index.m3u8",
    ];
    freeTVList.add(FreeTV("1301174","傲慢与偏见","https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2184360268.webp",list));

    list =[
      "https://www.chifenghualvlvxingshe.com/20190611/wlCvURBn/index.m3u8","https://www.chifenghualvlvxingshe.com/20190611/ErSY2tgF/index.m3u8","https://www.chifenghualvlvxingshe.com/20190611/j8W5q9hG/index.m3u8",
      "https://www.chifenghualvlvxingshe.com/20190611/JNVfmXlL/index.m3u8","https://www.chifenghualvlvxingshe.com/20190611/6IYLhBFn/index.m3u8","https://www.chifenghualvlvxingshe.com/20190611/wL2lFkm4/index.m3u8",
      "https://www.chifenghualvlvxingshe.com/20190611/ceZWMAQ2/index.m3u8","https://www.chifenghualvlvxingshe.com/20190611/BtMHIfRK/index.m3u8","https://www.chifenghualvlvxingshe.com/20190611/DwHKr3Xc/index.m3u8",
      "https://www.chifenghualvlvxingshe.com/20190611/HbRZd7ie/index.m3u8","https://www.chifenghualvlvxingshe.com/20190611/1TMjaqf9/index.m3u8","https://www.chifenghualvlvxingshe.com/20190611/F4T3aUuy/index.m3u8",
      "https://www.chifenghualvlvxingshe.com/20190611/eAJ0a4NZ/index.m3u8","https://www.chifenghualvlvxingshe.com/20190611/Q7A80fMm/index.m3u8","https://www.chifenghualvlvxingshe.com/20190611/xvpYWBjV/index.m3u8",
      "https://www.chifenghualvlvxingshe.com/20190611/hFp74EKN/index.m3u8","https://www.chifenghualvlvxingshe.com/20190611/Grv8gskI/index.m3u8"
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
