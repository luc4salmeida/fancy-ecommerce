import 'package:fancy_ecommerce/core/bloc/base_bloc.dart';
import 'package:fancy_ecommerce/domain/business-logic/bloc.dart';
import 'package:fancy_ecommerce/domain/entities/product_entity.dart';
import 'package:fancy_ecommerce/mock.dart';

import 'home_actions.dart';
import 'home_event.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeAction, HomeAnswer> {
  Stream<List<ProductEntity>> get streamProducts =>
      streamOf<List<ProductEntity>>();

  HomeBloc() : super() {
    _init();
    _fetch();
  }

  void _init() {
    dispatchState(Empty());
  }

  Future<void> _fetch() async {
    dispatchState(Loading());

    await Future.delayed(const Duration(seconds: 3));
    dispatchOn<List<ProductEntity>>(mockProducts);

    dispatchState(Loaded());
  }

  @override
  void onAction(action) {
    if (action is ProductPressed) {
      dispatchAnswer(OpenProduct(action.product));
    }
  }

  @override
  void onState(event) {}
}
