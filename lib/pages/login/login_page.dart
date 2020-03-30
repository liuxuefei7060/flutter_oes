import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_oes/api/api.dart';
import 'package:flutter_oes/pages/dialog/loading_dialog.dart';
import 'package:flutter_oes/pages/main/main_page.dart';
import 'package:flutter_oes/utils/base_entity.dart';
import 'package:flutter_oes/utils/net_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'auth_info_entity.dart';
import 'login_entity.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return new _LoginState();
  }
}

class _LoginState extends State<LoginPage> {
  var _isShowPassWord = true;

  ///选择医院
  var _isShowSelectHospital = true;

  FocusNode blankNode = FocusNode();

  var _nameController = TextEditingController();
  var _pwdController = TextEditingController();

  List<AuthInfoEntity> authInfoList;
  AuthInfoEntity mAuthInfoSelected;

  ///获取云平台验证信息
  void cloudAuthorizedInfo() {
    String name = _nameController.text;
    String pwd = _pwdController.text;

    showLoadingDialog();
    //云平台验证输入用户名cloudAuthorizedInfo
    var params = {"userName": name};
    NetUtils.get(Api.authorizedInfo, params: params, success: (response) {
      closeLoadingDialog();
      BaseEntity result = BaseEntity.fromJson(json.decode(response));
      var list = BaseListEntity<AuthInfoEntity>.fromJson(json.decode(response))
          .resultList;
      if (result.status == 0) {
        if (list != null) {
          print("长度 ${list.length}");
          if (list.length == 0) {
            //没有查看对应的数据，就是没有绑定账号
            loginFailureByNoAuth(result.message);
          } else if (list.length == 1) {
            //只返回一条数据，可以直接登录
            loginOesServer(list[0]);
          } else {
            //让用户去自主选择一个服务器连接
            authInfoList = list;
            hasMultiItems(list);
          }
        } else {
          Fluttertoast.showToast(
              msg: "服务器接口错误", toastLength: Toast.LENGTH_SHORT);
        }
      }
    }, fail: (exception) {
      closeLoadingDialog();
      print("请求失败");
    });

/*    String url = "http://10.10.220.61:8777/OES/webservices/login";
    var params = {"account": name, "password": pwd, "loginType": 0};
    NetUtils.post(url, params, success: (response) {

      Navigator.pop(context);
//      BaseEntity<LoginEntity> loginEntity = BaseEntity<LoginEntity>.fromJson(response);
      LoginEntity loginEntity = LoginEntity.fromJson(json.decode(response));
      if(loginEntity.status == 0) {
        Fluttertoast.showToast(msg: loginEntity.result.account, toastLength: Toast.LENGTH_SHORT);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MainPage(
            title: "首页",
          );
        }));
      } else {
        Fluttertoast.showToast(msg: loginEntity.message, toastLength: Toast.LENGTH_SHORT);
      }


    }, fail: (exception) {
      Navigator.pop(context);
      print("请求失败");
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // 点击空白页面关闭键盘
          FocusScope.of(context).requestFocus(blankNode);
        },
        child: createBody(),
      ),
    );
  }

  ///创建页面的body
  Widget createBody() {
    return SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
              minWidth: double.infinity,
              minHeight: MediaQuery
                  .of(context)
                  .size
                  .height),
          decoration: BoxDecoration(
              image: new DecorationImage(
                  image: ExactAssetImage("images/bc_login.png"))),
          child: Stack(alignment: Alignment.center, children: <Widget>[
            Positioned(
              top: 50,
              left: 30,
              child: Text(
                "登录",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2),
              ),
            ),
            Positioned(
              bottom: 20,
              child: Row(
                children: <Widget>[
                  FlatButton(
                    textColor: Colors.lightBlue,
                    onPressed: () {},
                    child: Text("认证平台账号"),
                  ),
                  Text("|", style: TextStyle(color: Colors.lightBlue)),
                  FlatButton(
                      textColor: Colors.lightBlue,
                      onPressed: () {},
                      child: Text("外网不可用")),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                    decoration: BoxDecoration(
                        boxShadow: [
                          //阴影
                          BoxShadow(
                              color: Colors.grey[300],
                              offset: Offset(10.0, 10.0),
                              blurRadius: 4.0)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        border: Border(
                            top: BorderSide(
                                color: Colors.grey[300], width: 1.0),
                            left: BorderSide(
                                color: Colors.grey[300], width: 1.0),
                            right: BorderSide(
                                color: Colors.grey[300], width: 1.0),
                            bottom:
                            BorderSide(color: Colors.grey[300], width: 1.0))),
                    child: TextField(
                      maxLines: 1,
                      autofocus: false,
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: "用户名/院内账号/员工编号",
                        border: InputBorder.none,
                        counter: null,
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.blue,
                        ),
                      ),
                      textInputAction: TextInputAction.go,
                    )),
                Container(
                    margin: EdgeInsets.fromLTRB(40, 20, 40, 0),
                    decoration: BoxDecoration(
                        boxShadow: [
                          //阴影
                          BoxShadow(
                              color: Colors.grey[300],
                              offset: Offset(10.0, 10.0),
                              blurRadius: 4.0)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        border: Border(
                            top: BorderSide(
                                color: Colors.grey[300], width: 1.0),
                            left: BorderSide(
                                color: Colors.grey[300], width: 1.0),
                            right: BorderSide(
                                color: Colors.grey[300], width: 1.0),
                            bottom:
                            BorderSide(color: Colors.grey[300], width: 1.0))),
                    child: TextField(
                      maxLines: 1,
                      autofocus: false,
                      controller: _pwdController,
                      keyboardType: TextInputType.text,
                      obscureText: _isShowPassWord,
                      decoration: InputDecoration(
                          hintText: "请输入密码",
                          border: InputBorder.none,
                          counter: null,
                          prefixIcon: new Icon(
                            Icons.lock,
                            color: Colors.blue,
                          ),
                          suffixIcon: new IconButton(
                            icon: new Icon(
                              Icons.remove_red_eye,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _isShowPassWord = !_isShowPassWord;
                              });
                            },
                          )),
                      textInputAction: TextInputAction.go,
                    )),
                Offstage(
                  offstage: _isShowSelectHospital,
                  child: Container(
                      margin: EdgeInsets.fromLTRB(40, 20, 40, 20),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          boxShadow: [
                            //阴影
                            BoxShadow(
                                color: Colors.grey[300],
                                offset: Offset(10.0, 10.0),
                                blurRadius: 4.0)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          border: Border(
                              top: BorderSide(
                                  color: Colors.grey[300], width: 1.0),
                              left: BorderSide(
                                  color: Colors.grey[300], width: 1.0),
                              right:
                              BorderSide(color: Colors.grey[300], width: 1.0),
                              bottom:
                              BorderSide(color: Colors.grey[300], width: 1.0))),
                      child: GestureDetector(
                          onTap: showBottomSheet,
                          child: Row(
                            children: <Widget>[
                              new Icon(
                                Icons.local_hospital,
                                color: Colors.blue,
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      mAuthInfoSelected == null
                                          ? "请选择医院"
                                          : mAuthInfoSelected.name,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )),
                              new Icon(
                                Icons.navigate_next,
                                color: Colors.grey,
                              )
                            ],
                          ))),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(40, 30, 40, 50),
                    width: double.infinity,
                    child: FlatButton(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0)),
                      color: Colors.blue,
                      onPressed: () {
                        //恢复选择医院显示状态的默认值
                        _isShowSelectHospital = true;
                        cloudAuthorizedInfo();
                      },
                      child: Text(
                        '登  录',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    )),
              ],
            )
          ]),
        ));
  }

  void checkLoginBtnAble() {
    String name = _nameController.text;
    String pwd = _pwdController.text;
    if (name == null || name.length == 0 || pwd == null ||
        pwd.length == 0) {} else {}
  }

  ///失败失败，因为没有认证
  void loginFailureByNoAuth(String message) {
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT);
  }

  ///有多个可选医院的情况
  void hasMultiItems(List<AuthInfoEntity> list) {
    setState(() {
      _isShowSelectHospital = !_isShowSelectHospital;
    });
  }

  showBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return new Container(
            height: 300.0,
            child: ListView.builder(
                itemCount: authInfoList == null ? 0 : authInfoList.length,
                padding: const EdgeInsets.all(12),
                itemBuilder: (context, i) {
                  return new ListTile(
                    onTap: () {
                      setState(() {
                        mAuthInfoSelected = authInfoList[i];
                        Api.setOesBaseUrl(mAuthInfoSelected.ipAddress);
                        loginOesServer(mAuthInfoSelected);
                      });
                      Navigator.of(context).pop();
                    },
                    title: Text(
                      authInfoList[i].name,
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                }),
          );
        });
  }

  ///登录Oes服务器
  void loginOesServer(AuthInfoEntity authInfoEntity) {
    String name = _nameController.text;
    String pwd = _pwdController.text;

    var params = {
      "account": authInfoEntity.userName,
      "password": pwd,
      "loginType": 0
    };



    NetUtils.post(Api.login, params, success: (response) {
      Navigator.pop(context);
      BaseEntity<LoginEntity> loginEntity = BaseEntity<LoginEntity>.fromJson(
          json.decode(response));

      if (loginEntity.status == 0) {
        Fluttertoast.showToast(
            msg: loginEntity.result.account, toastLength: Toast.LENGTH_SHORT);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MainPage(
            title: "首页",
          );
        }));
      } else {
        Fluttertoast.showToast(
            msg: loginEntity.message, toastLength: Toast.LENGTH_SHORT);
      }
    }, fail: (exception) {
      Navigator.pop(context);
      print("请求失败");
    });
  }

  void showLoadingDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return new LoadingDialog(
            outsideDismiss: false,
          );
        });
  }

  void closeLoadingDialog() {
    Navigator.pop(context);
  }
}
