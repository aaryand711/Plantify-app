import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:plant_app/distributions.dart';
class DistributionsServices{
  final String disturl;
  DistributionsServices(this.disturl);
  Future<List<Datum>> getDistribution()async{
    http.Response resp = await http.get(disturl);
    if(resp.statusCode == 200){
      Map <String , dynamic> decodejson = json.decode(resp.body);
      Distribution distribution = Distribution.fromJson(decodejson);
      List<Datum> data = distribution.data;
      return data;
    }else{
      throw ' no data ' ;
    }
  }
}