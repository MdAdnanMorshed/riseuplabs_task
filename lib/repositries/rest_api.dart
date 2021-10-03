
import 'dart:convert';

import 'package:get/get.dart';
import 'package:test_assignment/models/domain_list_model.dart';

class RestApiRepository extends GetConnect {

  /// created by @Adnan done
  Future<List<HydraMember>> getDomains() async {
    List<HydraMember> domainList = [];
    final Response response =
    await get('https://api.mail.tm/domains?page=1' //ApiUrl.domainListGETAPI,
    );

    int code = response.statusCode;

    print('domain response code :' + code.toString());
    print('domain response res :' + response.bodyString);

    if (code == 200 || code == 201 || code == 202) {
      for (var domains in jsonDecode(response.bodyString)['hydra:member']) {
        domainList.add(HydraMember.fromJson(domains));
      }
      return domainList;
    } else {
      print('RestApiRepository.getDomains api called failed: ' +
          response.statusCode.toString());
    }
    return [];
  }

  /// login
  Future<bool> login(Map<String,dynamic> loginBody)async{
    bool isLogin=true;


    return isLogin;
  }


}