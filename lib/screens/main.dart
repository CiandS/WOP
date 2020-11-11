import 'package:flutter/material.dart';
import 'work_order/work_order.dart';
import 'work_order_history/work_order_history.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Operations Management System Test',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: WorkOrderPage(),
    );
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