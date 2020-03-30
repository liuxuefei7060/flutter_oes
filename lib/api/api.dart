///API接口

class Api {
  static final Map<int, String> category = {
    0: "图文",
    1: "阅读",
    2: "连载",
    3: "问答",
    4: "音乐",
    5: "影视",
    8: "电台",
  };
  static final Map<int, String> categoryEn = {
    0: "hp",
    1: "essay",
    2: "serialcontent",
    3: "question",
    4: "music",
    5: "movie",
    8: "radio",
  };

  ///云平台服务器地址
  static final String _cloudServerBaseUrl = "http://10.10.231.11:8099/public";
  ///oes服务器地址
  static String oesServerBaseUrl = "";

  static setOesBaseUrl(String url) {
    if(url != null) {
      if(url.endsWith("/")) {
        oesServerBaseUrl = url;
      }
      oesServerBaseUrl = "$url/";

    }
  }

  ///云平台验证用户名
  static final String authorizedInfo = "$_cloudServerBaseUrl/authorizedInfo";


  static final String login = "$oesServerBaseUrl/webservices/login";

}
