import 'package:flutter/widgets.dart';

class Article {
  const Article(this.title, this.author);

  final String title;
  final String author;
}

class ArticlesState extends ValueNotifier<List<Article>> {
  ArticlesState() : super(<Article>[]);

  List<Article> get articles => value;

  void add(Article newArticle) {
    value = [...value, newArticle];
  }
}
