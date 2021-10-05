/// Created by Taiwo Farinu on 29-Sep-21
class Sale {
  String orderId = '';
  String profit = '';
  String city = '';
  String customerName = '';
  String productName = '';
  String rowId = '';
  String country = '';
  String discount = '';
  String customerId = '';
  String region = '';
  String quantity = '';
  String segment = '';
  String state = '';
  String sales = '';

  Sale(
      this.orderId,
      this.profit,
      this.city,
      this.customerName,
      this.productName,
      this.rowId,
      this.country,
      this.discount,
      this.customerId,
      this.region,
      this.quantity,
      this.segment,
      this.state,
      this.sales);

  Sale.fromJson(Map<String, dynamic> json) {
    orderId = json['Order ID'];
    profit = json['Profit'];
    city = json['City'];
    customerName = json['Customer Name'];
    productName = json['Product Name'];
    rowId = json['Row ID'];
    country = json['Country'];
    discount = json['Discount'];
    customerId = json['Customer ID'];
    region = json['Region'];
    quantity = json['Quantity'];
    segment = json['Segment'];
    state = json['State'];
    sales = json['Sales'];
  }
// "Discount": "0.2",
// "Customer ID": "DM-12955",
// "Region": "West",
// "Quantity": "4",
// "Segment": "Corporate",
// "State": "Arizona",
// "Ship Mode": "Second Class",
// "Sub-Category": "Art",
// "Postal Code": "85364",
// "Ship Date": "10/1/2016",
// "Category": "Office Supplies",
// "Product ID": "OFF-AR-10002375",
// "Sales": "10.496",
// "Order Date": "9/29/2016"

}
