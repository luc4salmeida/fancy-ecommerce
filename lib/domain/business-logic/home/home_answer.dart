import 'package:fancy_ecommerce/domain/entities/product_entity.dart';

class HomeAnswer {}

class OpenProduct extends HomeAnswer {
  OpenProduct(this.product);
  final ProductEntity product;
}
