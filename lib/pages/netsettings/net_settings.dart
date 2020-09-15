import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

///网络配置，设置网络的ip，端口，路径，
///在ip那里可以直接设置域名
class NetSettingsPage extends StatefulWidget {
  @override
  _NetSettingsPageState createState() => _NetSettingsPageState();
}

class _NetSettingsPageState extends State<NetSettingsPage> {
  bool _checkboxHttp = true;
  bool _checkboxHttps = false;
  bool _checkboxAccount = true; //账号登录
  bool _checkboxEmploy = false; //员工登录
  FocusNode _blankNode = FocusNode();
  var _ipController = TextEditingController();
  var _porController = TextEditingController();
  var _pathController = TextEditingController();

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<int> _counter;
  Future<String> _ip;
  Future<String> _port;
  Future<String> _path;

  var _titleStyle = TextStyle(fontSize: 16, color: Colors.black54);
  var _inputDecoration = new InputDecoration(border: InputBorder.none);

  @override
  void initState() {
    super.initState();
    _counter = _prefs.then((SharedPreferences prefs) {
      return (prefs.getInt('counter') ?? 0);
    }).then((value) {
      print(value);
      return value;
    });
    _ip = _prefs.then((SharedPreferences prefs) {
      return (prefs.getString('key_ip') ?? "请输入");
    }).then((value) {
      print(value);
      return value;
    });

    _port = _prefs.then((SharedPreferences prefs) {
      return (prefs.getString('key_ip') ?? "请输入");
    }).then((value) {
      print(value);
      return value;
    });
    _path = _prefs.then((SharedPreferences prefs) {
      return (prefs.getString('key_ip') ?? "请输入");
    }).then((value) {
      print(value);
      return value;
    });
  }

  Widget _getDivider() {
    return Divider(
      height: 1,
      color: Colors.blueGrey,
    );
  }

  Widget createBody() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text(
                    "登录类型",
                    style: _titleStyle,
                  ),
                  width: 100,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _checkboxAccount = true;
                      _checkboxEmploy = false;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(
                            color:
                                _checkboxAccount ? Colors.blue : Colors.grey),
                        borderRadius: BorderRadius.circular(4.0)),
                    padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                    child: Text(
                      "账号登录",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _checkboxAccount = false;
                      _checkboxEmploy = true;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(
                            color: _checkboxEmploy ? Colors.blue : Colors.grey),
                        borderRadius: BorderRadius.circular(4.0)),
                    padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                    child: Text(
                      "员工登录",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                )
              ],
            ),
          ),
          _getDivider(),
          Container(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text(
                      "网络协议",
                      style: _titleStyle,
                    ),
                    width: 100,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _checkboxHttps = false;
                        _checkboxHttp = true;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(
                              color: _checkboxHttp ? Colors.blue : Colors.grey),
                          borderRadius: BorderRadius.circular(4.0)),
                      padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                      child: Text(
                        "http",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _checkboxHttps = true;
                        _checkboxHttp = false;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(
                              color:
                                  _checkboxHttps ? Colors.blue : Colors.grey),
                          borderRadius: BorderRadius.circular(4.0)),
                      padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                      child: Text(
                        "https",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  )
                ],
              )),
          _getDivider(),
          Container(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Row(children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text(
                    "IP地址",
                    style: _titleStyle,
                  ),
                  width: 100,
                ),
                Expanded(
                    child: TextField(
                  decoration: _inputDecoration,
                  controller: _ipController,
                ))
              ])),
          _getDivider(),
          Container(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Row(children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text(
                    "端口号",
                    style: _titleStyle,
                  ),
                  width: 100,
                ),
                Expanded(
                    child: TextField(
                  decoration: _inputDecoration,
                  controller: _porController,
                ))
              ])),
          _getDivider(),
          Container(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Row(children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text(
                    "根目录",
                    style: _titleStyle,
                  ),
                  width: 100,
                ),
                Expanded(
                    child: FutureBuilder(
                  future: _path,
                  builder: (context, snapshot) {
                    _pathController.text = snapshot.data;
                    return TextField(
                      maxLines: 1,
                      decoration: new InputDecoration(
                          border: InputBorder.none),
                      controller: _pathController,
                    );
                  },
                ))
              ])),
          _getDivider(),
          FutureBuilder<int>(
            future: _counter,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const CircularProgressIndicator();
                default:
                  if (snapshot.hasError) {
                    return Text(
                        'Error: 出错啦 ${snapshot.data} ${snapshot.error}');
                  } else {
                    return Text(
                      'Button tapped ${snapshot.data} time${snapshot.data == 1 ? '' : 's'}.\n\n'
                      'This should persist across restarts.',
                    );
                  }
              }
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("局域网登录设置"),
        ),
        body: GestureDetector(
            onTap: () {
              // 点击空白页面关闭键盘
              FocusScope.of(context).requestFocus(_blankNode);
            },
            child: createBody()));
  }
}
