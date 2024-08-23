import 'package:get/get.dart';
import 'package:order_manager/controllers/network/order_list_network_controller.dart';
import 'package:order_manager/models/order.dart';

class OrderListDataController extends GetxController {
  static OrderListDataController instance = Get.find();
  Map _statusOrderMap = {};
  Map<String, List<Order>> _orderDataMap = {};

  Map<String, List<Order>> get menuDataMap => _orderDataMap;

  final OrderListNetworkController _olnc = OrderListNetworkController.instance;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _initController();
  }

  void _initController() {
    _statusOrderMap = _olnc.orderData;
    if (_statusOrderMap.entries.isEmpty) {
      throw Exception('Empty Order in OrderListDataController');
    }
    for (var entry in _olnc.orderData.entries) {
      String status = entry.key;
      List orderList = entry.value;

      if (_statusOrderMap.isNotEmpty) {
        List<Order> _orders =
            orderList.map((order) => Order.fromMap(order)).toList();
        _orderDataMap[status] =_orders;
      }
    }
  }
}
