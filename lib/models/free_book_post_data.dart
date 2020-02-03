
enum FreeBookType {
  MaLieZhuYi,
  ZheXueZongJiao,
  SheHuiKeXue,
  ZhengzhiFaLv
}

class FreeBookPostData{
  int size = 10;
  int type = 0;
  FreeBookType bookType;
}

// 马列主义
class MLBookPostData extends FreeBookPostData{
  int pn;
  String cnclass = "A";
  FreeBookType bookType = FreeBookType.MaLieZhuYi;
  MLBookPostData(this.pn);

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "size": size,
      "cnclass": cnclass,
      "pn": pn,
    };
  }
}

// 哲学与宗教
class ZXZJBookPostData extends FreeBookPostData{
  int pn;
  String cnclass = "B";
  FreeBookType bookType = FreeBookType.ZheXueZongJiao;
  ZXZJBookPostData(this.pn);

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "size": size,
      "cnclass": cnclass,
      "pn": pn,
    };
  }
}

// 社会科学
class SKBookPostData extends FreeBookPostData{
  int pn;
  String cnclass = "C";
  FreeBookType bookType = FreeBookType.SheHuiKeXue;
  SKBookPostData(this.pn);

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "size": size,
      "cnclass": cnclass,
      "pn": pn,
    };
  }
}

// 政治与法律
class ZFBookPostData extends FreeBookPostData{
  int pn;
  String cnclass = "D";
  FreeBookType bookType = FreeBookType.ZhengzhiFaLv;
  ZFBookPostData(this.pn);

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "size": size,
      "cnclass": cnclass,
      "pn": pn,
    };
  }
}

// 军事
class JSBookPostData extends FreeBookPostData{
  int pn;
  String cnclass = "E";
  FreeBookType bookType = FreeBookType.ZhengzhiFaLv;
  JSBookPostData(this.pn);

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "size": size,
      "cnclass": cnclass,
      "pn": pn,
    };
  }
}

// 经济
class JJBookPostData extends FreeBookPostData{
  int pn;
  String cnclass = "F";
  FreeBookType bookType = FreeBookType.ZhengzhiFaLv;
  JJBookPostData(this.pn);

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "size": size,
      "cnclass": cnclass,
      "pn": pn,
    };
  }
}

// 文化
class WHBookPostData extends FreeBookPostData{
  int pn;
  String cnclass = "G";
  FreeBookType bookType = FreeBookType.ZhengzhiFaLv;
  WHBookPostData(this.pn);

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "size": size,
      "cnclass": cnclass,
      "pn": pn,
    };
  }
}

// 语言
class YYBookPostData extends FreeBookPostData{
  int pn;
  String cnclass = "H";
  FreeBookType bookType = FreeBookType.ZhengzhiFaLv;
  YYBookPostData(this.pn);

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "size": size,
      "cnclass": cnclass,
      "pn": pn,
    };
  }
}

// 语言
class YSBookPostData extends FreeBookPostData{
  int pn;
  String cnclass = "J";
  FreeBookType bookType = FreeBookType.ZhengzhiFaLv;
  YSBookPostData(this.pn);

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "size": size,
      "cnclass": cnclass,
      "pn": pn,
    };
  }
}

// 历史
class LSBookPostData extends FreeBookPostData{
  int pn;
  String cnclass = "K";
  FreeBookType bookType = FreeBookType.ZhengzhiFaLv;
  LSBookPostData(this.pn);

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "size": size,
      "cnclass": cnclass,
      "pn": pn,
    };
  }
}

// 历史
class ZRBookPostData extends FreeBookPostData{
  int pn;
  String cnclass = "N";
  FreeBookType bookType = FreeBookType.ZhengzhiFaLv;
  ZRBookPostData(this.pn);

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "size": size,
      "cnclass": cnclass,
      "pn": pn,
    };
  }
}

// 数理化
class SLHBookPostData extends FreeBookPostData{
  int pn;
  String cnclass = "O";
  FreeBookType bookType = FreeBookType.ZhengzhiFaLv;
  SLHBookPostData(this.pn);

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "size": size,
      "cnclass": cnclass,
      "pn": pn,
    };
  }
}

// 天文
class TWBookPostData extends FreeBookPostData{
  int pn;
  String cnclass = "P";
  FreeBookType bookType = FreeBookType.ZhengzhiFaLv;
  TWBookPostData(this.pn);

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "size": size,
      "cnclass": cnclass,
      "pn": pn,
    };
  }
}

// 生物科技
class SWBookPostData extends FreeBookPostData{
  int pn;
  String cnclass = "Q";
  FreeBookType bookType = FreeBookType.ZhengzhiFaLv;
  SWBookPostData(this.pn);

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "size": size,
      "cnclass": cnclass,
      "pn": pn,
    };
  }
}

// 医药卫生
class YYWSBookPostData extends FreeBookPostData{
  int pn;
  String cnclass = "R";
  FreeBookType bookType = FreeBookType.ZhengzhiFaLv;
  YYWSBookPostData(this.pn);

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "size": size,
      "cnclass": cnclass,
      "pn": pn,
    };
  }
}

// 农业
class NYBookPostData extends FreeBookPostData{
  int pn;
  String cnclass = "S";
  FreeBookType bookType = FreeBookType.ZhengzhiFaLv;
  NYBookPostData(this.pn);

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "size": size,
      "cnclass": cnclass,
      "pn": pn,
    };
  }
}

// 工业
class GYBookPostData extends FreeBookPostData{
  int pn;
  String cnclass = "T";
  FreeBookType bookType = FreeBookType.ZhengzhiFaLv;
  GYBookPostData(this.pn);

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "size": size,
      "cnclass": cnclass,
      "pn": pn,
    };
  }
}

// 交通
class JTBookPostData extends FreeBookPostData{
  int pn;
  String cnclass = "U";
  FreeBookType bookType = FreeBookType.ZhengzhiFaLv;
  JTBookPostData(this.pn);

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "size": size,
      "cnclass": cnclass,
      "pn": pn,
    };
  }
}

// 航空
class HKBookPostData extends FreeBookPostData{
  int pn;
  String cnclass = "V";
  FreeBookType bookType = FreeBookType.ZhengzhiFaLv;
  HKBookPostData(this.pn);

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "size": size,
      "cnclass": cnclass,
      "pn": pn,
    };
  }
}

// 环境
class HJBookPostData extends FreeBookPostData{
  int pn;
  String cnclass = "X";
  FreeBookType bookType = FreeBookType.ZhengzhiFaLv;
  HJBookPostData(this.pn);

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "size": size,
      "cnclass": cnclass,
      "pn": pn,
    };
  }
}
















