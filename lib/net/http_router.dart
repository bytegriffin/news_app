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
List<String> urlPool = [
  "https://douban.uieee.com",
  "https://douban-api.uieee.com",
  "https://douban-api.now.sh",
  "https://douban-api.zce.now.sh",
  // "https://douban-api-git-master.zce.now.sh"
];
String getRouterUrl(){
  return urlPool[Random().nextInt(urlPool.length)];
}


List<String> cookiePool = [
  "BAIDUID=501A9AD4BD86B3FAC733070345736378:FG=1; expires=Wed, 13-Jan-21 14:59:03 GMT; max-age=31536000; path=/; domain=.hao123.com; version=1;",
  "BAIDUID=034EF6889579393CC9D044B7A1E3268E:FG=1; expires=Wed, 13-Jan-21 14:59:28 GMT; max-age=31536000; path=/; domain=.hao123.com; version=1;",
  "BAIDUID=0C479EF8669523FB93B18BDFB6E9050A:FG=1; expires=Wed, 13-Jan-21 14:59:59 GMT; max-age=31536000; path=/; domain=.hao123.com; version=1;",
  "BAIDUID=3940C94AD5B0C6567487889E8F7568E5:FG=1; expires=Wed, 13-Jan-21 15:00:16 GMT; max-age=31536000; path=/; domain=.hao123.com; version=1;",
  "BAIDUID=9EC427BBE2339D157DD67FB06F8B8C0F:FG=1; expires=Wed, 13-Jan-21 15:00:30 GMT; max-age=31536000; path=/; domain=.hao123.com; version=1;",
  "BAIDUID=DEC18A29043333A7DD624DEE6B433E40:FG=1; expires=Wed, 13-Jan-21 15:00:44 GMT; max-age=31536000; path=/; domain=.hao123.com; version=1;",
  "BAIDUID=AE43467033E2C2626B12765BD9C76675:FG=1; expires=Wed, 13-Jan-21 15:00:59 GMT; max-age=31536000; path=/; domain=.hao123.com; version=1;",
  "BAIDUID=54629294C1F11C6EDB1D8AF7192BFA67:FG=1; expires=Wed, 13-Jan-21 15:01:11 GMT; max-age=31536000; path=/; domain=.hao123.com; version=1;",
  "BAIDUID=0943AA77C167DC48701DE3398DEF0BD1:FG=1; expires=Wed, 13-Jan-21 15:01:29 GMT; max-age=31536000; path=/; domain=.hao123.com; version=1;",
  "BAIDUID=C62294412AF819C32D5D534AEC13032E:FG=1; expires=Wed, 13-Jan-21 15:01:43 GMT; max-age=31536000; path=/; domain=.hao123.com; version=1;",
  "BAIDUID=3880633B30688EE64CE90DE7E2E570E0:FG=1; expires=Wed, 13-Jan-21 15:02:29 GMT; max-age=31536000; path=/; domain=.hao123.com; version=1;",
  "BAIDUID=AAC7DDAE98A1F944192A0C1E23102331:FG=1; expires=Wed, 13-Jan-21 15:02:41 GMT; max-age=31536000; path=/; domain=.hao123.com; version=1;",
  "BAIDUID=D9D3E0E5DD3A6A59A8F5B4E7A6B66024:FG=1; expires=Wed, 13-Jan-21 15:02:51 GMT; max-age=31536000; path=/; domain=.hao123.com; version=1;",
  "BAIDUID=850E6CC3A22D237B12E4EA4055D3ACC0:FG=1; expires=Wed, 13-Jan-21 15:03:02 GMT; max-age=31536000; path=/; domain=.hao123.com; version=1;",
  "BAIDUID=DFED02033FEA2A3F46B30D975B640360:FG=1; expires=Wed, 13-Jan-21 15:03:23 GMT; max-age=31536000; path=/; domain=.hao123.com; version=1;"
];

var cookie = cookiePool[Random().nextInt(cookiePool.length)];

String getVideoCookies(){
  return cookie;
}
