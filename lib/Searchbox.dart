import 'package:flutter/material.dart';
import 'package:plant_app/search.dart';

class SearchBoxWithHeading extends StatefulWidget {
  @override
  _SearchBoxWithHeadingState createState() => _SearchBoxWithHeadingState();
}

class _SearchBoxWithHeadingState extends State<SearchBoxWithHeading> {
  static String search ;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height*0.3,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 50,
              bottom: 50,
            ),
            width: double.infinity,
            height: size.height*0.20,
            decoration: BoxDecoration(
                color: Color.fromRGBO(0, 128, 128, 1),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40))
            ),
            child: Center(
              child: Text(
                'Plantify',
                style: Theme.of(context).textTheme.headline3.copyWith(color: Color.fromRGBO(178, 216, 216, 1)),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 25,right: 5),
              margin: EdgeInsets.symmetric(horizontal: 25),
              height: 54,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color.fromRGBO(178, 216, 216, 1),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0,5),
                        blurRadius: 25,
                        color: Color.fromRGBO(0, 76, 76, 1).withOpacity(0.6)
                    )
                  ]
              ),
              child: TextField(
                onChanged: (value) => search = value,
                decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(0, 128, 128, 1).withOpacity(0.6),
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    suffixIcon: IconButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Searchresult(search)));
                        },
                        icon:Icon(Icons.search))
                ),

              ),
            ),
          )
        ],
      ),
    );
  }
}
