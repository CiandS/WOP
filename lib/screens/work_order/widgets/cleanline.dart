import 'package:flutter/material.dart';

class Cleanline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Cleanline\n",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text("Processing Amount", style: TextStyle(fontSize: 24)),
          Text('Test', style: TextStyle(fontSize: 24, color: Colors.redAccent)),
          TextFormField(
            decoration: InputDecoration(labelText: 'Input Amount'),
            keyboardType: TextInputType.number,
          )
        ],
      ),
    );
  }
}
