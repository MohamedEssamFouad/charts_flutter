import 'package:charts_flutter/WebService/CovidServices.dart';

import '../Model/CovidData.dart';

class CovidRepo{
  final Covidservices covidservices;
  CovidRepo({ required this.covidservices});

  Future<CovidData>getCoviddata(){
    return covidservices.fetchCovidData();

  }
}