import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_assignment/controllers/domain_controller.dart';
import 'package:test_assignment/models/domain_list_model.dart';

class DomainScreen extends StatelessWidget {
  final DomainController _domainController = Get.put(DomainController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Domains'),
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
                  return buildDomainUI(domain);
                });
          }
        }),
      ),
    );
  }

  ///domain list UI
  Widget buildDomainUI(HydraMember data) {
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

}
