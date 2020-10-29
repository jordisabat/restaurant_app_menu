import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:init/features/order/presentation/product_bloc/product_bloc.dart';
import 'package:init/features/order/presentation/widgets/loading_widget.dart';
import 'package:init/features/order/presentation/widgets/product_list.dart';

import '../../../../injection_container.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({Key key}) : super(key: key);

  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: buildBlocProvider(context),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple,
          onPressed: () {
            print('go to order page');
          },
          tooltip: 'Toggle',
          child: Icon(Icons.shopping_basket),
        ),
      ),
    );
  }

  BlocProvider<ProductBloc> buildBlocProvider(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ProductBloc>()..add(GetAllProductsEvent()),
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is Loading) {
            return const LoadingWidget();
          } else if (state is Loaded) {
            print(state.products.length);
            return ProductList(products: state.products);
          } else if (state is Error) {
            return Text(state.message);
          }
          return Container(
            height: MediaQuery.of(context).size.height / 3,
            child: const Placeholder(),
          );
        },
      ),
    );
  }
}
