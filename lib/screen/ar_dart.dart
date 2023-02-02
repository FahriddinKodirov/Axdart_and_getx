import 'package:ardart_app/bloc/axdart/ax_dart.dart';
import 'package:ardart_app/data/api/api_service.dart';
import 'package:ardart_app/data/model/companies_model/companies.dart';
import 'package:ardart_app/data/repositories/repository.dart';
import 'package:ardart_app/screen/getx_page.dart';
import 'package:flutter/material.dart';

class ArDart extends StatefulWidget {
  const ArDart({super.key});

  @override
  State<ArDart> createState() => _ArDartState();
}

class _ArDartState extends State<ArDart> {
  final AxDart _apiData =
      AxDart(companiesRepo: CompaniesRepo(apiService: ApiService()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AxDart'),
        actions: [
          IconButton(onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context) => const GetxPage()));
          }, icon:const Icon(Icons.looks_two_outlined))
        ],
      ),
      body: StreamBuilder(
          stream: _apiData.apiData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              Text(snapshot.error.toString());
            }
            if (snapshot.hasData) {
              Companies companies = snapshot.data!;
              return ListView.builder(
                itemCount: companies.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(companies.data[index].carModel),
                    trailing: Image.network(companies.data[index].logo),
                    subtitle: Text(companies.data[index].averagePrice.toString()),
                    
                  );
                },
              );
            }
            return const SizedBox();
          }),
    );
  }
}
