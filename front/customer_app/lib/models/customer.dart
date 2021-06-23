class Customer {
  final String id;
  final double amount;
  Customer({required this.id, required this.amount});

  Customer.fromJson(Map<String, dynamic> json)
      : id = json['Id'],
        amount = json['Amount'];

  Map<String, dynamic> toJson() => {'id': id, 'amount': amount};
}
