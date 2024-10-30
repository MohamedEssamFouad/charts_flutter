import 'package:charts_flutter/Repository/Repo.dart';
import 'package:charts_flutter/WebService/CovidServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Presention/Views/Screens/CovidHomeChart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => Covidservices()),
        RepositoryProvider(
          create: (context) => CovidRepo(covidservices: context.read<Covidservices>()),
        ),
      ],
      child: MaterialApp(
        title: 'COVID-19 Chart',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: CovidPieChart(),
      ),
    );
  }
}
