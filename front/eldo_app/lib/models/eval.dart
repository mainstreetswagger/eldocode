class Eval {
  final String id;
  final String customerId;
  final String assistantId;
  final String desc;
  final String createdDate;
  final int points;
  Eval(
      {required this.id,
      required this.customerId,
      required this.assistantId,
      required this.desc,
      required this.createdDate,
      required this.points});

  Eval.fromJson(Map<String, dynamic> json)
      : id = json['Id'],
        customerId = json['CustomerId'],
        assistantId = json['AssistantId'],
        desc = json['Description'],
        createdDate = json['CreatedDate'],
        points = json['Points'];

  Map<String, dynamic> toJson() => {
        'Id': id,
        'CustomerId': customerId,
        'AssistantId': assistantId,
        'Description': desc,
        'CreatedDate': createdDate,
        'Points': points,
      };
}
