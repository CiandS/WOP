import 'package:flutter/material.dart';

class CleanroomPack extends StatefulWidget {
  @override
  _CleanroomPackState createState() => _CleanroomPackState();
}

class _CleanroomPackState extends State<CleanroomPack> {
  int _qualityMachine = 1;
  int _processMachine = 1;
  bool _eccMachineCheck = false;
  bool _qracMachineCheck = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column (
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text ("Work Order Number: 1245678\n", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text ("Cleanroom Packaging", style: TextStyle(fontSize: 24)),
          Text ('Test', style: TextStyle(fontSize: 24, color: Colors.redAccent)),
          Text ('Q1 Pressure Check Logs'),
          DataTable(
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
                  DataCell(Text('a.user')),
                ]),
              ]),
          TextFormField(
            decoration: InputDecoration(labelText: 'Input Amount'),
            keyboardType: TextInputType.number,
          )],
      ),
    );}
}
