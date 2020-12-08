import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:work_order_process/providers/scrap_provider.dart';
import 'package:work_order_process/providers/work_order_history_provider.dart';
import 'package:work_order_process/providers/work_order_provider.dart';
import 'screens/login/login.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ScrapProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WorkOrderHistoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WorkOrderProvider(),
        ),
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return MaterialApp(
        title: 'Operations Management System Test',
        theme: ThemeData(
          primarySwatch: Colors.red,
          primaryColor: Colors.redAccent[700],
          accentColor: Colors.blue[800],
        ),
        home: Login());
  }
}
