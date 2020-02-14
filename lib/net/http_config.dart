const HTTP_CONNECT_TIMEOUT = 8000;
const HTTP_RECEIVE_TIMEOUT = 8000;
// 推荐
const REC_NEWS_API = "https://www.hao123.com/feedData/data?type=rec&app_from=pc_tuijian&rn=20&pn=";
// 体育
const SPORT_NEWS_API = "https://www.hao123.com/feedData/data?type=sports&app_from=pc_tuijian&rn=20&pn=";
// 国内
const GN_NEWS_API = "https://www.hao123.com/feedData/data?type=domestic&app_from=pc_tuijian&rn=20&pn=";
// 国际
const GJ_NEWS_API = "https://www.hao123.com/feedData/data?type=intl&app_from=pc_tuijian&rn=20&pn=";
// 财经
const FINANCE_NEWS_API = "https://www.hao123.com/feedData/data?type=finance&app_from=pc_tuijian&rn=20&pn=";
// 科技
const TECH_NEWS_API = "https://www.hao123.com/feedData/data?type=tech&app_from=pc_tuijian&rn=20&pn=";
// 历史
const HISTORY_NEWS_API = "https://www.hao123.com/feedData/data?type=history&app_from=pc_tuijian&rn=20&pn=";
// 汽车
const CAR_NEWS_API = "https://www.hao123.com/feedData/data?type=cars&app_from=pc_tuijian&rn=20&pn=";
// 教育 分类消息错误
const EDU_NEWS_API = "https://www.hao123.com/feedData/data?type=edu&app_from=pc_tuijian&rn=20&pn=";
// 游戏
const GAME_NEWS_API = "https://www.hao123.com/feedData/data?type=games&app_from=pc_tuijian&rn=20&pn=";
// 房产 分类消息错误
const FANG_NEWS_API = "https://www.hao123.com/feedData/data?type=estate&app_from=pc_tuijian&rn=20&pn=";
// 时尚
const FASHION_NEWS_API = "https://www.hao123.com/feedData/data?type=fashion&app_from=pc_tuijian&rn=20&pn=";
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

// 搞笑视频
const AMUSE_VIDEO_URL = "http://v.baidu.com/channel/short/newamuse?format=json";
// 明星视频
const STAR_VIDEO_URL = "http://v.baidu.com/channel/short/newstar?format=json";
// 影视视频
const BOMB_VIDEO_URL = "http://v.baidu.com/channel/short/newbomb?format=json";


const REFRESH_VIDEO_COUNT = 30;

// 新闻
const NEWS_VIDEO_URL = "https://www.hao123.com/feedData/data?type=video&ctype=video&app_from=pc_tuijian&pn=3&rn=$REFRESH_VIDEO_COUNT";
// 影视
const YINGSHI_VIDEO_URL = "http://www.hao123.com/feedData/haokanfeed?tab=yingshi_new&video_type=1&nums=$REFRESH_VIDEO_COUNT";
// 音乐
const YINYUE_VIDEO_URL = "http://www.hao123.com/feedData/haokanfeed?tab=yinyue_new&video_type=1&nums=$REFRESH_VIDEO_COUNT";
// 动漫
const DONGMAN_VIDEO_URL = "http://www.hao123.com/feedData/haokanfeed?tab=dongman_new&video_type=1&nums=$REFRESH_VIDEO_COUNT";
// 游戏
const YOUXI_VIDEO_URL = "http://www.hao123.com/feedData/haokanfeed?tab=youxi_new&video_type=1&nums=$REFRESH_VIDEO_COUNT";
// 综艺
const ZONGYI_VIDEO_URL = "http://www.hao123.com/feedData/haokanfeed?tab=zongyi_new&video_type=1&nums=$REFRESH_VIDEO_COUNT";
// 文化
const WENHUA_VIDEO_URL = "http://www.hao123.com/feedData/haokanfeed?tab=wenhua_new&video_type=1&nums=$REFRESH_VIDEO_COUNT";
// 美食
const MEISHI_VIDEO_URL = "http://www.hao123.com/feedData/haokanfeed?tab=meishi_new&video_type=1&nums=$REFRESH_VIDEO_COUNT";
// 时尚
const SHISHANG_VIDEO_URL = "http://www.hao123.com/feedData/haokanfeed?tab=shishang_new&video_type=1&nums=$REFRESH_VIDEO_COUNT";
// 搞笑
const GAOXIAO_VIDEO_URL = "http://www.hao123.com/feedData/haokanfeed?tab=gaoxiao_new&video_type=1&nums=$REFRESH_VIDEO_COUNT";
// 宠物
const CHONGWU_VIDEO_URL = "http://www.hao123.com/feedData/haokanfeed?tab=chongwu_new&video_type=1&nums=$REFRESH_VIDEO_COUNT";
// 汽车
const QICHE_VIDEO_URL = "http://www.hao123.com/feedData/haokanfeed?tab=qiche_new&video_type=1&nums=$REFRESH_VIDEO_COUNT";
// 体育
const TIYU_VIDEO_URL = "http://www.hao123.com/feedData/haokanfeed?tab=tiyu_new&video_type=1&nums=$REFRESH_VIDEO_COUNT";


