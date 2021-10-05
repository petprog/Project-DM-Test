import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:test_project/sales_series.dart';
/**
 * Created by Taiwo Farinu on 29-Sep-21
 */

class SalesChart extends StatelessWidget {
  final List<SalesSeries> data;

  SalesChart({required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<SalesSeries, String>> series = [
      charts.Series(
          id: "Sales",
          data: data,
          domainFn: (SalesSeries series, _) => series.state,
          measureFn: (SalesSeries series, _) => series.sales,
          colorFn: (SalesSeries series, _) => series.barColor)
    ];
    // return charts.BarChart(series, animate: true);
    return Container(
      width: double.infinity,
      height: 400,
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Text("Barchart", style: Theme.of(context).textTheme.bodyText2),
          Expanded(
            child: charts.BarChart(series, animate: true),
          )
        ],
      ),
    );
  }
}
