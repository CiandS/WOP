import 'package:flutter/material.dart';
import 'package:getflutter/components/accordian/gf_accordian.dart';
import 'package:work_order_process/screens/work_order/work_order.dart';

class WO_HistoryPage extends StatefulWidget {
  @override
  _WO_HistoryState createState() => new _WO_HistoryState();
}

class _WO_HistoryState extends State<WO_HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => WorkOrderPage()));
        },
      ),
      appBar: AppBar(
          title: new Center(
        child: Text("Work Order History"),
      )),
      body: Container(
        child: Center(
            child: Column(children: <Widget>[
          DataTable(columns: [
            DataColumn(label: Text('Description')),
            DataColumn(label: Text('Date / Time'))
          ], rows: [
            DataRow(cells: [
              DataCell(Text('JDE STATUS CHANGE TO 10. BY BOCONNO5')),
              DataCell(Text('16-OCT-2020 16:16'))
            ])
          ])
        ])),
      ),
    ));
  }
}
