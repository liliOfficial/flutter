import 'package:flutter/material.dart';
import 'package:flutter_app/cashrewards/data/search.dart';

class SearchProvider with ChangeNotifier {
  List searchProvider = SEARCHRESULT;

  void searchData(String keyword) {
    searchProvider = keyword == ''
        ? SEARCHRESULT
        : SEARCHRESULT.where((data) {
            return data['name'].toLowerCase().contains(keyword.toLowerCase());
          }).toList();
    notifyListeners();
  }
}
