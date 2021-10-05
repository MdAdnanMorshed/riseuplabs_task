import 'dart:convert';

import 'package:get/get.dart';
import 'package:test_assignment/apiurl_link.dart';
import 'package:test_assignment/bd_helpers/local_store_token.dart';
import 'package:test_assignment/models/account_list_model.dart';
import 'package:test_assignment/models/domain_list_model.dart';

class RestApiRepository extends GetConnect {

  /// created by @Adnan done
  Future<List<HydraMember>> getDomains() async {
    List<HydraMember> domainList = [];
    final Response response = await get(
        'https://api.mail.tm/domains?page=1' //ApiUrl.domainListGETAPI,
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

  /// login by @Adnan done
  Future<bool> login(Map<String, dynamic> loginBody) async {
    bool isLogin = true;
    final Response response =
        await post(ApiUrl.authTokenByMapPOSTAPI, loginBody);

    int code = response.statusCode;
    print('domain response code :' + code.toString());
    print('domain response res :' + response.bodyString);
    if (code == 200 || code == 201 || code == 202) {
      var token = response.body['token'];
      await LocalStoreToken.object.setToken(token);
      print('token :' + response.body['token']);
      return isLogin = true;
    }

    return isLogin;
  }

  /// crate Account by @Adnan done
  Future<bool> createAccount(Map<String, dynamic> bodyMap) async {
    bool isLogin = true;
    final Response response =
        await post(ApiUrl.createDomainAccountPOSTAPI, bodyMap);

    int code = response.statusCode;
    print('crate response code :' + code.toString());
    print('create response res :' + response.bodyString);
    if (code == 200 || code == 201 || code == 202) {
      return isLogin = true;
    }
    return isLogin;
  }

  /// fetch Account list by @Adnan done
  Future<AccountListModel> getAccounts() async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + LocalStoreToken.object.getToken() ?? ''
    };
    AccountListModel accountInfo;
    final Response response =
        await get(ApiUrl.domainAccountListGETAPI, headers: headers);
    int code = response.statusCode;
    print('accounts response code :' + code.toString());
    print('accounts response res :' + response.bodyString.toString());

    if (code == 200 || code == 201 || code == 202) {
      accountInfo = AccountListModel.fromJson(jsonDecode(response.bodyString));
      return accountInfo;
    } else {
      print('RestApiRepository.getAccounts api called failed: ' +
          response.statusCode.toString());
    }
  }

  /// fetch message list by @Adnan done
  Future<DomainListModel> getMessages() async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + LocalStoreToken.object.getToken() ?? ''
    };
    DomainListModel messageInfo;
    final Response response =
    await get('https://api.mail.tm/messages?page=1', headers: headers);
    int code = response.statusCode;
    print('message response code :' + code.toString());
    print('message response res :' + response.bodyString.toString());

    /*if (code == 200 || code == 201 || code == 202) {
      messageInfo = DomainListModel.fromJson(jsonDecode(response.bodyString));
      return messageInfo;
    } else {
      print('RestApiRepository.getMessages api called failed: ' +
          response.statusCode.toString());

    }*/
  }
}
