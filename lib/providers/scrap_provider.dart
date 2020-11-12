import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:work_order_process/models/scrap_details.dart';

class ScrapProvider extends ChangeNotifier {
  List<ScrapDetails> _scrapList = [
    ScrapDetails(
        0, 'A211', 'Scratches', 'INSP_2', 15, 'admin user', DateTime.now()),
    ScrapDetails(
        0, 'A211', 'Scratches', 'INSP_2', 15, 'admin user', DateTime.now()),
  ];

  UnmodifiableListView<ScrapDetails> get scrapList =>
      UnmodifiableListView(_scrapList);

  void addScrap(ScrapDetails scrapDetails) {
    _scrapList.add(scrapDetails);
    notifyListeners();
  }

  void removeAll() {
    _scrapList.clear();
    notifyListeners();
  }
}
