import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_order_process/models/scrap_details.dart';
import 'package:work_order_process/providers/scrap_provider.dart';

class AddToScrap extends StatefulWidget {
  String dropdownScrapValue;
  String dropdownOperationValue;
  String dropdownQuantityValue;

  AddToScrap(this.dropdownScrapValue, this.dropdownOperationValue);

  @override
  _AddToScrapState createState() => _AddToScrapState();
}

class _AddToScrapState extends State<AddToScrap> {
  List<String> dropdownScrapItems = [
    'Indentions',
    'Saw Damage',
    'Pinhole',
    'Machine Marks'
  ];
  List<String> dropdownOperationItems = [
    'Issue Material',
    'Cut Blocks',
    'Inspect 1',
    'Machine'
  ];

  List<String> _generateQuickQty() {
    List<String> qtyList = [];
    for (var i = 1; i <= 15; i++) {
      qtyList.add(i.toString());
    }
    return qtyList;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: 300,
          height: 420,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white),
          padding: EdgeInsets.fromLTRB(20, 50, 20, 5),
          child: Container(
            child: Column(
              children: [
                Container(
                  child: Text(
                    'Scrap Item',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Text('Select Scrap Code',
                            style: TextStyle(fontSize: 20)),
                      ),
                      Container(
                        child: DropdownButton<String>(
                          value: widget.dropdownScrapValue,
                          icon: Icon(Icons.arrow_circle_down),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.black, fontSize: 18),
                          underline: Container(
                            height: 2,
                            color: Colors.redAccent,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              widget.dropdownScrapValue = newValue;
                            });
                          },
                          items: dropdownScrapItems
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Text('Select Operation',
                            style: TextStyle(fontSize: 20)),
                      ),
                      Container(
                        child: DropdownButton<String>(
                          value: widget.dropdownOperationValue,
                          icon: Icon(Icons.arrow_circle_down),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.black, fontSize: 18),
                          underline: Container(
                            height: 2,
                            color: Colors.red,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              widget.dropdownOperationValue = newValue;
                            });
                          },
                          items: dropdownOperationItems
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text('QTY', style: TextStyle(fontSize: 20)),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: DropdownButton<String>(
                          value: widget.dropdownQuantityValue,
                          icon: Icon(Icons.arrow_circle_down),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.black, fontSize: 18),
                          underline: Container(
                            height: 2,
                            color: Colors.red,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              widget.dropdownQuantityValue = newValue;
                            });
                          },
                          items: _generateQuickQty()
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    OutlineButton(
                      onPressed: () {
                        Provider.of<ScrapProvider>(context).addScrap(
                          ScrapDetails(
                            Random().nextInt(100),
                            'A${Random().nextInt(1000)}',
                            widget.dropdownScrapValue,
                            widget.dropdownOperationValue,
                            int.parse(widget.dropdownQuantityValue),
                            'admin user',
                            DateTime.now(),
                          ),
                        );
                        Navigator.pop(context);
                      },
                      borderSide: BorderSide(color: Colors.green[400]),
                      textColor: Colors.green[400],
                      highlightedBorderColor: Colors.green[400],
                      child: Text('Scrap'),
                    ),
                    OutlineButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      borderSide: BorderSide(color: Colors.red[400]),
                      textColor: Colors.red[400],
                      highlightedBorderColor: Colors.red[400],
                      child: Text('Cancel'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -60,
          child: Icon(
            Icons.warning_outlined,
            color: Theme.of(context).primaryColor,
            size: 100,
          ),
        ),
      ],
    );
  }
}
