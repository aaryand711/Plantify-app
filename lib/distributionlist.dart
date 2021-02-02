import 'package:flutter/material.dart';
import 'package:plant_app/fetchdata.dart';
import 'package:plant_app/services.dart';
import 'constants.dart';
import 'package:plant_app/distributions.dart';
import 'package:plant_app/distributionservices.dart';

class DistributionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: FutureBuilder(
        future: DistributionsServices(distributionurl).getDistribution(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Datum> data = snapshot.data;
            return Container(
              height: 200,
              child: ListView.builder(
                itemCount: data.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if(data[index].speciesCount!=0){
                    return ListTile(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> FetchData(SetUrl(data[index].links.plants).getUrl())));
                      },
                      title: Text(
                        data[index].name,
                      ),
                      subtitle: Text(data[index].speciesCount.toString()),
                    );
                  }else
                    return Container();
                },
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
