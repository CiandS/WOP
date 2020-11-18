import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';


class GenLabels extends StatelessWidget {

  @override

  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            Text ("Work Order Number: 1245678", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text("Attune PS Inserts\n", style: TextStyle(fontSize: 22,)),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new LinearPercentIndicator(
                    width: 200.0,
                    lineHeight: 40.0,
                    percent: 1.0,
                    center: Text(
                      "10/10 Remaining QTY",
                      style: TextStyle(fontSize: 18),
                    ),
                    backgroundColor: Colors.grey,
                    progressColor: Colors.blue,
                  ),
                ],
              ),
            ),
            Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text ('Q1 Pressure Logs Checks: 18-NOV-2020', style: TextStyle(fontSize: 16,)),
                      DataTable(
                        showCheckboxColumn: true,
                          columns: [
                            DataColumn(label: Text('Time')),
                            DataColumn(label: Text('A')),
                            DataColumn(label: Text('B')),
                            DataColumn(label: Text('A - B')),
                            DataColumn(label: Text('C')),
                            DataColumn(label: Text('Signature')),
                          ],
                          rows: [
                            DataRow(cells: [
                              DataCell(Text('07:00')),
                              DataCell(Text('15')),
                              DataCell(Text('3')),
                              DataCell(Text('12')),
                              DataCell(Text('3')),
                              DataCell(Text('a.user'),
                              showEditIcon: true),
                            ]),
                          ]),
                    ],
                  ),
                ),
                Container(
                    width: 300.0,
                    child: TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Input Quantity Processed'),
                      keyboardType: TextInputType.number,
                    )),
              ],
            )
      ],
    ),
          ],
        ));
  }
}
