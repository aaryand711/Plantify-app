import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/Searchbox.dart';
import 'package:plant_app/cardcontent.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/fetchdata.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(178, 216, 216, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchBoxWithHeading(),
            HeadingText('Plants', 'https://trefle.io/api/v1/plants?page=1&token=usSbOKFJPSypcFW7zyU-Z08rx9DBuODZZ1LzktdhA1Y'),
            CardContent(hommepageurl),
            Divider(),
            HeadingText('Tallest Trees','https://trefle.io/api/v1/plants?filter_not%5Bmaximum_height_cm%5D=null&filter%5Bligneous_type%5D=tree&order%5Bmaximum_height_cm%5D=desc&token=usSbOKFJPSypcFW7zyU-Z08rx9DBuODZZ1LzktdhA1Y'),
            CardContent(tallesttree),
            Divider(),
            HeadingText('Oldest Discoveries', 'https://trefle.io/api/v1/species?order%5Byear%5D=asc&token=usSbOKFJPSypcFW7zyU-Z08rx9DBuODZZ1LzktdhA1Y'),
            CardContent(oldest),
            Divider(),
          ],
        ),
      ),

    );
  }
}
class HeadingText extends StatelessWidget {
  final String headingtext;
  final String linktext;
  HeadingText(this.headingtext,this.linktext);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(headingtext,
              style: Theme.of(context).textTheme.headline5.copyWith(color: Color.fromRGBO(0, 128, 128, 1))
          ),
          FlatButton(
            height: 30,
            minWidth: 70,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => FetchData(linktext)));
            },
            shape:StadiumBorder(),
            color: Color.fromARGB(255, 0, 128, 128),
            child: Text("More",
              style: Theme.of(context).textTheme.bodyText1.copyWith(color: Color.fromRGBO(178, 216, 216, 1)),
            ),
          )
        ],
      ),
    );
  }
}



