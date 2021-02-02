import 'package:flutter/material.dart';
import 'package:plant_app/fetchdata.dart';



class Searchresult extends StatelessWidget {
  final String search;
  Searchresult(this.search);
  String setSearchUrl() {
    final searchurl =
        'https://trefle.io/api/v1/plants/search?token=usSbOKFJPSypcFW7zyU-Z08rx9DBuODZZ1LzktdhA1Y&q=' +
            search;
    return searchurl;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FetchData(setSearchUrl()),
    );
  }
}
