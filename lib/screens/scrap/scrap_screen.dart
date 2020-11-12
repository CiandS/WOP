import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:work_order_process/models/scrap_details.dart';
import 'package:work_order_process/providers/scrap_provider.dart';
import 'package:work_order_process/screens/scrap/widgets/add_to_scrap.dart';

class ScrapScreen extends StatefulWidget {
  @override
  _ScrapScreenState createState() => _ScrapScreenState();
}

class _ScrapScreenState extends State<ScrapScreen> {
  String dropdownScrapValue;
  String dropdownOperationValue;

  Future<void> _showAddToScrap(BuildContext context) {
    return showDialog(
        child: Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.all(10),
            child: StatefulBuilder(builder: (context, setState) {
              return AddToScrap(dropdownScrapValue, dropdownOperationValue);
            })),
        context: context);
  }

  List<DataRow> _buildDataRows(BuildContext context) {
    List<ScrapDetails> scrapDetails =
        Provider.of<ScrapProvider>(context, listen: false).scrapList;
    List<DataRow> dataRows = [];
    scrapDetails.forEach((scrapDetail) {
      dataRows.add(DataRow(
        cells: <DataCell>[
          DataCell(Text(scrapDetail.scrapCode)),
          DataCell(Text(scrapDetail.description)),
          DataCell(Text(scrapDetail.operation)),
          DataCell(Text(scrapDetail.scrapQuantity.toString())),
          DataCell(Text(scrapDetail.scrappedBy)),
          DataCell(Text(DateFormat.yMd().format(scrapDetail.date))),
        ],
      ));
    });
    return dataRows;
  }

  List<DataColumn> _buildDataColumns(BuildContext context) {
    return const <DataColumn>[
      DataColumn(
        label: Text(
          'Scrap Code',
        ),
      ),
      DataColumn(
        label: Text(
          'Description',
        ),
      ),
      DataColumn(
        label: Text(
          'Operation',
        ),
      ),
      DataColumn(
        label: Text(
          'Scrap Qty',
        ),
      ),
      DataColumn(
        label: Text(
          'Scrapped By',
        ),
      ),
      DataColumn(
        label: Text(
          'Date',
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Work Order Process'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.warning,
                    size: 40,
                    color: Colors.red[500],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Product Scrap',
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.grey[500],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              constraints: BoxConstraints(maxHeight: 300),
              alignment: Alignment.topCenter,
              child: Consumer<ScrapProvider>(
                builder: (context, value, child) {
                  return SingleChildScrollView(
                    child: Container(
                      child: DataTable(
                        columns: _buildDataColumns(context),
                        rows: _buildDataRows(context),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerRight,
              constraints: BoxConstraints(maxWidth: 400),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  OutlineButton(
                    onPressed: () {
                      _showAddToScrap(context);
                    },
                    borderSide: BorderSide(color: Colors.green[400]),
                    textColor: Colors.green[400],
                    highlightedBorderColor: Colors.green[400],
                    child: Text('Add'),
                  ),
                  OutlineButton(
                    onPressed: () {},
                    borderSide: BorderSide(color: Colors.red[400]),
                    textColor: Colors.red[400],
                    highlightedBorderColor: Colors.red[400],
                    child: Text('Confirm'),
                  ),
                  OutlineButton(
                    onPressed: () {},
                    borderSide: BorderSide(color: Colors.grey),
                    textColor: Colors.grey,
                    highlightedBorderColor: Colors.grey,
                    child: Text('Cancel'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
