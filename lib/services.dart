import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:plant_app/plants.dart';

class HttpService {

  final String postsURL;
  HttpService(this.postsURL);


  Future<Plant> getPlants()async {
    http.Response res = await http.get(postsURL);
    if (res.statusCode == 200) {
      Map<String, dynamic> decodejson  = json.decode(res.body);
      Plant plant = Plant.fromJson(decodejson);
      return plant;
    } else {
      throw "Can't get posts.";
    }
  }
}

class SetUrl{
  final String website ='https://trefle.io';
  final String token = '&token=usSbOKFJPSypcFW7zyU-Z08rx9DBuODZZ1LzktdhA1Y';
  final String url;
  SetUrl(this.url);
  String getUrl(){
    String newurl = website + url + token ;
    return newurl;
  }
}

class CheckNull{
  final String name;
  CheckNull(this.name);
  String checkNull(){
    if(name==null){
      return 'N/A';
    }else{
      return name;
    }
  }
}
