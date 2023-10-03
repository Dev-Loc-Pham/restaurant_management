import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_management/provider/app_state.dart';
import 'package:restaurant_management/screens/bill_page.dart';
import 'package:restaurant_management/screens/dish_page.dart';
import 'package:restaurant_management/screens/login_page.dart';
import 'package:restaurant_management/screens/table_page.dart';

void main() {
  runApp( Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> AppState(),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,

        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context)=> LoginPage(),
          '/tables': (context) => TablePage(),
          DishPage.routeName: (context) => DishPage(),
          BillPage.routeName: (context) => BillPage(),
        },
      ),
    );
  }
}

