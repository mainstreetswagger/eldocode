class Cart {
  final List<String> itemIds;
  final String customerId;
  final String assistantId;
  Cart(
      {required this.itemIds,
      required this.customerId,
      required this.assistantId});

  Cart.fromJson(Map<String, dynamic> json)
      : itemIds = json['Items'],
        customerId = json['CustomerId'],
        assistantId = json['AssistantId'];

  Map<String, dynamic> toJson() =>
      {'items': itemIds, 'customerId': customerId, 'assistantId': assistantId};
}
