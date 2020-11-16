import 'package:flutter/material.dart';

class CutBlocks extends StatefulWidget {
  @override
  _CutBlocksState createState() => _CutBlocksState();
}

class _CutBlocksState extends State<CutBlocks> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        margin: new EdgeInsets.symmetric(horizontal: 80.0),
        decoration: BoxDecoration(color: Colors.redAccent[100]),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Cut Blocks\n",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Text("Cutting Machine", style: TextStyle(fontSize: 20)),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: DropdownButton(
                    value: _value,
                    items: [
                      DropdownMenuItem(
                        child: Text("Machine 1"),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("Machine 2 "),
                        value: 2,
                      ),
                      DropdownMenuItem(child: Text("Machine 3"), value: 3),
                      DropdownMenuItem(child: Text("Machine 4"), value: 4)
                    ],
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only (left: 250, right: 250),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Input Quantity'),
                  keyboardType: TextInputType.number,
                ),
              ),
            ]),
      ),
    ));
  }
}
