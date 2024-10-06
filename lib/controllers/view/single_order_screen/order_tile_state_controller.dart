import 'package:get/get.dart';

class OrderTileStateController extends GetxController{
  static OrderTileStateController instance = Get.find();

  String? _orderStatus;

  String? get orderStatus => _orderStatus;

  void setOrderStatus(String value) {
    _orderStatus = value;
  }

}