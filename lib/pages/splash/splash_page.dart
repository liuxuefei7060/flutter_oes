import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_oes/pages/login/login_page.dart';

///启动页面
class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  void handleTime() {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        print("启动主页面");
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return LoginPage();
        }));
      });
    });
  }

  @override
  void initState() {
    super.initState();
    print("initState()");
    handleTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
          alignment: Alignment.bottomCenter,
          child: Image.asset("images/splash_background_image.png", fit: BoxFit.contain,),
        ),
        Positioned(
          top: 40,
          right: 20,
          child: RaisedButton(
            color: Colors.lightBlue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            child: Text("跳过", style: TextStyle(color: Colors.white),),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                /*return MainPage(
                  title: "Hello",
                );*/
                return LoginPage();
              }));
            },
          ),
        )
      ],
    ));
  }
}
