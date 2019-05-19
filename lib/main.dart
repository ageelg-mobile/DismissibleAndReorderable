import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'ReorderableListView + Dismissible Items'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> list = new List<Widget>();

  onReorder(oldIndex, newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    Future.delayed(Duration(milliseconds: 20), () {
      setState(() {
        final Widget item = list.removeAt(oldIndex);
        list.insert(newIndex, item);
      });
    });
  }

  buildList() {
    for (var i = 0; i < 20; i++) {
      list.add(Dismissible(
          key: (Key("Text$i")),
          onDismissed: (direction) {
            setState(() {
              list.removeWhere((item) => item.key == Key("Text$i"));
            });
          },
          background: Container(color: Color(0x444f63a2)),
          child: new SizedBox(
            width: double.infinity,
            height: 60,
            child: Center(
                child: Text(
              "Text$i",
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontSize: 45.0,
                color: Colors.black45,
              ),
            )),
          )));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (list.length < 1) {
      buildList();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ReorderableListView(
          children: list,
          onReorder: (oldIndex, newIndex) {
            onReorder(oldIndex, newIndex);
          },
        ),
      ),
    );
  }
}
