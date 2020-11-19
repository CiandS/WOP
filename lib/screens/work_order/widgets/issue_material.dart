import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class IssueMaterial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text("Work Order Number: 1245678",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Text("Attune PS Inserts\n",
              style: TextStyle(
                fontSize: 22,
              )),
          Container(
            color: Colors.black12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(20.0),
                    padding: const EdgeInsets.all(30.0),
                    color: Colors.white,
                    child: Column(
                      children: [
                        CircularProgressIndicator(
                          value: 0.5,
                          backgroundColor: Colors.grey,
                          strokeWidth: 10,
                        ),
                        new CircularPercentIndicator(
                          radius: 150.0,
                          lineWidth: 30.0,
                          percent: 0.4,
                          header: Text('Original QTY: 10',
                              style: TextStyle(
                                fontSize: 20,
                              )),
                          center: new Icon(
                            Icons.linear_scale,
                            size: 50.0,
                          ),
                          footer: Text('Remaining QTY: 5',
                            style: TextStyle(
                            fontSize: 20,
                            )),
                          progressColor: Colors.blueAccent,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(20.0),
                    padding: const EdgeInsets.all(30.0),
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Container(
                            width: 300.0,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'Input Quantity Processed'),
                              keyboardType: TextInputType.number,
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
