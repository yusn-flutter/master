import 'package:flutter/material.dart';

class AddSuggestions extends StatelessWidget {

  final String word;

  AddSuggestions(this.word);

  // 画面遷移用
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add-Suggestions'),
      ),
      body: Column(
        children: [
          Text(word),
          Text('World'),
        ],
      ),
    );
  }
}