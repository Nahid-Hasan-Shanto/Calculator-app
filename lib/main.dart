import 'package:a_b_c/second.page.dart';
import 'package:a_b_c/third_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      initialRoute: '/',
      routes: {
        '/secondPage': (context) => SecondPage(),
        '/thirdPage': (context) => ThirdPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double fno = 0;
  double sno = 0;
  double sum = 0;

  sumFunc(String _operator) {
    //print(_operator);
    setState(() {
      if (_operator == '+') {
        sum = fno + sno;
      }
      if (_operator == '-') {
        sum = fno - sno;
      }
      if (_operator == '*') {
        sum = fno * sno;
      }
      if (_operator == '/') {
        sum = fno / sno;
      }
      if (_operator == 'Clear') {
        sum = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            height: 35,
            width: 200,
            // color: Colors.green,
            child: Text(
              'Output: $sum',
              style: TextStyle(color: Colors.green, fontSize: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (val) {
                setState(() {
                  fno = double.parse(val);
                });
              },
              decoration: InputDecoration(
                labelText: 'Number1',
                hintText: 'Add number',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.add),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (val) {
                setState(() {
                  sno = double.parse(val);
                });
              },
              decoration: InputDecoration(
                labelText: 'Number2',
                hintText: 'Add number',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.add),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: () => sumFunc('Clear'),
                color: Colors.indigo,
                child: Text(
                  'Clear',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              MaterialButton(
                onPressed: () => sumFunc('+'),
                color: Colors.indigo,
                child: Text(
                  '+',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: () => sumFunc('/'),
                color: Colors.green,
                child: Text(
                  '/',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              MaterialButton(
                onPressed: () => sumFunc('*'),
                color: Colors.deepOrange,
                child: Text(
                  '*',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: () => sumFunc('-'),
                color: Colors.indigo,
                child: Text(
                  '-',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              ElevatedButton(
                child: Text('Next>>> '),
                style: ElevatedButton.styleFrom(
                  primary: Colors.indigo.shade900,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/secondPage');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
