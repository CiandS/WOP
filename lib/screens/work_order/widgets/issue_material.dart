import 'package:flutter/material.dart';


class IssueMaterial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column (
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text ("Issue Material\n", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Text ("Original Qty / Rem Qty", style: TextStyle(fontSize: 24)),
            Text ('10 / 5', style: TextStyle(fontSize: 24, color: Colors.redAccent)),
            TextFormField(
             decoration: InputDecoration(labelText: 'Input Amount'),
               keyboardType: TextInputType.number,
            )],
          ),
    );}
}
