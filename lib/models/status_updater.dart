class StatusUpdater{
  final int orderId;
  final String newOrderStatus;

  StatusUpdater({required this.orderId, required this.newOrderStatus});

  Map<String,dynamic> toMap(){
    return{

      'orderId':orderId,
      'status':newOrderStatus
    };
  }
}