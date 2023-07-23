import 'package:example/article.dart';
import 'package:example/articles_page.dart';
import 'package:flutter/material.dart';
import 'package:providable/providable.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Provider(
        create: () => ArticlesState(),
        child: const ArticlesPage(),
      ),
    );
  }
}
