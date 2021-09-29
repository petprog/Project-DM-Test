/**
 * Created by Taiwo Farinu on 29-Sep-21
 */
import 'package:charts_flutter/flutter.dart' as charts;

class SalesSeries {
  final String year;
  final int sales;
  final charts.Color color;

  SalesSeries({
    required this.year,
    required this.sales,
    required this.color,
  });
}
