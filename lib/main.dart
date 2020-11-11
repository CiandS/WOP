import 'package:flutter/material.dart';
import 'screens/work_order/work_order.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Operations Management System Test',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: WorkOrderPage());
  }
}
