import 'package:flutter/material.dart';
import 'package:work_order_process/widgets/work_order.dart';
import 'widgets/work_order.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Operations Management System test',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
      home: WorkOrderPage());
  }
}