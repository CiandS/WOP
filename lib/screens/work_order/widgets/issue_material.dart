import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';


class IssueMaterial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column (
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text ("Issue Material", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text ("Attune Revise Inserts\n", style: TextStyle(fontSize: 22,)),
              new CircularPercentIndicator(
                radius: 150.0,
                lineWidth: 25.0,
                percent: 0.5,
                header: Text('Original QTY: 10 / Remaining QTY: 5', style: TextStyle(fontSize: 20,)),
                center: new Icon(Icons.shopping_bag, size: 40.0,),
                progressColor: Colors.blueAccent,
              ),
            FractionallySizedBox(
              widthFactor: 0.5,
              child: TextFormField(
               decoration: InputDecoration(labelText: 'Input Quantity Processed'),
                 keyboardType: TextInputType.number,
              ),
            )],
          ),
    );}
}
