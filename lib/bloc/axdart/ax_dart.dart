import 'package:ardart_app/data/model/companies_model/companies.dart';
import 'package:ardart_app/data/model/my_respon/my_response.dart';
import 'package:ardart_app/data/repositories/repository.dart';
import 'package:rxdart/rxdart.dart';

class AxDart {
  final CompaniesRepo companiesRepo;

  AxDart({required this.companiesRepo}){
    fetchApidate();
  }

  final _apiData = BehaviorSubject<Companies>();
  final _errorUi = BehaviorSubject<String>();

  Stream<Companies> get apiData => _apiData.stream;

  void fetchApidate() async {
    MyResponse myResponse = await companiesRepo.getSingleCompanies();
    if (myResponse.error.isEmpty) {
      _apiData.sink.add(myResponse.data);
    } else {
      _errorUi.sink.add(myResponse.error);
      _apiData.sink.addError(myResponse.error);
    }
  }
}