// 热门电视剧
const HOT_TV_URL = "https://movie.douban.com/j/search_subjects?type=tv&tag=热门&page_limit=20&page_start=";
// 最新电影
const NEW_MOVIE_URL="https://movie.douban.com/j/search_subjects?type=movie&tag=最新&page_limit=20&page_start=";

// 热门综艺
const HOT_ENT_URL="https://movie.douban.com/j/new_search_subjects?sort=U&range=0,10&tags=综艺&start=";
// 热门动漫
const HOT_COMIC_URL="https://movie.douban.com/j/new_search_subjects?sort=U&range=0,10&tags=动漫&start=";
// 热门纪录片
const HOT_DOC_URL="https://movie.douban.com/j/new_search_subjects?sort=U&range=0,10&tags=纪录片&start=";
// 热门短片
const HOT_SORT_URL="https://movie.douban.com/j/new_search_subjects?sort=U&range=0,10&tags=短片&start=";


// 图书畅销榜
const TOP_SALE_BOOK = "https://read.douban.com/j/index//charts?type=sales&index=ebook&verbose=1";
// 最新读书榜
const TOP_NEW_BOOK = "https://read.douban.com/j/index//charts?type=newly_published_sales&index=ebook&verbose=1";
// 好评书榜
const TOP_HIGH_RATE_BOOK="https://read.douban.com/j/index//charts?type=highly_rated_sales&index=ebook&verbose=1";
// 套装书榜
const TOP_BUNDLE_BOOK="https://read.douban.com/j/index//charts?type=bundle_sales&index=ebook&verbose=1";
// 长篇推荐票月榜
const TOP_LONG_BOOK="https://read.douban.com/j/index//charts?type=most_voted_column&index=featured&verbose=1";
// 中篇榜
const TOP_MIDDLE_BOOK = "https://read.douban.com/j/index//charts?type=intermediate_finalized&index=featured&verbose=1";


// 电子书地址
const EBOOK_URL = "https://read.douban.com/reader/ebook/";
// 获取图书
const BOOK_URL = "https://read.douban.com/j/kind/";

// 计算机免费书籍
const JSJ_FREE_BOOK_LIST_URL = "https://lib-nuanxin.wqxuetang.com/v1/search/inithomedata?size=10&pn=";
// 免费书籍列表
const FREE_BOOK_LIST_URL = "https://lib-nuanxin.wqxuetang.com/v1/search/initsearch";
// 详细书籍页面
const FREE_BOOK_DETAIL_URL = "https://lib-nuanxin.wqxuetang.com/v1/book/initbook?bid=";
// 相关书籍列表
const FREE_BOOK_RELATED_URL = "https://lib-nuanxin.wqxuetang.com/v1/book/relatedetail?type=1&kw=";

// 新歌速递
const NEW_MUSIC_url = "http://musicapi.leanapp.cn/top/song?type=0";
// 推荐歌单
const REC_PLAYLIST_URL = "http://musicapi.leanapp.cn/personalized?limit=";
// 推荐新音乐
const REC_NEW_MUSIC_URL = "http://musicapi.leanapp.cn/personalized/newsong";
// 推荐电台节目
const REC_DJ_PROGRAM_URL = "http://musicapi.leanapp.cn/personalized/djprogram";
// 推荐电台广播
const REC_DJ_RADIO_URL = "http://musicapi.leanapp.cn/dj/recommend";
// 热门DJ
const HOT_DJ_URL = "http://musicapi.leanapp.cn/dj/hot?limit=30&offset=0";
// 推荐节目
const REC_PROGRAM_URL = "http://musicapi.leanapp.cn/program/recommend";

// 新碟上架
const NEW_ALBUM_URL = "http://musicapi.leanapp.cn/top/album?offset=0&limit=50";

