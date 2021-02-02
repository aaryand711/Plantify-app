import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/details.dart';
import 'package:plant_app/plants.dart';
import 'package:plant_app/services.dart';

class CardContent extends StatelessWidget {
  final String url;
  CardContent(this.url);
  final String noimg = "https://elitescreens.com/images/product_album/no_image.png";
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: HttpService(url).getPlants(),
        builder: (context ,snapshot){
          if(snapshot.hasData){
            print('has data');
            Plant plant = snapshot.data;
            List<Datum> data  = plant.data ;
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 190,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context , index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=> DetailPage(data[index])));
                    },
                    child: Card(
                      margin: EdgeInsets.symmetric(horizontal: 6,vertical: 3),
                      elevation: 5,
                      color: Color.fromRGBO(0 , 128 , 128, 1),
                      child: Column(
                        children: [
                          Container(
                            height: 140,
                            width:128,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(data[index].imageUrl!=null?data[index].imageUrl:noimg),
                              ),
                            ),
                          ),
                          Container(
                            width: 120,
                            margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                            child: Text(CheckNull(data[index].commonName).checkNull(),
                            overflow:TextOverflow.clip,
                            softWrap: true,
                            style: Theme.of(context).textTheme.bodyText1.copyWith(color: Color.fromRGBO(178, 216, 216, 1))),
                          ),
                        ],
                      ),
                    ),
                  );
                },itemCount: 10,
              ),
            );
          }else{
            print('no data');
            return Center(child: CircularProgressIndicator());
          }
        }
    );
  }
}





