import 'dart:convert';
import 'package:get/get.dart';
import 'package:order_manager/constants/network_constants.dart';
import 'package:order_manager/exception/list_pass_exception.dart';
import 'package:order_manager/exception/network_exception.dart';
import 'package:http/http.dart' as http;
import 'package:order_manager/models/status_updater.dart';

class OrderListNetworkController extends GetxController {
  static OrderListNetworkController instance = Get.find();

  Future<List<Map<String, dynamic>>> getOrderList() async {
    List<Map<String, dynamic>> orderList = [];

    Uri url = Uri.parse('${NetworkConstants.baseUrl}/vw/singleTableOrder/all');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      try {
        var jsonResponse = jsonDecode(response.body) as List;
        orderList =
            jsonResponse.map((order) => order as Map<String, dynamic>).toList();
        return orderList;
      } catch (e) {
        print(e);
        throw ListPassException(message: 'json decode error in getOrderList');
      }
    } else {
      print('get orders Request failed with status: ${response.statusCode}.');
      throw NetworkException();
    }
  }

  Future<Map<String, dynamic>> updateOrderStatus(
      StatusUpdater statusUpdater) async {
    try {
      var body = jsonEncode(statusUpdater.toMap());
      Uri url = Uri.parse(
          '${NetworkConstants.baseUrl}/vw/singleTableOrder/updateStatus');
      var response = await http.put(
        url,
        headers: {'content-type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> orderMap =
            jsonDecode(response.body) as Map<String, dynamic>;
        return orderMap;
      } else {
        print(
            'Change order status Request failed with status: ${response.statusCode}.');
        throw NetworkException();
      }
    } catch (e) {
      print('Error changing order status');
      print(e.toString());
      throw NetworkException(message: e.toString());
    }

  }
}
