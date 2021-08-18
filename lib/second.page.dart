import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('second Page'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Next Page>>'),
          style: ElevatedButton.styleFrom(
            primary: Colors.indigo.shade900,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/thirdPage');
          },
        ),
      ),
    );
  }
}
