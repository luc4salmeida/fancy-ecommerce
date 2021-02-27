import 'package:flutter/material.dart';
import 'package:fancy_ecommerce/domain/business-logic/home/home.dart';
import 'package:fancy_ecommerce/domain/entities/product_entity.dart';
import 'package:fancy_ecommerce/style/style.dart';
import 'package:fancy_ecommerce/view/widgets/widgets.dart';

class HomePageLoaded extends StatefulWidget {
  final HomeBloc bloc;
  const HomePageLoaded({Key key, this.bloc}) : super(key: key);

  @override
  _HomePageLoadedState createState() => _HomePageLoadedState();
}

class _HomePageLoadedState extends State<HomePageLoaded> {
  HomeBloc get bloc => widget.bloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            const SizedBox(height: 20.0),
            _buildSearchBar(context),
            const SizedBox(height: 20.0),
            _buildContent(context)
          ],
        ),
      )),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.list),
        Text('E-commerce', style: const TextStyle().h1),
        const Icon(Icons.shopping_bag)
      ],
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
          labelText: 'Procure alguma coisa legal',
          border: OutlineInputBorder()),
    );
  }

  Widget _buildContent(BuildContext context) {
    return SafeStreamBuilder<List<ProductEntity>>(
        stream: bloc.streamProducts, resolver: _buildProductList);
  }

  Widget _buildProductList(List<ProductEntity> list) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 10.0,
      children: list.map<Widget>(_buildProduct).toList(),
    );
  }

  Widget _buildProduct(ProductEntity product) {
    return GestureDetector(
        onTap: () => bloc.dispatchAction(ProductPressed(product)),
        child: Column(
          children: [
            Expanded(child: Image.network(product.imageUrl)),
            Text(product.name, style: const TextStyle().h2),
            Text(product.price.toStringAsFixed(2), style: const TextStyle().h5),
          ],
        ));
  }
}
