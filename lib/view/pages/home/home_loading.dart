import 'package:flutter/material.dart';

class HomePageLoading extends StatefulWidget {
  @override
  _HomePageLoadingState createState() => _HomePageLoadingState();
}

class _HomePageLoadingState extends State<HomePageLoading> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
