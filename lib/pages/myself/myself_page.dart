import 'package:flutter/material.dart';

class MyselfPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyselfPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("个人中心"),
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.blue,
              width: double.infinity,
              height: 100.0,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 160,
                    width: double.infinity,
                    child: Card(
                        color: Colors.blue,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(6.0))),
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: <Widget>[
                            Positioned(
                                left: 20,
                                child: ClipOval(
                                    child: Container(
                                  padding: EdgeInsets.all(1),
                                  color: Colors.white,
                                  child: Image.asset(
                                    "images/ic_user.png",
                                    fit: BoxFit.cover,
                                    width: 66.0,
                                    height: 66,
                                  ),
                                ))),
                            Positioned(
                              left: 120,
                              top: 50,
                              child: Text(
                                "过得去",
                                style: TextStyle(
                                    fontSize: 22, color: Colors.white),
                              ),
                            ),
                            Positioned(
                              left: 100,
                              bottom: 20,
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 20, top: 10, bottom: 10),
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    gradient: LinearGradient(colors: [
                                      Colors.red[300],
                                      Colors.red[500]
                                    ]),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        bottomLeft: Radius.circular(25)),
                                    color: Colors.red[400]),
                                child: Text(
                                  "精神病科室精神病科室精神病科室精神病科室精神病科室",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      width: double.infinity,
                      child: Card(
                        elevation: 10,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 25),
                              child: Image.asset(
                                "images/ic_hospital_set_of_book.png",
                                width: 30,
                                height: 30,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 8, top: 20, bottom: 20),
                                child: Text(
                                  "账套选择",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 25),
                              child: Image.asset(
                                "images/ic_next.png",
                                width: 30,
                                height: 30,
                              ),
                            )
                          ],
                        ),
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 6),
                      width: double.infinity,
                      child: Card(
                        elevation: 10,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 25),
                              child: Image.asset(
                                "images/ic_settings.png",
                                width: 30,
                                height: 30,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 8, top: 20, bottom: 20),
                                child: Text(
                                  "设置",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 25),
                              child: Image.asset(
                                "images/ic_next.png",
                                width: 30,
                                height: 30,
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
