import 'package:flutter/material.dart';

import 'features/order/presentation/pages/restaurant_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaruant App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RestaurantPage(),
    );
  }
}
