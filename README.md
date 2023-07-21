<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

## provider_your_value

Extremely tiny wrapper package of `InheritedWidget`.

It's NOT for production usage but a learning generic state management mechanisms purpose.

## Features

- Provide value to descendant widgets.
- `read` and `watch` available.

## Usage

### define state class extending `ValueNotifier`

An example `ArticleState` class preserving a list of `Article` is shown below.

```dart
class ArticlesState extends ValueNotifier<List<Article>> {
  ArticlesState() : super(<Article>[]);

  List<Article> get articles => value;

  void add(Article newArticle) {
    value = [...value, newArticle];
  }
}
```

### place `Provider` on a widget tree

Make sure `Provider` have to be placed at ancestor position than user widgets.

```dart
@override
Widget build(BuildContext context) {
  return MaterialApp(
    home: Provider(
      create: () => ArticlesState(),
      child: const ArticlesPage(),
    ),
  );
}
```

### read / watch it from a widget

You can observe the state with `Provider.watch<T>()` and read the state with `Provider.read<T>()`.

```dart
final articles = Provider.watch<ArticlesState>(context).articles;
```

```dart
onPressed: () {
  Provider.read<ArticlesState>(context).add(Article(
    'TITLE: time at ${DateTime.now()}',
    'chooyan',
  ));
},
```

That's it!