import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;
  StreamController counterController = StreamController();
  late Stream mySteam;

  @override
  void initState() {
    super.initState();
    mySteam = counterController.stream.asBroadcastStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: mySteam,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data.toString(),
                    style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                  );
                } else {
                  return Text(
                    '0',
                    style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                  );
                }
              },
            ),
            StreamBuilder(
              stream: mySteam,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data.toString(),
                    style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                  );
                } else {
                  return Text(
                    '0',
                    style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                  );
                }
              },
            ),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter++;

          counterController.sink.add(counter);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
