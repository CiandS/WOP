import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:work_order_process/models/work_order.dart';
import 'package:work_order_process/providers/work_order_provider.dart';

class GenLabels extends StatefulWidget {

  _GenLabelsState createState() => _GenLabelsState();
}

class _GenLabelsState extends State<GenLabels> {

  double quantityProcessed = 0.0;
  final quantityProcessedTextController = TextEditingController();

  String getQuantityProcessedPercentage (double quantityProcessedValue) {
    int quantityParsed = (quantityProcessedValue * 10).toInt();
    return quantityParsed.toString();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    quantityProcessedTextController.dispose();
    super.dispose();
  }
  @override

  Widget build(BuildContext context) {
    WorkOrder workOrder =
        Provider.of<WorkOrderProvider>(context, listen: false).getWorkOrder;
    return Center(
        child: Column(
          children: [
            Text ("Work Order Number: ${workOrder.getWorkOrderNumber}", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text("Attune PS Inserts", style: TextStyle(fontSize: 22,)),
            Column(
              children: <Widget>[
                Align(
                    alignment: Alignment.topRight,
                    child: Container(
                        width: 200,
                        child: Center(
                            child: Text('Quantity Processed:',
                                style: TextStyle(
                                  fontSize: 16,
                                ))))),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 200,
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: new LinearPercentIndicator(
                      width: 200.0,
                      lineHeight: 40.0,
                      percent: quantityProcessed,
                      center: Text(
                        "${getQuantityProcessedPercentage(quantityProcessed) }/10",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Colors.grey,
                      progressColor: Colors.blue[800],
                    ),
                  ),
                ),
              ],
            ),
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
                      child: Column(children: [
                        Text("Q1 Pressure Logs Checks: 18-NOV-2020",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold)),
                        Text("Day Logs", style: TextStyle(fontSize: 16,)),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 25.0),
                          child:
                          DataTable(
                              showCheckboxColumn: true,
                              columns: [
                                DataColumn(label: Text('Time')),
                                DataColumn(label: Text('A')),
                                DataColumn(label: Text('B')),
                                DataColumn(label: Text('A - B')),
                                DataColumn(label: Text('C')),
                                DataColumn(label: Text('Signature')),
                              ],
                              rows: [
                                DataRow(cells: [
                                  DataCell(Text('07:00')),
                                  DataCell(Text('15')),
                                  DataCell(Text('3')),
                                  DataCell(Text('12')),
                                  DataCell(Text('3')),
                                  DataCell(Text('a.user'),
                                      showEditIcon: true),
                                ]),
                              ]),
                        ),
                      ]),
                    ),
                  ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(20.0),
                        padding: const EdgeInsets.all(30.0),
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  child: Text(
                                    'Condition Checks',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.left,
                                  )),
                            ),
                            Container(
                                width: 300.0,
                                child: Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Flexible(
                                        child: TextFormField(
                                          controller: quantityProcessedTextController,
                                          decoration: InputDecoration(
                                              labelText: 'Input Quantity Processed'),
                                          keyboardType: TextInputType.number,
                                        ),
                                      ),
                                      FlatButton(
                                        color: Colors.blueAccent,
                                          onPressed: (){
                                        setState(() {
                                          quantityProcessed += double.parse(quantityProcessedTextController.text) / 10;
                                        });
                                      }, child: Text('Process'))
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    )
                ],
              ),
            ),
      //       Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // children: [
      //       Column(
      //         children: [
      //           Padding(
      //             padding: const EdgeInsets.all(20.0),
      //             child: Column(
      //               children: [
      //                 T
      //               ],
      //             ),
      //           ),
    //             Container(
    //                 width: 300.0,
    //                 child: TextFormField(
    //                   decoration:
    //                       InputDecoration(labelText: 'Input Quantity Processed'),
    //                   keyboardType: TextInputType.number,
    //                 )),
    //           ],
    //         )
    //   ],
    // ),
          ],
        ));
  }
}
