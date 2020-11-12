import 'package:flutter/material.dart';


class IssueMaterial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: <Widget>[
            Text ("Original Qty / Rem Qty", style: TextStyle(fontSize: 24)),
            Text ('10 / 5', style: TextStyle(fontSize: 24, color: Colors.redAccent)),
            TextFormField(
              decoration: InputDecoration(labelText: 'Input Number'),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
    );
  }
}
