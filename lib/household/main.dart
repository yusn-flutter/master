import 'package:flutter/material.dart';
import 'calendar.dart';

void main() {
  runApp(Household());
}

class Household extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '家計簿メイン画面',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Household'),
          actions: [
            IconButton(icon: Icon(Icons.list), onPressed: test),
            IconButton(icon: Icon(Icons.search), onPressed: test),
          ],
          backgroundColor: Colors.amber,
        ),
        body: Calendar(),
      ),
    );
  }

  void test() {
    // エラー回避のため一時作成
  }
}