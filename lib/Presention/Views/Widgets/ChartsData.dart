import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../Model/CovidData.dart';

class CovidPieChartData {
  static List<PieChartSectionData> createSections(CovidData covidData, {int touchedIndex = -1}) {
    final totalCases = covidData.cases.values.reduce((a, b) => a + b);
    final totalDeaths = covidData.deaths.values.reduce((a, b) => a + b);
    final totalRecovered = covidData.recovered.values.reduce((a, b) => a + b);
    final total = totalCases + totalDeaths + totalRecovered;

    return [
      PieChartSectionData(
        color: Colors.blue,
        value: (totalCases / total) * 100,
        title: '${(totalCases / total * 100).toStringAsFixed(1)}%',
        radius: touchedIndex == 0 ? 70 : 60,
        titleStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      PieChartSectionData(
        color: Colors.red,
        value: (totalDeaths / total) * 100,
        title: '${(totalDeaths / total * 100).toStringAsFixed(1)}%',
        radius: touchedIndex == 1 ? 70 : 60,
        titleStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      PieChartSectionData(
        color: Colors.green,
        value: (totalRecovered / total) * 100,
        title: '${(totalRecovered / total * 100).toStringAsFixed(1)}%',
        radius: touchedIndex == 2 ? 70 : 60,
        titleStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ];
  }
}