// const NEW_MUSIC = "https://music.jeeas.cn/v1/personalized/newsong?from=music";
// 网友最新歌单
const NEW_PLAYLIST_URL = "http://musicapi.leanapp.cn/top/playlist?limit=100&order=new";
// 网友最新歌单详情
const PLAYLIST_DETAIL_URL = "http://musicapi.leanapp.cn/playlist/detail?id=";
// 音乐搜索
const SEARCH_URL = "http://musicapi.leanapp.cn/search?keywords=";
// 相似 歌曲
const RELATED_SONG = "http://musicapi.leanapp.cn/simi/song?id=347230";
// 具体mp3地址
const MP3_URL = "https://music.163.com/song/media/outer/url?id=";
// 歌词
const LYRICS_URL = "https://music.jeeas.cn/v1/lyric?id=1412242872";
// 歌曲详情
const SONG_DETAIL_URL = "http://musicapi.leanapp.cn/song/detail?ids=347230";
// 相似歌单
const RELATED_PLAYLIST_URL = "http://musicapi.leanapp.cn/simi/playlist?id=347230";
// 相似音乐
const RELATED_SONG_URL = "http://musicapi.leanapp.cn/simi/song?id=347230";
// 私人电台
const PERSONAL_FM_URL = "http://musicapi.leanapp.cn/personal_fm";

// 音乐评论
const MUSIC_COMMENT_URL = "http://musicapi.leanapp.cn/comment/music?id=186016";
// 专辑评论
const ALBUM_COMMENT_URL = "http://musicapi.leanapp.cn/comment/album?id=32311";
// 歌单评论
const PLAYLIST_COMMENT_URL = "http://musicapi.leanapp.cn/comment/playlist?id=705123491";
// MV评论
const MV_COMMENT_URL = "http://musicapi.leanapp.cn/comment/mv?id=5436712";
// DJ评论
const DJ_COMMENT_URL = "http://musicapi.leanapp.cn/comment/dj?id=794062371";



// 专辑内容
const GET_ALBUM_URL = "http://musicapi.leanapp.cn/album?id=";
// 获得歌手单曲
const ARTIST_SONG_URL = "http://musicapi.leanapp.cn/artists?id=";
// 获得歌手专辑
const ARTIST_ALBUM_URL = "http://musicapi.leanapp.cn/artist/album?id=";
// 获得歌手描述
const ARTIST_DESC_URL = "http://musicapi.leanapp.cn/artist/desc?id=";

// 歌手列表
// 入驻歌手 5001  华语男歌手 1001  华语女歌手 1002  华语组合/乐队 1003
// 欧美男歌手 2001 欧美女歌手 2002  欧美组合/乐队 2003   日本男歌手 6001  日本女歌手 6002  日本组合/乐队 6003
// 韩国男歌手 7001  韩国女歌手 7002  韩国组合/乐队 7003  其他男歌手 4001  其他女歌手 4002  其他组合/乐队 4003
const ARTIST_URL = "http://musicapi.leanapp.cn/artist/list?cat=";
// 热门歌手
const HOT_ARTIST_URL = "http://musicapi.leanapp.cn/top/artists";
// 榜单  "0": 云音乐新歌榜, "1": 云音乐热歌榜, "4": 云音乐电音榜, "5": UK排行榜周榜, "6": 美国Billboard周榜
// "7": KTV嗨榜, "8": iTunes榜, "9": Hit FM Top榜,  "23": 云音乐说唱榜  "17": 华语金曲榜,
const  TOP_SONG_URL = "http://musicapi.leanapp.cn/top/list?idx=";

// 获取歌手 mv
const ARTIST_MV_URL = "http://musicapi.leanapp.cn/artist/mv?limit=100&id=";
// 最新mv
const NEW_MV_URL= "http://musicapi.leanapp.cn/mv/first?limit=50";
// 推荐mv
const REC_MV_URL = "http://musicapi.leanapp.cn/personalized/mv";
// 相似 mv
const RELATED_MV_URL = "http://musicapi.leanapp.cn/simi/mv?mvid=";
// mv详情
const MV_DETAIL_URL = "http://musicapi.leanapp.cn/mv/detail?mvid=";
// mv排行
const TOP_MV_URL = "http://musicapi.leanapp.cn/top/mv?limit=10";
// 电影解析 https://api.bingdou.net/?url=
// https://vip.116kan.com/?url= https://www.leflv.com/vip/?url=
const FREE_MOVIE_PARSE_URL = "https://vip.116kan.com/?url=";
// 电影列表
const FREE_MOVIE_LIST_URL = "https://pcw-api.iqiyi.com/search/video/videolists?access_play_control_platform=1&channel_id=1&pageSize=18&pageNum=";

















