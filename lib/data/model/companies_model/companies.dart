import 'package:ardart_app/data/model/companies_model/data_model.dart';

class Companies {
  List<DataModel> data;

  Companies({
    required this.data,
  });

factory Companies.fromJson(Map<String, dynamic> jsonData){
  return Companies(
    data: (jsonData['data'] as List).map((json) => DataModel.fromJson(json)).toList());
}
}