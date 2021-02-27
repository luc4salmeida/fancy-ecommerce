import 'package:fancy_ecommerce/domain/entities/product_entity.dart';

class HomeAction {}

class ProductPressed extends HomeAction {
  ProductPressed(this.product);
  final ProductEntity product;
}
