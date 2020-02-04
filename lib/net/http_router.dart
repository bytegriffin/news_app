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
  //"https://douban-api.now.sh",
  "https://douban-api.zce.now.sh",
  //"https://douban-api-git-master.zce.now.sh"
];
String getRouterUrl(){
  return urlPool[Random().nextInt(urlPool.length)];
}


List<String> cookiePool = [
  "BAIDUID=3A70F193311D1FDADBD38B37F85DF9C2:FG=1; expires=Wed, 03-Feb-21 06:50:19 GMT; max-age=31536000; path=/; domain=.hao123.com; version=1;",
  "BAIDUID=DE806399A4AA5437172B7F1610DD4DF8:FG=1; expires=Wed, 03-Feb-21 06:53:16 GMT; max-age=31536000; path=/; domain=.hao123.com; version=1;",
  "BAIDUID=125F6DE2FC8568CDF2B621D4C2B85B4D:FG=1; expires=Wed, 03-Feb-21 06:53:32 GMT; max-age=31536000; path=/; domain=.hao123.com; version=1;",
  "BAIDUID=2BE65319B3D4BEAA5D246113EB68DC33:FG=1; expires=Wed, 03-Feb-21 06:53:53 GMT; max-age=31536000; path=/; domain=.hao123.com; version=1;",
  "BAIDUID=61BCCDA5008736210BD44857B704D211:FG=1; expires=Wed, 03-Feb-21 06:54:04 GMT; max-age=31536000; path=/; domain=.hao123.com; version=1;",
  "BAIDUID=38C8F174BF44D43699A857196C4AA81A:FG=1; expires=Wed, 03-Feb-21 06:54:15 GMT; max-age=31536000; path=/; domain=.hao123.com; version=1;",
  "BAIDUID=3FBBA3A33944A6DF5452660359942AC7:FG=1; expires=Wed, 03-Feb-21 06:54:25 GMT; max-age=31536000; path=/; domain=.hao123.com; version=1;",
  "BAIDUID=CF3D31C93EC32B06E4777E2D3C6180D3:FG=1; expires=Wed, 03-Feb-21 06:54:35 GMT; max-age=31536000; path=/; domain=.hao123.com; version=1;",
  "BAIDUID=BB3AAFAD7AE83935941FE9AE69E77E4C:FG=1; expires=Wed, 03-Feb-21 06:54:44 GMT; max-age=31536000; path=/; domain=.hao123.com; version=1;",
  "BAIDUID=A4F205228B69E0A8E32F8A0EA1D6A70D:FG=1; expires=Wed, 03-Feb-21 06:55:02 GMT; max-age=31536000; path=/; domain=.hao123.com; version=1;",
  "BAIDUID=22192B65BF15A145814CAC63B5292203:FG=1; expires=Wed, 03-Feb-21 06:55:12 GMT; max-age=31536000; path=/; domain=.hao123.com; version=1;",
  "BAIDUID=8EBDD1BF823C19B5C92692687597BBD1:FG=1; expires=Wed, 03-Feb-21 06:55:23 GMT; max-age=31536000; path=/; domain=.hao123.com; version=1;",
  "BAIDUID=F0709E9A528B84F5B22207DDA41925CA:FG=1; expires=Wed, 03-Feb-21 06:55:34 GMT; max-age=31536000; path=/; domain=.hao123.com; version=1;",
  "BAIDUID=BF33839B89143FB36A221409F6313D07:FG=1; expires=Wed, 03-Feb-21 06:55:44 GMT; max-age=31536000; path=/; domain=.hao123.com; version=1;",
  "BAIDUID=502C3506E03CE109AF6C74CD596E8416:FG=1; expires=Wed, 03-Feb-21 06:55:53 GMT; max-age=31536000; path=/; domain=.hao123.com; version=1;",
  "BAIDUID=4E1F5A0573A978BD4F157438C6EC29B9:FG=1; expires=Wed, 03-Feb-21 06:56:03 GMT; max-age=31536000; path=/; domain=.hao123.com; version=1;",
  "BAIDUID=C3376EBE7536EB58178CE9558C353FBC:FG=1; expires=Wed, 03-Feb-21 06:56:17 GMT; max-age=31536000; path=/; domain=.hao123.com; version=1;",
  "BAIDUID=154B7BF5BF41910A39401568DE2948C7:FG=1; expires=Wed, 03-Feb-21 06:56:27 GMT; max-age=31536000; path=/; domain=.hao123.com; version=1;",
  "BAIDUID=12E85EDB567C23F270F8D60B6F770261:FG=1; expires=Wed, 03-Feb-21 06:56:39 GMT; max-age=31536000; path=/; domain=.hao123.com; version=1;"
];

var cookie = cookiePool[Random().nextInt(cookiePool.length)];

String getVideoCookies(){
  return cookie;
}
