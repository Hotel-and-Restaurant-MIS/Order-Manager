import 'package:get/get.dart';
import 'package:order_manager/controllers/data/login_data_controller.dart';
import 'package:order_manager/controllers/data/order_list_data_controller.dart';
import 'package:order_manager/controllers/network/login_network_controller.dart';
import 'package:order_manager/controllers/network/order_list_network_controller.dart';
import 'package:order_manager/controllers/network/web_socket.dart';
import 'package:order_manager/controllers/view/home_order_screen/order_list_builder.dart';
import 'package:order_manager/controllers/view/login_screen/login_state_controller.dart';
import 'package:order_manager/controllers/view/single_order_screen/order_tile_state_controller.dart';

class ControllerInitializer {
  static bool _isIntialized = false;

  static bool get isInitialized => _isIntialized;

  static Future<void> initAllControllers() async {
    try {
      await Get.putAsync(() => WebSocketController.create());
      Get.put(OrderListNetworkController());
      Get.put(OrderListDataController());
      Get.put(LoginNetworkController());
      Get.put(LoginDataController());
      Get.put(LoginStateController());
      Get.put(OrderListBuilder());
      Get.put(OrderTileStateController());
      _isIntialized = true;

    } catch (e) {
      print('An Unexpected error occurs initiating controller.');
      print(e);
      rethrow;
    }
  }
}