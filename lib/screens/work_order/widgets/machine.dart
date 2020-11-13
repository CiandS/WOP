import 'package:flutter/material.dart';


class Machine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column (
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text ("Machine\n", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text ("Select Machine test", style: TextStyle(fontSize: 24)),
          Text ('Test', style: TextStyle(fontSize: 24, color: Colors.redAccent)),
          TextFormField(
            decoration: InputDecoration(labelText: 'Input Amount'),
            keyboardType: TextInputType.number,
          )],
      ),
    );}
}
