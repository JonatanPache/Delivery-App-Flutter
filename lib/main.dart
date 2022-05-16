import 'package:flutter/material.dart';
import 'package:flutter_delivery_app/src/pages/cliente/products/list/cliente_products_list_page.dart';
import 'package:flutter_delivery_app/src/pages/login/login_page.dart';
import 'package:flutter_delivery_app/src/pages/register/register_page.dart';
import 'package:flutter_delivery_app/src/utils/my_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'register': (BuildContext context) => RegisterPage(),
        'cliente/products/list': (BuildContext context) =>
            ClienteProductsListPage(),
      },
      theme: ThemeData(
          primaryColor: MyColor.primaryColor, fontFamily: 'NimbusSans'),
    );
  }
}
