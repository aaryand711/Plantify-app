
import 'package:flutter/material.dart';
import 'package:plant_app/listviewcontent.dart';
import 'package:plant_app/plants.dart';
import 'package:plant_app/services.dart';

class FetchData extends StatelessWidget {
  final String url;

  FetchData(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(178, 216, 216, 1),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Color.fromRGBO(178, 216, 216, 1),
        ),
        title: Text('Plants',
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: Color.fromRGBO(178, 216, 216, 1))),
      ),
      body: FutureBuilder(
          future: HttpService(url).getPlants(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Plant plant = snapshot.data;
              List<Datum> data = plant.data;
              PlantLinks link = plant.links;
              return ListViewContent(data,link);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
