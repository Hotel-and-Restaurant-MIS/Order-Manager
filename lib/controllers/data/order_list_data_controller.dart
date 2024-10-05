import 'package:get/get.dart';
import 'package:order_manager/constants/order_status_names.dart';
import 'package:order_manager/controllers/network/order_list_network_controller.dart';
import 'package:order_manager/enum/order_status.dart';
import 'package:order_manager/models/order.dart';

class OrderListDataController extends GetxController {
  static OrderListDataController instance = Get.find();

  Map<String, List<Order>> _orderDataMap = {};

  Map<String, List<Order>> get orderDataMap => _orderDataMap;

  RxBool _isGettingOrderData = false.obs;
  bool get isGettingOrderData => _isGettingOrderData.value;
  void setIsGettingOrderData(bool value){
    _isGettingOrderData.value = value;
  }
  final OrderListNetworkController _olnc = OrderListNetworkController.instance;

  @override
  void onInit() {
    super.onInit();
    _initController();
  }

  Future<void> _initController() async{
    await _getAllOrders();
  }

  Future<void> _getAllOrders()async{
    setIsGettingOrderData(true);
    List<Order> orderList =[];
    try{
      List<Map<String,dynamic>> ordersMapList = await _olnc.getOrderList();
      ordersMapList.forEach((Map<String,dynamic> orderMap){
        orderList.add(Order.fromMap(orderMap));
      });
      print('data orders length ;${orderList.length}');

      for (String status in kOrderStatusList) {
        OrderStatus statusEnum = getOrderStatusFromString(status);

        List<Order> filteredOrders = orderList.where((order) => order.orderStatus == statusEnum).toList();
        _orderDataMap[status] = filteredOrders;
      }

      print('data pending orders length ;${_orderDataMap['Pending']!.length}');
      }catch(e){
      print('error occurs getting order data');
      print(e.toString());
    }
    setIsGettingOrderData(false);
  }

  // void _initController() {
  //   _statusOrderMap = _olnc.orderData;
  //   if (_statusOrderMap.entries.isEmpty) {
  //     throw Exception('Empty Order in OrderListDataController');
  //   }
  //   for (var entry in _olnc.orderData.entries) {
  //     String status = entry.key;
  //     List orderList = entry.value;
  //
  //     if (_statusOrderMap.isNotEmpty) {
  //       List<Order> _orders =
  //           orderList.map((order) => Order.fromMap(order)).toList();
  //       _orderDataMap[status] =_orders;
  //     }
  //   }
  // }
}
