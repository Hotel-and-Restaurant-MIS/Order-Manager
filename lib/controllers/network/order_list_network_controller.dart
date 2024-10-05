import 'dart:convert';
import 'package:get/get.dart';
import 'package:order_manager/constants/network_constants.dart';
import 'package:order_manager/exception/list_pass_exception.dart';
import 'package:order_manager/exception/network_exception.dart';
import 'package:http/http.dart' as http;


class OrderListNetworkController extends GetxController {

  static OrderListNetworkController instance = Get.find();

  Future<List<Map<String, dynamic>>> getOrderList() async{
    List<Map<String,dynamic>> orderList = [];

    Uri url = Uri.parse('${NetworkConstants.baseUrl}/vw/singleTableOrder/all');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      try {
        var jsonResponse = jsonDecode(response.body) as List;
        orderList = jsonResponse
            .map((booking) => booking as Map<String, dynamic>)
            .toList();
        print('###length of orderList:${orderList.length}');
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
}
