import 'package:flutter/material.dart';

import 'style/style.dart';
import 'view/pages/home/home_page.dart';
import 'view/widgets/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce',
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => BaseResponsiveView(
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: child,
        ),
      ),
      routes: {HomePage.route: (context) => HomePage()},
    );
  }
}
