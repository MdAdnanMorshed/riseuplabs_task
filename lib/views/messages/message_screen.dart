import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_assignment/controllers/domain_controller.dart';
import 'package:test_assignment/controllers/message_controller.dart';
import 'package:test_assignment/models/domain_list_model.dart';

class MessageScreen extends StatelessWidget {
  final MessageController _messageController = Get.put(MessageController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Message List'),
        ),
        body: Obx(() {
          if (_messageController.messageDataLoaded.value == false) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (_messageController.message.isBlank &&
              _messageController.messageDataLoaded.value == true) {
            return Center(child: Text('No Found Data'));
          } else {
            DomainListModel message = _messageController.message.value;
            return buildMessageUI(message);
          }
        }),
      ),
    );
  }

  ///Message list UI
  Widget buildMessageUI(DomainListModel data) {
    return Card(
      elevation: 3,
      child: Container(
        child: Wrap(
          children: <Widget>[
            ListTile(
              onTap: () {},
              title: Text('hydraTemplate :' + data.hydraSearch.hydraTemplate ??
                  'no domain'),
              subtitle:
                  Text('hydraTotalItems :' + data.hydraTotalItems.toString()),
              trailing: Text('Type :' + data.hydraSearch.type ?? 'no type'),
            ),
          ],
        ),
      ),
    );
  }
}
