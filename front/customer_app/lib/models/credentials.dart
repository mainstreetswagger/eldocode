class Credentials {
  late String customerId;
  late String assistantId;
  Credentials({required this.customerId, required this.assistantId});

  Credentials.fromJson(Map<String, dynamic> json)
      : customerId = json['CustomerId'],
        assistantId = json['AssistantId'];

  Map<String, dynamic> toJson() => {
        'customerId': customerId,
        'assistantId': assistantId,
      };
}
