import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'add_page.dart';
import 'save_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: RandomWords(), // 画面全体
    );
  }
}

class RandomWords extends StatefulWidget {
  _RandomWords createState() => _RandomWords();
}

class _RandomWords extends State<RandomWords> {
  final wordPairList = <WordPair>[];
  final saved = <WordPair>{};
  final font = TextStyle(fontSize: 18.0);
  final iconList = const Icon(Icons.list);
  final iconAdd = const Icon(Icons.add);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Flutter'),
        // AppBarにアクションを追加
        actions: [
          IconButton(icon: iconList, onPressed: pushSaved),
          IconButton(icon: iconAdd, onPressed: pushAdd),
        ],
      ),
      body: createWordPairList(),
    );
  }

  Widget createWordPairList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        // isOdd:iが奇数の時  Divider():仕切り線
        if (i.isOdd) return const Divider();

        final index = i~/2;
        if (index >= wordPairList.length) {
          wordPairList.addAll(generateWordPairs().take(10));
        }
        return buildRow(wordPairList[index]);
      }
    );
  }

  Widget buildRow(WordPair pair) {
    final alreadySaved = saved.contains(pair);
    return ListTile(
      // listの先頭
      leading: Icon(
        Icons.accessibility_new,
      ),
      // listの中央
      title: Text(
        pair.asPascalCase,
        style: font,
      ),
      // titleの下
      subtitle: Text(
        'subtitleを記入',
        style: TextStyle(fontSize: 9.0),
      ),
      // listの末尾
      trailing: Icon(
        // 三項演算子
        // alreadySavedがtrueの場合左側、falseの場合右側
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      // タップ時の処理
      onTap: () {
        // 状態(State)の変更処理
        setState(() {
          alreadySaved ? saved.remove(pair) : saved.add(pair);
        });
      },
    );
  }

  void pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => FavoriteList(saved, font),
      ),
    );
  }

  void pushAdd() {
    Navigator.of(context).push(
        MaterialPageRoute<Widget>(
          builder: (context) => AddSuggestions('Hello World'),
        )
    );
  }
}