import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_order_process/models/work_order_history.dart';
import 'package:work_order_process/providers/work_order_history_provider.dart';
import 'package:work_order_process/providers/work_order_provider.dart';
import 'package:work_order_process/screens/work_order/work_order.dart';

class WOHistoryPage extends StatefulWidget {
  @override
  _WOHistoryState createState() => new _WOHistoryState();
}

class _WOHistoryState extends State<WOHistoryPage> {
  List<DataColumn> _buildColumnData(BuildContext context) {
    return [
      DataColumn(label: Text('Description')),
      DataColumn(label: Text('Date / Time'))
    ];
  }

  List<DataRow> _buildRowData(BuildContext context) {
    List<WorkOrderHistory> workOrderHistoryList =
        Provider.of<WorkOrderHistoryProvider>(context, listen: false)
            .workOrderHistoryList;
    List<DataRow> _dataRows = [];

    workOrderHistoryList.forEach((workOrderHistory) {
      _dataRows.add(
        DataRow(
          cells: <DataCell>[
            DataCell(Text(workOrderHistory.workOrderHistoryTask)),
            DataCell(Text(workOrderHistory.workOrderHistoryDt.toString())),
          ],
        ),
      );
    });

    return _dataRows;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: new Center(
        child: Text("Work Order History"),
      )),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Consumer<WorkOrderHistoryProvider>(
                builder: (context, value, child) => DataTable(
                  columns: _buildColumnData(context),
                  rows: _buildRowData(context),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
