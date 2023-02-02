import 'package:ardart_app/bloc/getx/getx.dart';
import 'package:ardart_app/data/api/api_service.dart';
import 'package:ardart_app/data/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxPage extends StatefulWidget {
  const GetxPage({super.key});

  @override
  State<GetxPage> createState() => _GetxPageState();
}

class _GetxPageState extends State<GetxPage> {
  final GetxData getxData = Get.put(GetxData(companiesRepo: CompaniesRepo(apiService: ApiService())));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GetxPage')),
      body: Obx(() {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: getxData.model.value.data.length,
            itemBuilder:(context, index) {
              return ListTile(
                title: Text(getxData.model.value.data[index].carModel),
                trailing: Image.network(getxData.model.value.data[index].logo),
                subtitle: Text(getxData.model.value.data[index].establishedYear.toString()),
              );
          },),
        );
      }) ,
    );
  }
}