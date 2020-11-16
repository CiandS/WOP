import 'package:flutter/material.dart';
import 'package:work_order_process/screens/work_order/work_order.dart';

class WO_HistoryPage extends StatefulWidget {
  @override
  _WO_HistoryState createState() => new _WO_HistoryState();
}

class _WO_HistoryState extends State<WO_HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.list),
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
