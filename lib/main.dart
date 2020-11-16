import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_order_process/providers/scrap_provider.dart';
import 'screens/login/login.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (context) => ScrapProvider(),
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Operations Management System Test',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Login());
  }
}
