import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('My Name is adnan morshed'),
                Text('adnanmorshed118@gmail.com'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
