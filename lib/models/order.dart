import 'package:order_manager/enum/order_status.dart';
import 'package:order_manager/models/order_item.dart';

class Order {
  final List<OrderItem> orderItemList;
  final OrderStatus orderStatus;
  final double orderTotal;
  int? orderId;
  final int tableId;
  final DateTime dateTime;

  Order(
      {this.orderId,
        required this.orderItemList,
        required this.dateTime,
        required this.orderStatus,
        required this.orderTotal,
        required this.tableId});

  set orderItemList(value) => orderItemList = value;

  // Factory constructor to create an instance of Order from a map
  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
        dateTime: DateTime.parse(map['dateTime']),
        orderId: map['orderId'],
        orderItemList: List<OrderItem>.from(
            map['orderItems'].map((item) => OrderItem.fromMap(item))
        ),
        orderStatus: getOrderStatusFromString(map['status']['statusName']),
        orderTotal: map['totalPrice'],
        tableId: map['tableId']);
  }

// Method to convert an instance of Order to a map
  Map<String,dynamic> toMap(){
    return{
      'orderItemList': orderItemList.map((item) => item.toMap()).toList(),
      'orderTotal':orderTotal.toString(),
      'tableId':tableId.toString()
    };
  }
}
