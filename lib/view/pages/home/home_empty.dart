import 'package:flutter/material.dart';
import 'package:fancy_ecommerce/domain/business-logic/home/home_bloc.dart';

class HomePageEmpty extends StatefulWidget {
  final HomeBloc bloc;
  const HomePageEmpty({Key key, this.bloc}) : super(key: key);

  @override
  _HomePageEmptyState createState() => _HomePageEmptyState();
}

class _HomePageEmptyState extends State<HomePageEmpty> {
  HomeBloc get bloc => widget.bloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
