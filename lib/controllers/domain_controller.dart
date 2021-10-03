

import 'package:get/get.dart';
import 'package:test_assignment/models/domain_list_model.dart';
import 'package:test_assignment/repositries/rest_api.dart';

class DomainController extends GetxController{
  RxList<HydraMember> domainList = <HydraMember>[].obs;
  RxBool domainDataLoaded = false.obs;

  @override
  void onInit() {
    domains();
    super.onInit();
  }

  void domains() async{
     var response =await RestApiRepository().getDomains();
     domainList.clear();
     domainList.addAll(response);
     domainDataLoaded.value = true;
  }

}