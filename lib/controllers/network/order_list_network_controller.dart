import 'package:get/get.dart';
import 'package:order_manager/constants/order_data.dart';
import 'package:order_manager/enum/order_status.dart';
import 'package:order_manager/models/order.dart';

class OrderListNetworkController extends GetxController {
  static OrderListNetworkController instance = Get.find();
  Map _orderData = {};
  Map get orderData => _orderData;

  final List<Order> _orderList = OrderData.kOrderList;
  List<Order> get orderList => _orderList;

  OrderListNetworkController._();

  static Future<OrderListNetworkController> create() async {
    OrderListNetworkController controller = OrderListNetworkController._();
    await controller._getOrderList();
    return controller;
  }

  Future<void> _getOrderList() async {
    _orderData = {};
    await Future.delayed(Duration(milliseconds: 100));
    _orderData['Pending'] = _excludeJsonGeneratorByStatus(OrderStatus.Pending);
    _orderData['Preparing'] =
        _excludeJsonGeneratorByStatus(OrderStatus.Preparing);
    _orderData['Completed'] =
        _excludeJsonGeneratorByStatus(OrderStatus.Completed);
  }

  //simulate getting json file
  List<Map<String, dynamic>> _excludeJsonGeneratorByStatus(OrderStatus status) {
    return _orderList.any((order) => order.orderStatus == status)
        ? _orderList
            .where((order) => order.orderStatus == status)
            .toList()
            .map((order) => order.toMap())
            .toList()
        : [];
  }
}
