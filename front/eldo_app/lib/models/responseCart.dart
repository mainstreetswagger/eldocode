class ResCart {
  final String id;
  final String customerId;
  final String createdDate;

  ResCart(
      {required this.id, required this.customerId, required this.createdDate});

  ResCart.fromJson(Map<String, dynamic> json)
      : id = json['Id'],
        customerId = json['CustomerId'],
        createdDate = json['CreatedDate'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'customerId': customerId, 'createdDate': createdDate};
}
