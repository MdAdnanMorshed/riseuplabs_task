import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_assignment/bd_helpers/local_store_token.dart';
import 'package:test_assignment/views/accounts/account_screen.dart';

import 'views/authentication/login_screen.dart';
import 'views/domain_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:
        //LoginScreen()
        //DomainScreen()
        //AccountScreen()

            LocalStoreToken.object.getToken() != null ||
                    LocalStoreToken.object.getToken() != ''
                ? DomainScreen()
                : LoginScreen());
  }
}
