import 'package:flutter/material.dart';


class ContactsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("通讯录"),
      ),
      body: Center(
        child: Text("通讯录"),
      ),
    );
  }
}

