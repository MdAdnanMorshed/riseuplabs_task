import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_assignment/controllers/accounts_controller.dart';
import 'package:test_assignment/controllers/domain_controller.dart';
import 'package:test_assignment/models/account_list_model.dart';
import 'package:test_assignment/models/domain_list_model.dart';

import 'create_account_screen.dart';

class AccountScreen extends StatelessWidget {
  final AccountController _accountController = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Account List '),
        ),
        body:
        Obx(() {
          if (_accountController.accountDataLoaded.value == false) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (_accountController.accountInfo.isBlank &&
              _accountController.accountDataLoaded.value == true) {
            return Center(child: Text('No Found Data'));
          } else {
            AccountListModel account= _accountController.accountInfo.value;
            return    buildAccountUI(account);
          }
        }),
        floatingActionButton: FloatingActionButton(child: createAccount(),),
      ),

    );
  }

  /// account list UI
  Widget buildAccountUI(AccountListModel data) {
    return Card(
      elevation: 3,
      child: Container(
        child: Wrap(
          children: <Widget>[
            ListTile(
              onTap: () {},
              title: Text('Id  :' + data.id ?? 'no domain'),
              subtitle: Text(' Address:' + data.address),
              trailing: Text('Status :' + data.isDisabled.toString()),
            ),
          ],
        ),
      ),
    );
  }

  /// create account  FAB
  Widget createAccount() {
    return InkWell(
      onTap: () {
        Get.to(CreateAccountScreen());
        /// todo list
      },
      child: Icon(
        Icons.add,
      ),
    );
  }

}
