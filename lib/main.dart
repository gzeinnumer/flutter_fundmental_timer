import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isBlack = true;
  bool isStop = true;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Timer")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                count.toString(),
                style: TextStyle(
                  color: (isBlack) ? Colors.black : Colors.red,
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                child: Text("Ubah warna 5 detik kemudian"),
                onPressed: () {
                  Timer(Duration(seconds: 5),(){
                    setState(() {
                      isBlack = !isBlack;
                    });
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                child: Text("Ubah warna lansung"),
                onPressed: () {
                  Timer.run((){
                    setState(() {
                      isBlack = !isBlack;
                    });
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                child: Text("Start timer"),
                onPressed: () {
                  isStop = false;
                  Timer.periodic(Duration(seconds: 1), (timer) {
                    if(isStop) timer.cancel();
                    setState(() {
                      count++;
                    });
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                child: Text("Stop timer"),
                onPressed: () {
                  isStop = true;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
