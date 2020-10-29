import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:init/features/order/presentation/bloc/product_bloc/product_bloc.dart';
import 'package:init/features/order/presentation/widgets/loading_widget.dart';
import 'package:init/features/order/presentation/widgets/product_list.dart';

import '../../../../injection_container.dart';
import 'order_page.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({Key key}) : super(key: key);

  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: getWidget(_selectedIndex, context),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.local_pizza),
              label: 'Menu',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_bar),
              label: 'Barman',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant),
              label: 'Cheff',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.face),
              label: 'Waiter',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        floatingActionButton: _selectedIndex == 0
            ? FloatingActionButton(
                backgroundColor: Colors.purple,
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderPage(),
                  ),
                ),
                tooltip: 'Toggle',
                child: Icon(Icons.shopping_basket),
              )
            : null,
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
          return Container();
        },
      ),
    );
  }

  Widget getWidget(int selectedIndex, BuildContext context) {
    switch (selectedIndex) {
      case 0:
        return buildBlocProvider(context);
      case 1:
        return Text(
          'List of drink orders',
          style: optionStyle,
        );
      case 2:
        return Text(
          'List of meal orders',
          style: optionStyle,
        );
      case 3:
        return Text(
          'List of orders ready to serve',
          style: optionStyle,
        );
      default:
        return Text(
          'Error',
          style: optionStyle,
        );
    }
  }
}
