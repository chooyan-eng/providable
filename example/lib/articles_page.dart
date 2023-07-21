import 'package:flutter/material.dart';
import 'package:provide_your_value/provide_your_value.dart';

import 'article.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final articles = Provider.watch<ArticlesState>(context).articles;

    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.all(16),
          child: Text(articles[index].title),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.read<ArticlesState>(context).add(Article(
            'TITLE: time at ${DateTime.now()}',
            'chooyan',
          ));
        },
      ),
    );
  }
}
