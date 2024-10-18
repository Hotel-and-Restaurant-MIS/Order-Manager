import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:order_manager/constants/colours.dart';
import 'package:order_manager/constants/network_constants.dart';
import 'package:order_manager/constants/text_constants.dart';
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

      _socket.on('readPayment', (data){
        Map<String, dynamic> jsonMap = jsonDecode(data);
        int tableNo = jsonMap['tableNo'];
        print('readPayment is executed');
        OrderListDataController.instance.updatePaidOrders(tableNo: tableNo);

      });
      _socket.on(
        'readHelpRequest',
        (data) {
          Map<String, dynamic> jsonMap = jsonDecode(data);
          String tableNo = jsonMap['tableNo'].toString();

          Get.defaultDialog(
            radius: 10.0,
            title: 'Customer Need Help',
            titleStyle: TextConstants.kMainTextStyle(),
            titlePadding: EdgeInsets.all(10.0),
            content: Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
              child: Text(
                'Table $tableNo is requesting support of a waiter.',
                style: TextConstants.kSubTextStyle(fontSize: 18.0),
              ),
            ),
            backgroundColor: kBackgroundColour,
            confirm: ElevatedButton(
              onPressed: () {
                Get.back(); // Close dialog when 'OK' is pressed
              },
              child: Text(
                'OK',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        },
      );

      _socket.on(
        "readAddedNewOrder",
        (data) {
          Map<String, dynamic> orderMap = jsonDecode(data);
          OrderListDataController.instance
              .updateOrderList(Order.fromMap(orderMap));

        },
      );

      _socket.on(
        "readRequestBill",
        (data) {
          Map<String, dynamic> jsonMap = jsonDecode(data);
          String tableNo = jsonMap['tableNo'].toString();

          // Show the dialog when the WebSocket event is triggered
          Get.defaultDialog(
            radius: 10.0,
            title: 'Bill Request',
            titleStyle: TextConstants.kMainTextStyle(),
            titlePadding: EdgeInsets.all(10.0),
            content: Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
              child: Text(
                'Table $tableNo is requesting the bill.',
                style: TextConstants.kSubTextStyle(fontSize: 18.0),
              ),
            ),
            backgroundColor: kBackgroundColour,
            confirm: ElevatedButton(
              onPressed: () {
                Get.back(); // Close dialog when 'OK' is pressed
              },
              child: Text(
                'OK',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
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
