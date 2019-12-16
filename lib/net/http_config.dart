const HTTP_CONNECT_TIMEOUT = 5000;
const HTTP_RECEIVE_TIMEOUT = 3000;

const NEWS_API = "https://www.hao123.com/feedData/data?type=rec&app_from=pc_tuijian&rn=20&pn=2";
 //   "http://c.m.163.com/nc/article/headline/T1348647853363/0-10.html";
// 聚合新闻api http://v.juhe.cn/toutiao/index?type=top&key=3dc86b09a2ee2477a5baa80ee70fcdf5
// https://www.hao123.com/feedData/data?callback=jQuery18206683182829139738_1576235945849&type=rec&app_from=pc_tuijian&rn=10&pn=2

const VIDEO_API = "https://www.hao123.com/feedData/data?rn=20&pn=3&type=video&ctype=video&app_from=pc_tuijian";

//即将上映
const COMMING_SOON_MOVIE = "https://douban.uieee.com/v2/movie/coming_soon";
//正在上映
const THEATERS_MOVIE = "https://douban.uieee.com/v2/movie/in_theaters";
//北美票房榜
const US_MOVIE = "https://douban.uieee.com/v2/movie/us_box";
// 文学
const LIFE_BOOK = "https://douban.uieee.com/v2/book/search?q='文学'&start=0&count=20";
// 技术
const TECH_BOOK = "https://douban.uieee.com/v2/book/search?q='编程'&start=0&count=20";
// 音乐
const NEW_MUSIC = "http://musicapi.leanapp.cn/personalized/newsong";
// const NEW_MUSIC = "https://music.jeeas.cn/v1/personalized/newsong?from=music";