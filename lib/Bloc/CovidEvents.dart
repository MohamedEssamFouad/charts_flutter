import 'package:freezed_annotation/freezed_annotation.dart';

part 'CovidEvents.freezed.dart';

@freezed
class CovidEvent with _$CovidEvent {
  const factory CovidEvent.fetchData() = FetchData;
  const factory CovidEvent.updateTouchedIndex(int? index) = UpdateTouchedIndex;
}
