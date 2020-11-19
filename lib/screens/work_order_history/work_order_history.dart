import 'package:flutter/material.dart';
import 'package:work_order_process/screens/work_order/work_order.dart';

class WOHistoryPage extends StatefulWidget {
  @override
  _WOHistoryState createState() => new _WOHistoryState();
}

class _WOHistoryState extends State<WOHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ]),
            DataRow(cells: [
              DataCell(Text('Lot Traveller/BOM. Rev 1 printed.')),
              DataCell(Text('10-OCT-2020 12:30'))
            ]),
          ])
        ])),
      ),
    );
  }
}
