import 'package:flutter/material.dart';
import 'package:fancy_ecommerce/domain/business-logic/home/home.dart';
import 'package:fancy_ecommerce/domain/entities/product_entity.dart';
import 'package:fancy_ecommerce/view/widgets/widgets.dart';

import 'home_empty.dart';
import 'home_loaded.dart';
import 'home_loading.dart';

class HomePage extends StatefulWidget {
  static String route = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc homeBloc;

  @override
  void initState() {
    homeBloc = HomeBloc();
    homeBloc.listenOn<HomeAnswer>(_handleAnswers);

    super.initState();
  }

  void _handleAnswers(HomeAnswer answer) {
    if (answer is OpenProduct) {
      _openProductPage(answer.product);
    }
  }

  void _openProductPage(ProductEntity product) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Container(child: Text(product.name))));
  }

  @override
  Widget build(BuildContext context) {
    return SafeStreamBuilder(
      stream: homeBloc.streamOf<HomeEvent>(),
      resolver: _buildEvent,
    );
  }

  Widget _buildEvent(HomeEvent event) {
    switch (event.runtimeType) {
      case Empty:
        return HomePageEmpty(
          bloc: homeBloc,
        );
      case Loaded:
        return HomePageLoaded(
          bloc: homeBloc,
        );
      case Loading:
        return HomePageLoading();
      default:
        return Container();
    }
  }
}
