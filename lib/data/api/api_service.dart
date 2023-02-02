import 'package:ardart_app/data/model/companies_model/companies.dart';
import 'package:ardart_app/data/model/my_respon/my_response.dart';
import 'package:dio/dio.dart';

import 'api_client.dart';

class ApiService extends ApiClient {
  
  Future<MyResponse> getSingleCompanies() async {
    MyResponse myResponse = MyResponse(error: "");
    
    try {
      Response response = await dio.get("${dio.options.baseUrl}/companies");
      if (response.statusCode == 200) {
        myResponse.data = Companies.fromJson(response.data);
      }
    } catch (err) {
      myResponse.error = err.toString();
    }

    return myResponse;
  }

 
}