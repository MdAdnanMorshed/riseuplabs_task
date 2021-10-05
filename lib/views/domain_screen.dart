import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_assignment/bd_helpers/local_store_token.dart';
import 'package:test_assignment/controllers/domain_controller.dart';
import 'package:test_assignment/models/domain_list_model.dart';
import 'package:test_assignment/views/authentication/login_screen.dart';
import 'package:test_assignment/views/contact_us.dart';

import 'accounts/account_screen.dart';
import 'messages/message_screen.dart';


class DomainScreen extends StatelessWidget {
  final DomainController _domainController = Get.put(DomainController());

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        drawer:  _buildDrawer(),
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

  Widget _buildDrawer(){
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Stack(
              children: [
                Positioned(
                  bottom: 8.0,
                  left: 4.0,
                  child: Text(
                    "User Address ",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                image: NetworkImage(
                  "https://appmaking.co/wp-content/uploads/2021/08/android-drawer-bg.jpeg",
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(Icons.account_box),
            title: Text("Account List"),
            onTap: () {

              Get.to(AccountScreen());
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text("Message List"),
            onTap: () {
              Get.to(MessageScreen());
            },
          ),
          LocalStoreToken.object.getToken()==null?
          ListTile(
            leading: Icon(Icons.login),
            title: Text("Login/Register"),
            onTap: () {
              Get.to(LoginScreen());
            },
          ):ListTile(
            leading: Icon(Icons.lock),
            title: Text("Logout"),
            onTap: () {
              Get.to(LoginScreen());
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text("Contact"),
            onTap: () {
               Get.to(ContactUs());
            },
          )
        ],
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
              title: Text('Domain Name :' + data.domain ?? 'no domain'),
              subtitle: Text('date:' + data.createdAt),
              trailing: Text('isActive:' + data.isActive.toString()),
            ),
          ],
        ),
      ),
    );
  }

}
