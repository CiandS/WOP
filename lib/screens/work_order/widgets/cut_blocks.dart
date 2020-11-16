import 'package:flutter/material.dart';


class CutBlocks extends StatefulWidget {
  @override
  _CutBlocksState createState() => _CutBlocksState();
}

class _CutBlocksState extends State<CutBlocks> {

  int _value = 1;
  int _valuetwo = 1;

@override
  Widget build(BuildContext context) {
    return Center(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text ("Cut Blocks\n", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text ("Processing Machine", style: TextStyle(fontSize: 20)),
            DropdownButton(
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
                DropdownMenuItem(
                    child: Text("Machine 3"),
                    value: 3
                ),
                DropdownMenuItem(
                    child: Text("Machine 4"),
                    value: 4
                )
              ],
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                }),
            Text ("Quality Machine", style: TextStyle(fontSize: 20,)),
            DropdownButton(
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
                  DropdownMenuItem(
                      child: Text("Machine 3"),
                      value: 3
                  ),
                  DropdownMenuItem(
                      child: Text("Machine 4"),
                      value: 4
                  )
                ],
                onChanged: (value) {
                  setState(() {
                    _valuetwo = value;
                  });
                })
          ]
        )
    );
}
}
