import 'package:get/get.dart';
import 'package:order_manager/constants/order_status_names.dart';
import 'package:order_manager/controllers/network/order_list_network_controller.dart';
import 'package:order_manager/enum/order_status.dart';
import 'package:order_manager/models/order.dart';
import 'package:order_manager/models/status_updater.dart';

class OrderListDataController extends GetxController {
  static OrderListDataController instance = Get.find();

  RxMap<String, List<Order>> _orderDataMap = <String, List<Order>>{}.obs;

  Map<String, List<Order>> get orderDataMap => _orderDataMap.value;

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

  Future<void>updateStatus(int orderId, String newStatus, String oldStatus) async{
    try{
      Map<String,dynamic> orderMap = await _olnc.updateOrderStatus(StatusUpdater(orderId: orderId, newOrderStatus: newStatus));
    _orderDataMap['$newStatus']?.add(Order.fromMap(orderMap));
    _orderDataMap['$oldStatus']?.removeWhere((order) => order.orderId == orderId);
    }catch(e){
      print('error in parsing order map to order object');
      print(e.toString());
    }
  }
}
