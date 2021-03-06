import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_assignment/repositries/rest_api.dart';
import 'package:test_assignment/views/authentication/create_account_screen.dart';
import 'package:test_assignment/views/common_widgets/TextFieldContainerWidget.dart';
import 'package:test_assignment/views/domain_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LoginPageBody(),
      ),
    );
  }
}

class LoginPageBody extends StatefulWidget {
  LoginPageBody({
    Key key,
  }) : super(key: key);

  @override
  _LoginPageBodyState createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  var _mailController = TextEditingController();
  var _passwordController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  String _mail = '';
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
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[


                  Image.asset('assets/app_images/logo.jpg'),

                  Text('Login'),
                  _textField(
                      controller: _mailController,
                      icon: Icons.email,
                      isObsecureText: false,
                      maxlines: 1,
                      isHidTap: false,
                      hint: 'Enter Address',
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
                      _signInUser(context);
                    },
                    child: Text('Login'),
                  ),
                  SizedBox(
                    height: size.width * 0.15,
                  ),
                  InkWell(
                      onTap: (){
                        Get.to(CreateAccountScreen());
                      },
                      child: Text('Create an account here')),
                  SizedBox(
                    height: size.width * 0.15,
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

  void _signInUser(context) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      /*
      "address": "adnan@pussport.com",
        "password": "12345678"
       */
      Map<String, dynamic> loginMap = {
        "address": _mailController.text,
        "password": _passwordController.text
      };
      print('loginMap'+loginMap.toString());
      RestApiRepository().login(loginMap).then((value) {
        if (value) {
          Get.to(DomainScreen());
          Get.snackbar('Success', 'Login has successful!');
        } else {
          Get.snackbar('Error ', 'Login has wrong!');
        }
      });
    }
  }

  _save(String newValue, forr) {
    if (forr == 'mail') {
      return _mail = newValue;
    }
    if (forr == 'pass') {
      return _password = newValue;
    }
  }
}
