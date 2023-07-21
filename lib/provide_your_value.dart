library provide_your_value;

import 'package:flutter/material.dart';

class Provider<T extends ValueNotifier> extends StatefulWidget {
  const Provider({
    super.key,
    required this.child,
    required this.create,
  });

  final Widget child;
  final T Function() create;

  static T watch<T>(BuildContext context) {
    final widget =
        context.dependOnInheritedWidgetOfExactType<StateContainer<T>>();
    assert(widget != null);
    return widget!.state;
  }

  static T read<T>(BuildContext context) {
    final widget = context.getInheritedWidgetOfExactType<StateContainer<T>>();
    assert(widget != null);
    return widget!.state;
  }

  @override
  State<Provider> createState() => ProviderState<T>();
}

class ProviderState<T extends ValueNotifier> extends State<Provider> {
  late final ValueNotifier state;

  @override
  void initState() {
    super.initState();

    state = widget.create();
    state.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return StateContainer<T>(
      state as T,
      child: widget.child,
    );
  }
}

class StateContainer<T> extends InheritedWidget {
  const StateContainer(
    this.state, {
    super.key,
    required super.child,
  });

  final T state;

  @override
  bool updateShouldNotify(covariant StateContainer<T> oldWidget) {
    return true;
  }
}
