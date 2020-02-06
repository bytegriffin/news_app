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


List<String> hkVideoCookiePool = [
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

var hkVideoCookie = hkVideoCookiePool[Random().nextInt(hkVideoCookiePool.length)];

String getVideoCookies(){
  return hkVideoCookie;
}
// 文泉测试账号 17134025332/asdf123
var freeBookCookie = "_gid=356938408658; _gidv=e6f6ccd30c056b42967bf5e78ff5cd53; acw_tc=b65cfd3215809536889641194e0be082a447f9df75fdf9b4192cb2878cceaf; PHPSESSID=99m8i4qlpck7ufgga3ojnjbbb3; Hm_lvt_a84b27ffd87daa3273555205ef60df89=1580953700,1580954074,1580957403,1580958007; Hm_lpvt_a84b27ffd87daa3273555205ef60df89=1580960579; ssxmod_itna=QqGxciD=GQit=0KGHoiQRfxGqozDyAa=nix6Gx0HIeGzDAxn40iDtoPv0o6ijGAgT3eq077DmW8GmYa4eE/j7r34a2Yx0aDbqGkqiEr4GGfxBYDQxAYDGDDPDocPD1D3qDkUxYPGW7qDoDY+=uDitD4qDBzOdDKqGg7dxYYGD94CL4LL2gKY03fG=DjMrD/RGb6QrTrpD/b2QDzdFDtMUS7TUKx0Pz88hemGDzekGWFA+NlEx=Bij3fnGoyDo3lODAPx+bUYBdfDDAG/+hLiD===; ssxmod_itna2=QqGxciD=GQit=0KGHoiQRfxGqozDyAa=nix6DnK8cRG25DssQDLCtTLEpA=qNik0vPniDL4=FoVDgY=D6GQwTYo8ikxeYeCUx49K8/pni+ptuijbTGmUt7iTua8AtK2PenmjE8YKBqK4AExE+O039k=xTSfQB8iq/82vWQwDrlqDLYKDkoT7/8hRbbQmRkR7z8UkjEEvWqdUYbw=T0D7IdxGBnEYQux2Ke+ZSOQLiR37+RI438x27Ux4t6PKd0j4GmIeYDXzE1NBmoEUqeo=G02KbGrttaxKOa/uugjT2QEKy+rIH7hNQG/EYhxpgA3+j3RjQmA0zxdA7YK4pNeYIgiac0qUjeUEIQYQ9NMnNED0pxAge63UEAaxeopK0ie=EPYTjAI3jjZQfmmuvlI3/iD=Do4rvcLYa2xnUx=DP1A+nnCtjC0ALeTe=RHzKe=XOzKI=4UbA2/nofANbwHR0e7IxpGi003K984due974LgRdx4dGDfAlpO8TDVH0+mhP6j6iPfKUWxzerOcDoZqDZeeYLslpvC+RZwK8DcGLxnrz1vg4yuDiA7DEn5tMSasptv37BGYS6DxvCkFAr2HNKQvqWDG2B4DFqD+rDxD";
