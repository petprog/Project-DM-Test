import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Sales.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Sale> _sales = <Sale>[];

  Future<List<Sale>> fetchSales() async {
    var url = 'https://g54qw205uk.execute-api.eu-west-1.amazonaws.com/DEV/stub';
    Map data = {'angular_test': 'angular-developer'};
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: body);
    List<Sale> sales = <Sale>[];
    if (response.statusCode == 200) {
      var salesJson = json.decode(response.body);
      for (var saleJson in salesJson) {
        sales.add(Sale.fromJson(saleJson));
      }
    }
    return sales;
  }

  @override
  void initState() {
    fetchSales().then((value) {
      setState(() {
        _sales.addAll(value);
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Sales"),
      ),
      body: _sales.isNotEmpty
          ? ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Text(_sales[index].orderId),
                      Text(_sales[index].sales),
                    ],
                  ),
                );
              },
              itemCount: 50,
            )
          : Text("Loading"),
    );
  }
}
