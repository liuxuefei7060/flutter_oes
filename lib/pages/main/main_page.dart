import 'package:flutter/material.dart';
import 'package:flutter_oes/pages/contacts/contacts_page.dart';
import 'package:flutter_oes/pages/home/home_page.dart';
import 'package:flutter_oes/pages/hospitalconsole/hospital_console_page.dart';
import 'package:flutter_oes/pages/myself/myself_page.dart';
import 'package:flutter_oes/pages/tasks/tasks_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  DateTime _lastPressedAt; //上次点击时间

  List<String> _bottomTabTitles = ["首页", "任务", "我的医院", "通讯录", "我的"];
  int _selectedIndex = 0;

  var _tabImages;
  var _tabPages;
  var _body;

  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  void initState() {
    super.initState();

    _tabPages ??= <Widget>[
      HomePage(),
      TasksPage(),
      HospitalConsolePage(),
      ContactsPage(),
      MyselfPage()
    ];

    _tabImages ??= <List<Image>>[
      [
        getTabImage('images/ic_home.png'),
        getTabImage('images/ic_home_press.png')
      ],
      [
        getTabImage('images/ic_tasks.png'),
        getTabImage('images/ic_tasks_press.png')
      ],
      [
        getTabImage('images/ic_hospital.png'),
        getTabImage('images/ic_hospital_press.png')
      ],
      [
        getTabImage('images/ic_contacts.png'),
        getTabImage('images/ic_contacts_press.png')
      ],
      [
        getTabImage('images/ic_myself.png'),
        getTabImage('images/ic_myself_press.png')
      ]
    ];
  }

  @override
  Widget build(BuildContext context) {
    _body = IndexedStack(
      children: _tabPages,
      index: _selectedIndex,
    );

    return new WillPopScope(
        child: Scaffold(
          body: Center(
            child: _body,
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: getTabIcon(0),
                  title: Padding(
                      padding: EdgeInsets.all(2),
                      child: Text(_bottomTabTitles[0]))),
              BottomNavigationBarItem(
                  icon: getTabIcon(1),
                  title: Padding(
                      padding: EdgeInsets.all(2),
                      child: Text(_bottomTabTitles[1]))),
              BottomNavigationBarItem(
                  icon: getTabIcon(2),
                  title: Padding(
                      padding: EdgeInsets.all(2),
                      child: Text(_bottomTabTitles[2]))),
              BottomNavigationBarItem(
                  icon: getTabIcon(3),
                  title: Padding(
                      padding: EdgeInsets.all(2),
                      child: Text(_bottomTabTitles[3]))),
              BottomNavigationBarItem(
                  icon: getTabIcon(4),
                  title: Padding(
                      padding: EdgeInsets.all(2),
                      child: Text(_bottomTabTitles[4]))),
            ],
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            currentIndex: _selectedIndex,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.blue,
            selectedFontSize: 10.0,
            unselectedFontSize: 10.0,
          ),
        ),
        onWillPop: () async {
          if (_lastPressedAt == null ||
              DateTime.now().difference(_lastPressedAt) >
                  Duration(seconds: 2)) {
            //两次点击间隔超过1秒则重新计时
            Fluttertoast.showToast(
                msg: "再按一次退出医掌宝", toastLength: Toast.LENGTH_SHORT);
            _lastPressedAt = DateTime.now();
            return false;
          }
          return true;
        });
  }

  Image getTabIcon(int index) {
    if (_selectedIndex == index) {
      return _tabImages[index][1];
    }
    return _tabImages[index][0];
  }

  Image getTabImage(imagePath) {
    return Image.asset(imagePath, width: 22, height: 22);
  }
}
