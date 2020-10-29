import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:init/features/order/domain/entities/order.dart';
import 'package:init/features/order/presentation/bloc/bloc/order_bloc.dart';
import 'package:init/features/order/presentation/widgets/loading_widget.dart';
import 'package:init/features/order/presentation/widgets/order_details.dart';
import '../../../../injection_container.dart';

class OrderPage extends StatefulWidget {
  final List<Order> orders;
  const OrderPage({Key key, this.orders}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return buildBlocProvider(context);
  }

  BlocProvider<OrderBloc> buildBlocProvider(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<OrderBloc>()..add(GetAllOrdersEvent()),
      child: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          if (state is Loading) {
            return const LoadingWidget();
          } else if (state is Loaded) {
            print(state.orders.length);
            return OrderDetails(order: state.orders[0]);
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
