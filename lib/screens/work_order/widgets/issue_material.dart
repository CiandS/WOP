import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';


class IssueMaterial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column (
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text ("Issue Material\n", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              new CircularPercentIndicator(
                radius: 150.0,
                lineWidth: 25.0,
                percent: 0.5,
                header: Text('Original QTY: 10 / Remaining QTY: 5'),
                center: new Icon(Icons.shopping_bag, size: 40.0,),
                progressColor: Colors.blueAccent,
              ),
            TextFormField(
             decoration: InputDecoration(labelText: 'Input Quantity Processed'),
               keyboardType: TextInputType.number,
            )],
          ),
    );}
}
