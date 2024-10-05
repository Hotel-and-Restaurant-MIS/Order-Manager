enum OrderStatus { Pending, Preparing, Completed, Editing, Paid }

OrderStatus getOrderStatusFromString(String status) {
  switch (status) {
    case 'Pending':
      return OrderStatus.Pending;
    case 'Preparing':
      return OrderStatus.Preparing;
    case 'Completed':
      return OrderStatus.Completed;
    case 'Editing':
      return OrderStatus.Editing;
    case 'Paid':
      return OrderStatus.Paid;
    default:
      throw Exception('Invalid order status: $status');
  }
}
