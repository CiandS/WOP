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
          Text ("Cleanroom Packaging\n", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text ("Processing Amount test test", style: TextStyle(fontSize: 24)),
          Text ('Test', style: TextStyle(fontSize: 24, color: Colors.redAccent)),
          TextFormField(
            decoration: InputDecoration(labelText: 'Input Amount'),
            keyboardType: TextInputType.number,
          )],
      ),
    );}
}
