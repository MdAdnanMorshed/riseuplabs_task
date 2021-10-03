import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_assignment/controllers/domain_controller.dart';
import 'package:test_assignment/models/domain_list_model.dart';

class AccountScreen extends StatelessWidget {
  final DomainController _domainController = Get.put(DomainController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Account List '),
        ),
        body: Obx(() {
          if (_domainController.domainDataLoaded.value == false) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (_domainController.domainList.isEmpty &&
              _domainController.domainDataLoaded.value == true) {
            return Center(child: Text('No Found Data'));
          } else {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: _domainController.domainList.length,
                itemBuilder: (context, index) {
                  HydraMember domain = _domainController.domainList[index];
                  return buildAccountUI(domain);
                });
          }
        }),
        floatingActionButton: FloatingActionButton(child: createAccount(),),
      ),

    );
  }

  ///account list UI
  Widget buildAccountUI(HydraMember data) {
    return Card(
      elevation: 3,
      child: Container(
        child: Wrap(
          children: <Widget>[
            ListTile(
              onTap: () {},
              title: Text('domain Name :' + data.domain ?? 'no domain'),
              subtitle: Text('date:' + data.createdAt),
              trailing: Text('isActive:' + data.isActive.toString()),
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
        /// todo list
      },
      child: Icon(
        Icons.add,
      ),
    );
  }

}
