/// Created by Taiwo Farinu on 29-Sep-21
import 'package:charts_flutter/flutter.dart' as charts;

class SalesSeries {
  final String state;
  final int sales;
  final charts.Color barColor;

  SalesSeries({
    required this.state,
    required this.sales,
    required this.barColor,
  });
}
