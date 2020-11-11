import 'package:flutter/material.dart';
import 'package:getflutter/components/accordian/gf_accordian.dart';
import 'package:work_order_process/screens/work_order/work_order.dart';

class WO_HistoryPage extends StatefulWidget {
  @override
  _WO_HistoryState createState() => new _WO_HistoryState();
}
class _WO_HistoryState extends State<WO_HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, new MaterialPageRoute(
                builder: (context) => WorkOrderPage()
            ));
          },),
        appBar: AppBar(
          title: Text("Work Order History"),
        ),
       body: Container(
         child: Center(
           child: Column(
             children: <Widget> [
                GFAccordion(
                  collapsedIcon: Icon(Icons.add),
                  expandedIcon: Icon(Icons.minimize),
                  title: 'JDE Product',
                  content:
                  'Turpis architecto morbi, senectus, hac ratione facere nonummy nascetur fugiat! Inceptos explicabo. Aliquid non aut malesuada labore lobortis felis sociis.',
               ),
               GFAccordion(
                 title: 'Title Z',
                 content:
                 'Turpis architecto morbi, senectus, hac ratione facere nonummy nascetur fugiat! Inceptos explicabo. Aliquid non aut malesuada labore lobortis felis sociis.',
               ),
               GFAccordion(
                 title: 'Title Z',
                 content:
                 'Turpis architecto morbi, senectus, hac ratione facere nonummy nascetur fugiat! Inceptos explicabo. Aliquid non aut malesuada labore lobortis felis sociis.',
               )
             ]
           )
           ),
         ),
      ));

  }


}