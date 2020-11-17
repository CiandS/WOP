import 'package:flutter/material.dart';

class Cleanline extends StatefulWidget {
  @override
  _CleanlineState createState() => _CleanlineState();
}

class _CleanlineState extends State<Cleanline> {

  int _cleaningMachine = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Cleanline\n",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text('Attune Revise Inserts', style: TextStyle(fontSize: 24, color: Colors.redAccent)),
      DropdownButton(
          value: _cleaningMachine,
          items: [
            DropdownMenuItem(
              child: Text("Please select your machine"),
              value: 1,
            ),
            DropdownMenuItem(
              child: Text("Machine 1"),
              value: 2,
            ),
            DropdownMenuItem(child: Text("Machine 2"), value: 3),
            DropdownMenuItem(
              child: Text("Machine 3"),
              value: 4,
            ),
          ],
          onChanged: (value) {
            setState(() {
              _cleaningMachine = value;
            });
          }),
          if (_cleaningMachine == 2)
          Container(
            child: Column(
              children: [
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
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}
