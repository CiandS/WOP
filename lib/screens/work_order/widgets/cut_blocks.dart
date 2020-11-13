import 'package:flutter/material.dart';


class CutBlocks extends StatelessWidget {

  int _value = 1;


@override
  Widget build(BuildContext context) {
    return Center(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text ("Cut Blocks\n", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text ("Processing Amount", style: TextStyle(fontSize: 24)),
            DropdownButton(
              value: _value,
              items: [
                DropdownMenuItem(
                  child: Text("First Item"),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text("Second Item"),
                  value: 2,
                ),
                DropdownMenuItem(
                    child: Text("Third Item"),
                    value: 3
                ),
                DropdownMenuItem(
                    child: Text("Fourth Item"),
                    value: 4
                )
              ],
            )]
        )
    );
}
}
