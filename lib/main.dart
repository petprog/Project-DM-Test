import 'dart:async';
import 'dart:convert';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_project/sale.dart';
import 'package:test_project/sales_chart.dart';
import 'package:test_project/sales_list.dart';
import 'package:test_project/sales_series.dart';

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
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Sale> _sales = [];

  final List<SalesSeries> dataBarChart = [];

  Future<List<Sale>> fetchSales() async {
    var url = 'https://g54qw205uk.execute-api.eu-west-1.amazonaws.com/DEV/stub';
    Map data = {
      'angular_test': 'angular-developer',
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: body);
    List<Sale> sales = [];
    if (response.statusCode == 200) {
      var salesJson = json.decode(response.body);
      for (var saleJson in salesJson) {
        sales.add(Sale.fromJson(saleJson));
      }
    }
    return sales;
  }

  void sortSalesByProfitInBarChart(List<Sale> sales) {
    sales.sort(
        (b, a) => double.parse(a.profit).compareTo(double.parse(b.profit)));
    if (sales.isNotEmpty) {
      dataBarChart.clear();
      for (var i in sales.sublist(0, 5)) {
        dataBarChart.add(SalesSeries(
            state: i.state,
            sales: double.parse(i.profit).toInt(),
            barColor: charts.ColorUtil.fromDartColor(Colors.blue)));
      }
    }
  }

  void sortSalesBySalesInBarChart(List<Sale> sales) {
    sales
        .sort((b, a) => double.parse(a.sales).compareTo(double.parse(b.sales)));
    if (sales.isNotEmpty) {
      dataBarChart.clear();
      for (var i in sales.sublist(0, 5)) {
        dataBarChart.add(SalesSeries(
            state: i.state,
            sales: double.parse(i.sales).toInt(),
            barColor: charts.ColorUtil.fromDartColor(Colors.blue)));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    fetchSales().then((value) {
      setState(() {
        _sales.addAll(value);
        sortSalesBySalesInBarChart(_sales);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sales"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _sales.isNotEmpty
                  ? SalesList(data: _sales)
                  : Container(
                      height: 300,
                      child: Center(
                        child: Text("Loading..."),
                      ),
                    ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        sortSalesBySalesInBarChart(_sales);
                      });
                    },
                    child: Text("By Sales"),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        sortSalesByProfitInBarChart(_sales);
                      });
                    },
                    child: Text("By Profit"),
                  ),
                ],
              ),
              SalesChart(data: dataBarChart),
            ],
          ),
        ));
  }
}
