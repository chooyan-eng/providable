import 'package:example/article.dart';
import 'package:example/articles_page.dart';
import 'package:flutter/material.dart';
import 'package:provide_your_value/provide_your_value.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Provider(
        create: () {
          return ArticlesState();
        },
        child: const ArticlesPage(),
      ),
    );
  }
}
