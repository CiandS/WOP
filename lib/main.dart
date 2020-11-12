import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_order_process/providers/scrap_provider.dart';
import 'screens/login/login.dart';
import 'screens/work_order_history/work_order_history.dart';

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

class WO_History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Operations Management System Work Order History',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: WO_HistoryPage(),
    );
  }
}
