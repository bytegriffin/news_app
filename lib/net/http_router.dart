import 'dart:math';

// 即将上映
var commingUpMovieUrl = getRouterUrl() + "/v2/movie/coming_soon";
// 正在热映
var theatersMovieUrl = getRouterUrl() + "/v2/movie/in_theaters";
// 北美票房榜
var usMovieUrl = getRouterUrl() + "/v2/movie/us_box";
// TOP250
var top250MovieUrl = getRouterUrl() + "/v2/movie/top250";
// 口碑榜
var weeklyMovieUrl = getRouterUrl() + "/v2/movie/weekly";
// 新片榜
var newMovieUrl = getRouterUrl() + "/v2/movie/new_movies";
// 获取单个电影信息
var getMovieUrl = getRouterUrl() + "/v2/movie/subject/";
// 获取单个电影人员信息
var getCastUrl = getRouterUrl() + "/v2/movie/celebrity/";


// 获取单个图书信息
var getBookUrl = getRouterUrl() + "/v2/book/";
// 文学
var lifeBookUrl = getRouterUrl() + "/v2/book/search?q='文学'&start=0&count=20";
// 技术
var techBookUrl = getRouterUrl() + "/v2/book/search?q='编程'&start=0&count=20";

//为了避免过多访问同一个api地址而导致访问次数受限，
//每次访问前可将其路由到不同的api地址来减少访问同一个api的次数
String getRouterUrl(){
  List<String> urlPool = [
    "https://douban.uieee.com",
    "https://douban-api.uieee.com",
    "https://douban-api.now.sh",
    "https://douban-api.zce.now.sh",
   // "https://douban-api-git-master.zce.now.sh"
  ];
  return urlPool[Random().nextInt(urlPool.length)];
}
