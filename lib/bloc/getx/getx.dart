import 'package:ardart_app/data/model/companies_model/companies.dart';
import 'package:ardart_app/data/model/companies_model/data_model.dart';
import 'package:ardart_app/data/model/my_respon/my_response.dart';
import 'package:ardart_app/data/repositories/repository.dart';
import 'package:get/get.dart';

class GetxData extends GetxController {
  final CompaniesRepo companiesRepo;

  GetxData({required this.companiesRepo}){
    fetchProducts();
  }

  final Rx<Companies> model = Companies(data: []).obs;
  final Rx<String> error = ''.obs;

  fetchProducts() async {
     MyResponse myResponse = await companiesRepo.getSingleCompanies();
    if (myResponse.error.isEmpty) {
      model.value = myResponse.data;
    } else {
      error.value = myResponse.error;
    }
    
  }
}