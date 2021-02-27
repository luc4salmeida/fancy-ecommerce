import 'package:meta/meta.dart';

class ProductEntity {
  final int id;
  final String name;
  final String description;
  final double price;
  final double descount;

  final String imageUrl;

  ProductEntity(
      {@required this.id,
      @required this.name,
      @required this.description,
      @required this.price,
      @required this.descount,
      @required this.imageUrl});
}
