import 'package:flutter/material.dart';

class SafeStreamBuilder<T> extends StatelessWidget {
  final Stream<T> stream;
  final Widget Function(T) resolver;

  const SafeStreamBuilder(
      {@required this.stream, @required this.resolver, key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snap) {
        if (!snap.hasData) return Container();
        if (snap.hasError) return const Icon(Icons.error);
        return resolver(snap.data);
      },
    );
  }
}
