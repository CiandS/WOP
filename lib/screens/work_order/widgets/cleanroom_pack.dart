import 'package:flutter/material.dart';


class CleanroomPack extends StatelessWidget {
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
