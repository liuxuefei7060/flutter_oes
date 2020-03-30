import 'package:flutter/material.dart';

class HospitalConsolePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State();
  }
}

class _State extends State<HospitalConsolePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("我的医院"),

      ),
      body: Center(
        child: Text("我的医院"),
      ),
    );
  }
}
