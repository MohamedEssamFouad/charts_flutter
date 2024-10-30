import 'package:freezed_annotation/freezed_annotation.dart';
import '../Model/CovidData.dart';

part 'CovidStates.freezed.dart';

@freezed
class CovidState with _$CovidState {
  const factory CovidState.initial() = Initial;
  const factory CovidState.loading() = Loading;
  const factory CovidState.loaded(CovidData covidData, {int? touchedIndex}) = Loaded;
  const factory CovidState.error(String message) = Error;
}
