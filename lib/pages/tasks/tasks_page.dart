import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TasksPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State();
  }
}

class _State extends State<TasksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("任务"),
      ),
      body: Center(
        child: Text("任务"),
      ),
    );
  }
}
