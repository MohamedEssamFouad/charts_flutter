import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Model/CovidData.dart';

class Covidservices{
  final String baseUrl = 'https://disease.sh/v3/covid-19/historical/all?lastdays=30';

  Future<CovidData>fetchCovidData()async{
    final response=await http.get(Uri.parse(baseUrl));
    if(response.statusCode==200){
      final data=jsonDecode(response.body);
      return CovidData.fromJson(data);
    }else{
      throw Exception('Failed ');
    }
  }

}