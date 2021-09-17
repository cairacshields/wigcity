


class Purchases {
  final String id;
  final String itemId;
  final String purchaserId;
  final DateTime purchaseDate;
  final dynamic total;

  //Represents the status of the order (i.e pending shipment)
  final dynamic orderStatus;


  final String itemName;

  Purchases(this.id, this.purchaserId, this.itemId, this.purchaseDate, this.total, this.itemName, {this.orderStatus = OrderStatus.PROCESSING_PAYMENT});

  Purchases.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'] as String,
        purchaserId = json['purchaserId'] as String,
        itemId = json['itemId'] as String,
        purchaseDate = json['purchaseDate'] as DateTime,
        total = json['total'] as dynamic,
        orderStatus = json['orderStatus'] as dynamic,
        itemName = json['itemName'] as String;

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'id': id,
    'purchaserId': purchaserId,
    'itemId': itemId,
    'purchaseDate': purchaseDate,
    'total': total,
    'orderStatus': orderStatus,
    'itemName': itemName,
  };
}

enum OrderStatus {
  PROCESSING_PAYMENT,
  PAYMENT_COMPLETE,
  AWAITING_SHIPMENT,
  SHIPPED,
  DELIVERED,
  RETURN_REQUESTED,
  RETURNED_AND_REFUNDED
}