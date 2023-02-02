class DataModel {
  int id;
  int establishedYear;
  int averagePrice;
  String carModel;
  String logo;

  DataModel(
      {required this.id,
      required this.establishedYear,
      required this.averagePrice,
      required this.carModel,
      required this.logo});

  factory DataModel.fromJson(Map<String, dynamic> jsonData) {
    return DataModel(
        id: jsonData['id'] ?? 0,
        establishedYear: jsonData['established_year'] ?? 0,
        averagePrice: jsonData['average_price'] ?? 0,
        carModel: jsonData['car_model'] ?? '',
        logo: jsonData['logo'] ?? '');
  }
}
