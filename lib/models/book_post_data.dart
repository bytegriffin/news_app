const BOOK_POST_QUERY_DATA = "\n    query getFilterWorksList(\$works_ids: [ID!]) {\n      worksList(worksIds: \$works_ids) {\n        \n    \n    title\n    cover\n    url\n    isBundle\n    isOrigin\n    vip {\n      canRead\n    }\n    limitedVip {\n      canRead\n      isActive\n    }\n    promotion {\n      endTime\n    }\n    isRebate\n    fixedPrice\n    salesPrice\n  \n    \n    url\n    title\n  \n    \n    author {\n      name\n      url\n    }\n    origAuthor {\n      name\n      url\n    }\n    translator {\n      name\n      url\n    }\n  \n    \n    abstract\n    editorHighlight\n  \n    \n    isOrigin\n    kinds {\n      \n    name @skip(if: true)\n    shortName @include(if: true)\n    id\n  \n    }\n    ... on WorksBase @include(if: true) {\n      wordCount\n      wordCountUnit\n    }\n    ... on WorksBase @include(if: false) {\n      \n    isEssay\n    \n    ... on EssayWorks {\n      favorCount\n    }\n  \n    \n    isNew\n    \n    averageRating\n    ratingCount\n    url\n  \n  \n  \n    }\n    ... on WorksBase @include(if: true) {\n      isColumn\n      isEssay\n      onSaleTime\n      ... on ColumnWorks {\n        updateTime\n      }\n    }\n    ... on WorksBase @include(if: true) {\n      isColumn\n      ... on ColumnWorks {\n        isFinished\n      }\n    }\n    ... on EssayWorks {\n      essayActivityData {\n        \n    title\n    uri\n    tag {\n      name\n      color\n      background\n      icon2x\n      icon3x\n      iconSize {\n        height\n      }\n      iconPosition {\n        x y\n      }\n    }\n  \n      }\n    }\n    highlightTags {\n      name\n    }\n  \n    isInLibrary\n    ... on WorksBase @include(if: false) {\n      \n    fixedPrice\n    salesPrice\n    isRebate\n  \n    }\n    ... on EbookWorks {\n      \n    fixedPrice\n    salesPrice\n    isRebate\n  \n    }\n    ... on WorksBase @include(if: true) {\n      ... on EbookWorks {\n        id\n        isPurchased\n        isInWishlist\n      }\n    }\n  \n        id\n        isOrigin\n      }\n    }\n  ";

enum BookType {
  WenXue,
  JiSuanJi,
  JingJiGuanLi,
  ZaZhi,
  JiaoYuKaoShi,
  ManHuaHuiBen,
  YiShuSheJi,
  ReMenYingWen
}

class BookPostData{
  String query = BOOK_POST_QUERY_DATA;
  String variables;
  BookType bookType;
}

Map<String,dynamic> getBookPostJsonData(BookType type,int pageNum){
  switch(type){
    case BookType.WenXue:
      return WXBookPostData(pageNum).toJson();
    case BookType.JiSuanJi:
      return JSJBookPostData(pageNum).toJson();
    case BookType.JingJiGuanLi:
      return JJGLBookPostData(pageNum).toJson();
    case BookType.JingJiGuanLi:
      return JJGLBookPostData(pageNum).toJson();
    case BookType.ZaZhi:
      return ZZBookPostData(pageNum).toJson();
    case BookType.JiaoYuKaoShi:
      return JYKSBookPostData(pageNum).toJson();
    case BookType.ManHuaHuiBen:
      return MHHBBookPostData(pageNum).toJson();
    case BookType.YiShuSheJi:
      return YSSJBookPostData(pageNum).toJson();
    case BookType.ReMenYingWen:
      return RMYWBookPostData(pageNum).toJson();
    default:
      return null;
  }
}
// 文学
class WXBookPostData extends BookPostData{
  int page;
  BookType bookType = BookType.WenXue;
  WXBookPostData(this.page);

  Map<String, dynamic> toJson() {
    return {
      "sort": "new",
      "page": page,
      "kind": 101,
      "query": query,
      "variables": {},
    };
  }
}
// 计算机与互联网
class JSJBookPostData extends BookPostData{
  int page;
  BookType bookType = BookType.WenXue;
  JSJBookPostData(this.page);

  Map<String, dynamic> toJson() {
    return {
      "sort": "new",
      "page": page,
      "kind": 105,
      "query": query,
      "variables": {},
    };
  }
}

// 经济管理
class JJGLBookPostData extends BookPostData{
  int page;
  BookType bookType = BookType.WenXue;
  JJGLBookPostData(this.page);

  Map<String, dynamic> toJson() {
    return {
      "sort": "new",
      "page": page,
      "kind": 103,
      "query": query,
      "variables": {},
    };
  }
}

// 杂志
class ZZBookPostData extends BookPostData{
  int page;
  BookType bookType = BookType.WenXue;
  ZZBookPostData(this.page);

  Map<String, dynamic> toJson() {
    return {
      "sort": "new",
      "page": page,
      "kind": 2,
      "query": query,
      "variables": {},
    };
  }
}
// 教育考试
class JYKSBookPostData extends BookPostData{
  int page;
  BookType bookType = BookType.WenXue;
  JYKSBookPostData(this.page);

  Map<String, dynamic> toJson() {
    return {
      "sort": "new",
      "page": page,
      "kind": 111,
      "query": query,
      "variables": {},
    };
  }
}

// 漫画绘本
class MHHBBookPostData extends BookPostData{
  int page;
  BookType bookType = BookType.WenXue;
  MHHBBookPostData(this.page);

  Map<String, dynamic> toJson() {
    return {
      "sort": "new",
      "page": page,
      "kind": 110,
      "query": query,
      "variables": {},
    };
  }
}

// 艺术设计
class YSSJBookPostData extends BookPostData{
  int page;
  BookType bookType = BookType.WenXue;
  YSSJBookPostData(this.page);

  Map<String, dynamic> toJson() {
    return {
      "sort": "new",
      "page": page,
      "kind": 109,
      "query": query,
      "variables": {},
    };
  }
}

// 热门英文
class RMYWBookPostData extends BookPostData{
  int page;
  BookType bookType = BookType.WenXue;
  RMYWBookPostData(this.page);

  Map<String, dynamic> toJson() {
    return {
      "sort": "hot",
      "page": page,
      "kind": 300,
      "query": query,
      "variables": {},
    };
  }
}