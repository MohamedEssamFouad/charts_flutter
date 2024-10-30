class CovidData {
  final Map<String, int> cases;
  final Map<String, int> deaths;
  final Map<String, int> recovered;

  CovidData({
    required this.cases,
    required this.deaths,
    required this.recovered,
  });

  // Factory method to create a CovidData instance from JSON
  factory CovidData.fromJson(Map<String, dynamic> json) {
    return CovidData(
      cases: Map<String, int>.from(json['cases']),
      deaths: Map<String, int>.from(json['deaths']),
      recovered: Map<String, int>.from(json['recovered']),
    );
  }

  // Method to convert CovidData instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'cases': cases,
      'deaths': deaths,
      'recovered': recovered,
    };
  }
}
