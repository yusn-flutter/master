import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class FavoriteList extends StatelessWidget {

  final Set<WordPair> saved;
  final TextStyle font;

  FavoriteList(this.saved, this.font);

  @override
  Widget build(BuildContext context) {
    final tile = saved.map((WordPair pair) =>
        ListTile(
          title: Text(pair.asPascalCase,
              style: font),
        ));
    final divided = ListTile.divideTiles(
        context: context,
        tiles: tile).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Suggestions'),
      ),
      body: ListView(children: divided),
    );
  }
}