
import 'dart:convert';

import 'package:get/get.dart';
import 'package:test_assignment/apiurl_link.dart';
import 'package:test_assignment/bd_helpers/local_store_token.dart';
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
    print('domain response res :' + response.bodyString.toString());

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

  /// login done
  Future<bool> login(Map<String,dynamic> loginBody)async{
    bool isLogin=true;
    final Response response =
    await post( ApiUrl.authTokenByMapPOSTAPI,loginBody);

    int code = response.statusCode;
    print('domain response code :' + code.toString());
    print('domain response res :' + response.bodyString);
    if (code == 200 || code == 201 || code == 202) {
       var token =response.body['token'];
      await LocalStoreToken.object.setToken(token);
      print('token :'+response.body['token']);
      return isLogin=true;
    }

    return isLogin;
  }

  /// crate Account done
  Future<bool> createAccount(Map<String,dynamic> bodyMap)async{
    bool isLogin=true;
    final Response response =
    await post( ApiUrl.createDomainAccountPOSTAPI,bodyMap);

    int code = response.statusCode;
    print('crate response code :' + code.toString());
    print('create response res :' + response.bodyString);
    if (code == 200 || code == 201 || code == 202) {
      return isLogin=true;
    }
    return isLogin;
  }

}