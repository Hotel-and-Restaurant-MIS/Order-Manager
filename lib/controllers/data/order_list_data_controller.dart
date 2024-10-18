import 'package:get/get.dart';
import 'package:order_manager/constants/order_status_names.dart';
import 'package:order_manager/controllers/network/order_list_network_controller.dart';
import 'package:order_manager/controllers/network/web_socket.dart';
import 'package:order_manager/controllers/view/home_order_screen/order_list_builder.dart';
import 'package:order_manager/enum/order_status.dart';
import 'package:order_manager/models/order.dart';
import 'package:order_manager/models/status_updater.dart';

class OrderListDataController extends GetxController {
  static OrderListDataController instance = Get.find();

  RxMap<String, List<Order>> _orderDataMap = <String, List<Order>>{}.obs;

  Map<String, List<Order>> get orderDataMap => _orderDataMap.value;

  RxBool _isGettingOrderData = false.obs;
  bool get isGettingOrderData => _isGettingOrderData.value;
  void setIsGettingOrderData(bool value) {
    _isGettingOrderData.value = value;
  }

  final OrderListNetworkController _olnc = OrderListNetworkController.instance;

  @override
  void onInit() {
    super.onInit();
    _initController();
  }

  Future<void> _initController() async {
    await _getAllOrders();
  }

  Future<void> _getAllOrders() async {
    setIsGettingOrderData(true);
    List<Order> orderList = [];
    try {
      List<Map<String, dynamic>> ordersMapList = await _olnc.getOrderList();
      ordersMapList.forEach((Map<String, dynamic> orderMap) {
        orderList.add(Order.fromMap(orderMap));
      });

      for (String status in kOrderStatusList) {
        Rx<OrderStatus> statusEnum = getOrderStatusFromString(status);

        List<Order> filteredOrders = orderList
            .where((order) => order.orderStatus == statusEnum)
            .toList();
        _orderDataMap[status] = filteredOrders;
      }

    } catch (e) {
      print('error occurs getting order data');
      print(e.toString());
    }
    setIsGettingOrderData(false);
  }

  void updateOrderList(Order order) {
    print('update function is called');
    for (String status in kOrderStatusList) {
      Rx<OrderStatus> statusEnum = getOrderStatusFromString(status);
      if (order.orderStatus == statusEnum) {
        _orderDataMap[status]?.add(order);
      }
    }
  }
  void updatePaidOrders({required int tableNo}) {
    print('updatePaidOrders function is called');

    // Create a copy of the 'Completed' list to iterate over
    List<Order> completedOrders = List.from(_orderDataMap['Completed']!);

    for (Order order in completedOrders) {
      if (order.tableId == tableNo) {
        Order newOrder = order;
        newOrder.orderStatus = getOrderStatusFromString(OrderStatus.Paid.name);

        // Add the order to the 'Paid' list
        _orderDataMap['Paid']?.add(newOrder);

        // Remove the order from the 'Completed' list
        _orderDataMap['Completed']?.remove(order);
      }
    }
  }


  Future<void> updateStatus({
    required int tableNo,
    required int orderId,
    required String newStatus,
    required String oldStatus,
  }) async {
    try {
      Map<String, dynamic> orderMap = await _olnc.updateOrderStatus(
          StatusUpdater(orderId: orderId, newOrderStatus: newStatus));
      _orderDataMap['$newStatus']?.add(Order.fromMap(orderMap));
      _orderDataMap['$oldStatus']
          ?.removeWhere((order) => order.orderId == orderId);

      WebSocketController.instance
          .updateOrderStatus(tableNo, orderId, oldStatus, newStatus);

    } catch (e) {
      print('error in parsing order map to order object');
      print(e.toString());
    }
  }
}
