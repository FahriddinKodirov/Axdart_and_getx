
import 'package:ardart_app/data/api/api_service.dart';
import 'package:ardart_app/data/model/my_respon/my_response.dart';

class CompaniesRepo {
  CompaniesRepo({required this.apiService});

  final ApiService apiService;

  Future<MyResponse> getSingleCompanies() =>
      apiService.getSingleCompanies();

}