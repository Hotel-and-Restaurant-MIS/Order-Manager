import 'dart:convert';
import 'package:order_manager/constants/network_constants.dart';
import 'package:order_manager/controllers/data/order_list_data_controller.dart';
import 'package:order_manager/models/order.dart';
import 'package:socket_io_client/socket_io_client.dart' as SIO;
import 'package:get/get.dart';

class WebSocketController extends GetxController {
  static WebSocketController instance = Get.find();

  OrderListDataController _oldc = OrderListDataController.instance;
  late SIO.Socket _socket;

  WebSocketController._();

  static Future<WebSocketController> create() async {
    WebSocketController controller = WebSocketController._();
    await controller._initController();
    return controller;
  }

  Future<void> _initController() async {
    try {
      _socket = SIO.io(NetworkConstants.wsUrl, <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
        'path': '/ws',
      });
      _socket.connect();
      _socket.onConnect((_) {
        print('Connection established');
      });

      _socket.on(
        'readHelpRequest',
        (data) {
          String tableNo = jsonDecode(data);
        },
      );

      _socket.on(
        "readAddedNewOrder",
        (data) {
          Map<String, dynamic> orderMap = jsonDecode(data);
          _oldc.updateOrderList(Order.fromMap(orderMap));
          print('#### new order is coming');
        },
      );
    } catch (e) {
      print("error occurs establishing the websocket");
      rethrow;
    }
  }

  @override
  void onInit() {
    if (!_socket.connected) {
      _socket.connect();  // Ensure socket is only connected if it's not already
    }
    super.onInit();
  }
}
