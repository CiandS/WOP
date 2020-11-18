import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class GenLabels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Text ("Work Order Number: 1245678", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("Attune PS Inserts\n", style: TextStyle(fontSize: 22,)),
            Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    new CircularPercentIndicator(
                      radius: 150.0,
                      lineWidth: 25.0,
                      percent: 0.5,
                      header: Text('Original QTY: 10 / Remaining QTY: 5',
                          style: TextStyle(
                            fontSize: 20,
                          )),
                      center: new Icon(
                        Icons.shopping_bag,
                        size: 40.0,
                      ),
                      progressColor: Colors.blueAccent,
                    ),
                    Text('test'),
                    Text('123'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.green,
                child: Column(
                  children: [
                    Text('test'),
                    Text('123'),
                    Container(
                        width: 300.0,
                        child: TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Input Quantity Processed'),
                          keyboardType: TextInputType.number,
                        )),
                  ],
                ),
              ),
            )
      ],
    ),
          ],
        ));
  }
}
