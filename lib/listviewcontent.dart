import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/details.dart';
import 'package:plant_app/fetchdata.dart';
import 'package:plant_app/plants.dart';
import 'package:plant_app/services.dart';

class ListViewContent extends StatelessWidget {
  final List<Datum> data;
  final PlantLinks link;

  final String noimg =
      "https://elitescreens.com/images/product_album/no_image.png";

  ListViewContent(this.data, this.link);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 2,
              color: Color.fromRGBO(178, 216, 216, 1),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(data[index])));
                },
                isThreeLine: true,
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(data[index].imageUrl==null?noimg:data[index].imageUrl),
                ),
                title: Text(CheckNull(data[index].commonName).checkNull(),
                  style: TextStyle(fontWeight: FontWeight.w500,color: Color.fromRGBO(0, 128, 128, 1))),
                subtitle: Text('Genus\n${CheckNull(data[index].genus).checkNull()}',
                    style: TextStyle(color: Color.fromRGBO(0, 128, 128, 1))),
                trailing: Text("Family : ${CheckNull(data[index].family).checkNull()}",
                    style: TextStyle(color: Color.fromRGBO(0, 128, 128, 1))),
              ),
            );
          },
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: NavigationButton(link).button(context),
        )
      ],
    );
  }
}
class NavigationButton{
  final PlantLinks links;
  NavigationButton(this.links);
  Widget button(BuildContext context){
    if(links.prev==null){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlatButton(
            color: Color.fromRGBO(0, 128, 128, 1),
            shape: StadiumBorder(),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          FetchData(SetUrl(links.next).getUrl())));
            },
            child: Container(
              width: MediaQuery.of(context).size.width*0.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('next',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(color: Color.fromRGBO(178, 216, 216, 1)),),
                  Icon(
                    Icons.navigate_next,
                    color: Color.fromRGBO(178, 216, 216, 1),
                  ),
                ],
              ),
            ),
          )
        ],
      );
    }else if(links.next==null){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlatButton(
            color: Color.fromRGBO(0, 128, 128, 1),
            shape: StadiumBorder(),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          FetchData(SetUrl(links.next).getUrl())));
            },
            child: Container(
              width: MediaQuery.of(context).size.width*0.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.navigate_before,
                    color: Color.fromRGBO(178, 216, 216, 1),
                  ),
                  Text('previous',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(color: Color.fromRGBO(178, 216, 216, 1)),),
                ],
              ),
            ),
          )
        ],
      );
    }else{
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FlatButton(
            color: Color.fromRGBO(0, 76, 76, 1).withOpacity(0.8),
            shape: StadiumBorder(),

            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          FetchData(SetUrl(links.prev).getUrl())));
            },
            child: Container(
              width: MediaQuery.of(context).size.width*0.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.navigate_before,
                    color: Color.fromRGBO(178, 216, 216, 1),
                  ),
                  Text('previous',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(color: Color.fromRGBO(178, 216, 216, 1)),),
                ],
              ),
            ),
          ),
          FlatButton(
            color: Color.fromRGBO(0, 76, 76, 1).withOpacity(0.8),
            shape: StadiumBorder(),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          FetchData(SetUrl(links.next).getUrl())));
            },
            child: Container(
              width: MediaQuery.of(context).size.width*0.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('next',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(color: Color.fromRGBO(178, 216, 216, 1)),),
                  Icon(
                    Icons.navigate_next,
                    color: Color.fromRGBO(178, 216, 216, 1),
                  ),
                ],
              ),
            ),
          )
        ],
      );
    }
  }
}