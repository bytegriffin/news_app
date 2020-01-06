const HTTP_CONNECT_TIMEOUT = 5000;
const HTTP_RECEIVE_TIMEOUT = 5000;
// 推荐
const REC_NEWS_API = "https://www.hao123.com/feedData/data?type=rec&app_from=pc_tuijian&rn=20&pn=1";
// 体育
const SPORT_NEWS_API = "https://www.hao123.com/feedData/data?type=sports&app_from=pc_tuijian&rn=20&pn=1";
// 国内
const GN_NEWS_API = "https://www.hao123.com/feedData/data?type=domestic&app_from=pc_tuijian&rn=20&pn=1";
// 国际
const GJ_NEWS_API = "https://www.hao123.com/feedData/data?type=intl&app_from=pc_tuijian&rn=20&pn=1";
// 财经
const FINANCE_NEWS_API = "https://www.hao123.com/feedData/data?type=finance&app_from=pc_tuijian&rn=20&pn=1";
// 科技
const TECH_NEWS_API = "https://www.hao123.com/feedData/data?type=tech&app_from=pc_tuijian&rn=20&pn=1";
// 历史
const HISTORY_NEWS_API = "https://www.hao123.com/feedData/data?type=history&app_from=pc_tuijian&rn=20&pn=1";
// 汽车
const CAR_NEWS_API = "https://www.hao123.com/feedData/data?type=cars&app_from=pc_tuijian&rn=20&pn=1";
// 教育 分类消息错误
const EDU_NEWS_API = "https://www.hao123.com/feedData/data?type=edu&app_from=pc_tuijian&rn=20&pn=1";
// 游戏
const GAME_NEWS_API = "https://www.hao123.com/feedData/data?type=games&app_from=pc_tuijian&rn=20&pn=1";
// 房产 分类消息错误
const FANG_NEWS_API = "https://www.hao123.com/feedData/data?type=estate&app_from=pc_tuijian&rn=20&pn=1";
// 时尚
const FASHION_NEWS_API = "https://www.hao123.com/feedData/data?type=fashion&app_from=pc_tuijian&rn=20&pn=1";
// 娱乐
const ENT_NEWS_API = "https://tuijian.hao123.com/headnew_timeline?pagesize=20&key=ent";

// 搜索suggest
// https://www.baidu.com/sugrec?prod=pc_hao123&wd=
const SUGGUEST = "https://www.baidu.com/sugrec?prod=pc_hao123&wd=";

//新闻分页URL  https://tuijian.hao123.com/headnew_timeline?page=1&pagesize=10&key=ent

// 实时热点新闻  https://m.hao123.com/hao123_api/api/top/getBuzzTop?cate=热点&buzz=实时热点

// 头条api https://www.toutiao.com/api/pc/feed/?category=__all__

// "http://c.m.163.com/nc/article/headline/T1348647853363/0-10.html";
// 聚合新闻api http://v.juhe.cn/toutiao/index?type=top&key=3dc86b09a2ee2477a5baa80ee70fcdf5
// https://www.hao123.com/feedData/data?callback=jQuery18206683182829139738_1576235945849&type=rec&app_from=pc_tuijian&rn=10&pn=2

const VIDEO_API = "https://www.hao123.com/feedData/data?rn=20&pn=3&type=video&ctype=video&app_from=pc_tuijian";

//豆瓣API
//https://douban.uieee.com
//https://douban-api.uieee.com
//https://douban-api.now.sh
//https://douban-api.zce.now.sh
//https://douban-api-git-master.zce.now.sh

// 默认的豆瓣base api
const doubanBaseApi = "https://douban.uieee.com";
//默认分配第一个，之后第二个，最后一个时，重新置为0
int urlIndex = 0;

// 根据传入的url，重新分配一个不受访问限制的api地址
String getAvaliableUrl(String url){
//  String preffixUrl = url.substring(0,url.indexOf("/v"));
  String suffixUrl = url.substring(url.indexOf("/v"), url.length);
  List<String> urlPool = [
    "https://douban-api.uieee.com",
    "https://douban-api.now.sh",
    "https://douban-api.zce.now.sh",
    "https://douban-api-git-master.zce.now.sh"
  ];
  if(urlIndex == urlPool.length - 1){
    urlIndex = 0;
  }
  String newUrl = urlPool[urlIndex] + suffixUrl;
  urlIndex = urlIndex + 1;
  return newUrl;
}


// 热门电视剧
const HOT_TV = "https://movie.douban.com/j/search_subjects?type=tv&tag=%E7%83%AD%E9%97%A8&page_limit=21&page_start=0";
// 热门电影
const HOT_MOVIE="https://movie.douban.com/j/search_subjects?type=movie&tag=%E7%83%AD%E9%97%A8&page_limit=21&page_start=0";



// 图书畅销榜
const TOP_SALE_BOOK = "https://read.douban.com/j/index//charts?type=sales&index=ebook&verbose=1";
// 最新读书榜
const TOP_NEW_BOOK = "https://read.douban.com/j/index//charts?type=newly_published_sales&index=ebook&verbose=1";
// 套装书榜
const TOP_BUNDLE_BOOK="https://read.douban.com/j/index//charts?type=bundle_sales&index=ebook&verbose=1";
// 好评书榜
const HIGH_RATE_BOOK="https://read.douban.com/j/index//charts?type=highly_rated_sales&index=ebook&verbose=1";

// 音乐
const NEW_MUSIC_URL = "http://musicapi.leanapp.cn/personalized/newsong";
// const NEW_MUSIC = "https://music.jeeas.cn/v1/personalized/newsong?from=music";
// 网友最新歌单
const PLAYLIST_URL = "/top/playlist?limit=10&order=new";
// 网友最新歌单详情
const PLAYLIST_DETAIL_URL = "http://musicapi.leanapp.cn/playlist/detail?id=24381616";
// 音乐搜索
const SEARCH_URL = "http://musicapi.leanapp.cn/search?keywords=";
// 歌曲详情
const SONG_DETAIL_URL = "http://musicapi.leanapp.cn/song/detail?ids=347230";
// 专辑内容
const ALBUM_URL = "http://musicapi.leanapp.cn/album?id=32311";
// 获得歌手单曲
const ARTIST_SONG_URL = "http://musicapi.leanapp.cn/artists?id=6452";
// 获得歌手单曲
const ARTIST_ALBUM_URL = "http://musicapi.leanapp.cn/artist/album?id=6452&limit=30";
// 获得歌手描述
const ARTIST_DESC_URL = "http://musicapi.leanapp.cn/artist/album?id=6452&limit=30";



























