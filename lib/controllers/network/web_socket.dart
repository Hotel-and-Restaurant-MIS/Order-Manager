import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:order_manager/constants/network_constants.dart';
import 'package:order_manager/controllers/data/order_list_data_controller.dart';
import 'package:order_manager/models/order.dart';
import 'package:socket_io_client/socket_io_client.dart' as SIO;
import 'package:get/get.dart';

class WebSocketController extends GetxController {
  static WebSocketController instance = Get.find();

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
          OrderListDataController.instance
              .updateOrderList(Order.fromMap(orderMap));
          print('#### new order is coming');
        },
      );

      _socket.on(
        "readRequestBill",
        (data) {
          Map<String, dynamic> orderMap = jsonDecode(data);
          String tableNo = orderMap['tableNo'].toString();
          print('readRequestBill executed');

          Get.defaultDialog(
            title: 'Bill Request',
            content: Text('Table $tableNo is requesting the bill.'),
            confirm: ElevatedButton(
              onPressed: () {
                Get.back(); // Close the dialog when 'OK' is pressed
              },
              child: Text('OK'),
            ),
          );
        },
      );
    } catch (e) {
      print("error occurs establishing the websocket");
      rethrow;
    }
  }

  Future<void> updateOrderStatus(
      int tableNo, int orderId, String oldStatus, String newStatus) async {
    try {
      _socket.emit(
        'orderStatusUpdated',
        jsonEncode(
          {
            'tableNo': tableNo,
            'orderId': orderId,
            'oldStatus': oldStatus,
            'newStatus': newStatus
          },
        ),
      );
    } catch (e) {
      print('Error updating order status');
    }
  }

  @override
  void onInit() {
    if (!_socket.connected) {
      _socket.connect(); // Ensure socket is only connected if it's not already
    }
    super.onInit();
  }
}
