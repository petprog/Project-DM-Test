/// Created by Taiwo Farinu on 30-Sep-21

import 'package:flutter/material.dart';
import 'package:test_project/models/sale.dart';

class SalesList extends StatelessWidget {
  final List<Sale> data;

  SalesList({required this.data});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: 300,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  Text("State: " + data[index].state),
                  Text("Sale: " + data[index].sales),
                  Text("Profit: " + data[index].profit),
                ],
              ),
            );
          },
          itemCount: data.length,
        ),
      ),
    );
  }
}
