import 'package:charts_flutter/Repository/Repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'CovidEvents.dart';
import 'CovidStates.dart';

class CovidBloc extends Bloc<CovidEvent, CovidState> {
  final CovidRepo covidRepository;

  CovidBloc(this.covidRepository) : super(const CovidState.initial()) {
    on<FetchData>((event, emit) async {
      emit(const CovidState.loading());

      try {
        final data = await covidRepository.getCoviddata();
        emit(CovidState.loaded(data));
      } catch (e) {
        emit(CovidState.error('Failed to fetch data'));
      }
    });

    on<UpdateTouchedIndex>((event, emit) {
      if (state is Loaded) {
        emit((state as Loaded).copyWith(touchedIndex: event.index));
      }
    });
  }
  }
