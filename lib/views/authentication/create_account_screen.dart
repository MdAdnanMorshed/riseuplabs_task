


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_assignment/repositries/rest_api.dart';
import 'package:test_assignment/views/common_widgets/TextFieldContainerWidget.dart';

import 'login_screen.dart';

class CreateAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CreateAccount(),
      ),
    );
  }
}

class CreateAccount extends StatefulWidget {
  CreateAccount({
    Key key,
  }) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  var _mailAddressController = TextEditingController();
  var _passwordController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  String _phone = '';
  String _password = '';
  bool _obscureTextNewPass = true;
  IconData _iconVisibleNewPass = Icons.visibility_off;

  void _toggleNewPass() {
    setState(() {
      _obscureTextNewPass = !_obscureTextNewPass;
      if (_obscureTextNewPass == true) {
        _iconVisibleNewPass = Icons.visibility_off;
      } else {
        _iconVisibleNewPass = Icons.visibility;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: size.width / 2),
                  Text('Create Account '),
                  SizedBox(height: size.width / 10),
                  _textField(
                      controller: _mailAddressController,
                      icon: Icons.email,
                      isObsecureText: false,
                      maxlines: 1,
                      isHidTap: false,
                      hint: 'someone@pussport.com',
                      forr: 'mail',
                      isEmptyMsg: 'Enter your mail address ',
                      keyboardType: TextInputType.text),
                  SizedBox(
                    height: 10,
                  ),
                  _textField(
                      controller: _passwordController,
                      icon: Icons.lock,
                      maxlines: 1,
                      isObsecureText: _obscureTextNewPass,
                      isHidTap: true,
                      hint: 'Enter password',
                      forr: 'pass',
                      isEmptyMsg: 'Enter your Password ',
                      keyboardType: TextInputType.text),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _createAccount(context);
                    },
                    child: Text('Register '),
                  ),
                  SizedBox(
                    height: size.width * 0.15,
                  ),
                  InkWell(
                      onTap: (){
                        Get.to(LoginScreen());
                      },
                      child: Text('Already Have an Account? Login Now')),
                  SizedBox(
                    height: size.height * 0.15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _textField(
      {controller,
        hint,
        icon,
        maxlines,
        forr,
        bool isObsecureText,
        isHidTap,
        isEmptyMsg,
        keyboardType}) {
    return TextFieldContainerWidget(
      child: TextFormField(
        style: TextStyle(color: Colors.green),
        controller: controller,
        obscureText: isObsecureText,
        keyboardType: keyboardType,
        maxLines: maxlines,
        decoration: InputDecoration(
            icon: Icon(icon, color: Colors.green),
            hintText: hint,
            hintStyle: TextStyle(color: Colors.green),
            border: InputBorder.none,
            suffixIcon: isHidTap == true
                ? IconButton(
                icon: Icon(_iconVisibleNewPass,
                    color: Colors.green, size: 20),
                onPressed: () {
                  _toggleNewPass();
                })
                : IconButton(
                icon:
                Icon(_iconVisibleNewPass, color: Colors.white, size: 0),
                onPressed: () {
                  _toggleNewPass();
                })),
        validator: (value) {
          return _validate(value, forr, isEmptyMsg);
        },
        onSaved: (newValue) {
          return _save(newValue, forr);
        },
      ),
    );
  }

  _validate(String value, String forr, String isEmptyMsg) {
    if (value.isEmpty) {
      return isEmptyMsg;
    }
    if (forr == 'pass' && value.length < 6) {
      return 'Incorrect password';
    }
    return null;
  }

  void _createAccount(context) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Map<String, dynamic> bodyMap = {
        "address": _mailAddressController.text,
        "password": _passwordController.text
      };
      print('bodyMap'+bodyMap.toString());
      RestApiRepository().createAccount(bodyMap).then((value) {
        if (value) {
          Get.snackbar('Success', 'Register has successFul');
        } else {
          Get.snackbar('Error', 'Register has error');
        }
      });
    }
  }

  _save(String newValue, forr) {
    if (forr == 'phone') {
      return _phone = newValue;
    }
    if (forr == 'pass') {
      return _password = newValue;
    }
  }
}
