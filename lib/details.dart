import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/plants.dart';
import 'package:plant_app/services.dart';

class DetailPage extends StatelessWidget {
  final String noimg =
      "https://elitescreens.com/images/product_album/no_image.png";
  final Datum datum;

  DetailPage(this.datum);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(178, 216, 216, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(178, 216, 216, 1),
        elevation: 0,
      ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0,0),
                    spreadRadius: 2,
                    blurRadius: 5
                  )
                ]
              ),
              width: MediaQuery.of(context).size.width*0.7 ,
              height: MediaQuery.of(context).size.height*0.4,
              child: Image.network(datum.imageUrl==null?noimg:datum.imageUrl,
                fit: BoxFit.cover,),
            ),
            Text(
              CheckNull(datum.commonName).checkNull(),
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(
                  color:
                  Color.fromRGBO(0, 128, 128, 1)),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.42,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical:5),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Scientific Name',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(
                              color:
                              Color.fromRGBO(0, 128, 128, 1)),
                        ),
                        Text(
                          CheckNull(datum.scientificName).checkNull().toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(
                              color:
                              Color.fromRGBO(0, 128, 128, 1)),
                        )
                      ],
                    ),
                    Divider(
                      color: Color.fromRGBO(0, 128, 128, 1),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Family',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(
                              color:
                              Color.fromRGBO(0, 128, 128, 1)),
                        ),
                        Text(
                          CheckNull(datum.family).checkNull().toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(
                              color:
                              Color.fromRGBO(0, 128, 128, 1)),
                        )
                      ],
                    ),
                    Divider(
                      color: Color.fromRGBO(0, 128, 128, 1),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Genus',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(
                              color:
                              Color.fromRGBO(0, 128, 128, 1)),
                        ),
                        Text(
                          CheckNull(datum.genus).checkNull().toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(
                              color:
                              Color.fromRGBO(0, 128, 128, 1)),
                        )
                      ],
                    ),
                    Divider(
                      color: Color.fromRGBO(0, 128, 128, 1),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Family Common Name',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(
                              color:
                              Color.fromRGBO(0, 128, 128, 1)),
                        ),
                        Text(
                          CheckNull(datum.familyCommonName).checkNull().toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(
                              color:
                              Color.fromRGBO(0, 128, 128, 1)),
                        )
                      ],
                    ),
                    Divider(
                      color: Color.fromRGBO(0, 128, 128, 1),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Slug',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(
                              color:
                              Color.fromRGBO(0, 128, 128, 1)),
                        ),
                        Text(
                          CheckNull(datum.slug).checkNull().toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(
                              color:
                              Color.fromRGBO(0, 128, 128, 1)),
                        )
                      ],
                    ),
                    Divider(
                      color: Color.fromRGBO(0, 128, 128, 1),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Year',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(
                              color:
                              Color.fromRGBO(0, 128, 128, 1)),
                        ),
                        Text(
                          CheckNull(datum.year.toString()).checkNull(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(
                              color:
                              Color.fromRGBO(0, 128, 128, 1)),
                        )
                      ],
                    ),
                    Divider(
                      color: Color.fromRGBO(0, 128, 128, 1),
                    ),

                    Text(
                      'Synonyms ',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(
                          color:
                          Color.fromRGBO(0, 128, 128, 1)),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      child: ListView.builder(
                        itemCount: datum.synonyms.length,
                        itemBuilder:(context,num){
                          return Text('${num+1} - ${CheckNull(datum.synonyms[num]).checkNull()}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(
                                color:
                                Color.fromRGBO(0, 128, 128, 1)),);
                        },
                      ),
                    ),
                    Divider(
                      color: Color.fromRGBO(0, 128, 128, 1),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Author',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(
                              color:
                              Color.fromRGBO(0, 128, 128, 1)),
                        ),
                        Text(
                          CheckNull(datum.author.toString()).checkNull().toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(
                              color:
                              Color.fromRGBO(0, 128, 128, 1)),
                        )
                      ],
                    ),
                    Divider(
                      color: Color.fromRGBO(0, 128, 128, 1),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Bibliography',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(
                              color:
                              Color.fromRGBO(0, 128, 128, 1)),
                        ),
                        Text(
                          CheckNull(datum.bibliography).checkNull().toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(
                              color:
                              Color.fromRGBO(0, 128, 128, 1)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }
}
