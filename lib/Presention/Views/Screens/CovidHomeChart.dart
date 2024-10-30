import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../Bloc/CovidBloc.dart';
import '../../../Bloc/CovidEvents.dart';
import '../../../Bloc/CovidStates.dart';
import '../../../Model/CovidData.dart';
import '../../../Repository/Repo.dart';
import '../Widgets/ChartsData.dart';
import '../Widgets/legend.dart';

class CovidPieChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('COVID-19 Chart')),
      body: BlocProvider(
        create: (context) => CovidBloc(context.read<CovidRepo>())..add(const FetchData()),
        child: BlocBuilder<CovidBloc, CovidState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (covidData, touchedIndex) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 300,
                    child: PieChart(
                      PieChartData(
                        sections: CovidPieChartData.createSections(covidData, touchedIndex: touchedIndex ?? -1),
                        centerSpaceRadius: 40,
                        sectionsSpace: 2,
                        pieTouchData: PieTouchData(
                          touchCallback: (touchEvent, pieTouchResponse) {//check if the section touched or nott
                            if (pieTouchResponse != null &&
                                pieTouchResponse.touchedSection != null) {
                              context.read<CovidBloc>().add(UpdateTouchedIndex(
                                  pieTouchResponse.touchedSection!.touchedSectionIndex));
                            } else {
                              context.read<CovidBloc>().add(const UpdateTouchedIndex(-1));
                            }
                          },
                        ),
                      ),
                      swapAnimationDuration: const Duration(milliseconds: 1000),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildLegendItem(Colors.blue, 'Cases'),
                      const SizedBox(width: 16),
                      buildLegendItem(Colors.red, 'Deaths'),
                      const SizedBox(width: 16),
                      buildLegendItem(Colors.green, 'Recovered'),
                    ],
                  ),
                ],
              ),
              error: (message) => Center(child: Text(message)),
            );
          },
        ),
      ),
    );
  }
}
