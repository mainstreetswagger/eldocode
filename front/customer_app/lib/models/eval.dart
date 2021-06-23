class Eval {
  final String customerId;
  final String assistantId;
  final String desc;
  final int points;
  Eval(
      {required this.customerId,
      required this.assistantId,
      required this.desc,
      required this.points});

  Eval.fromJson(Map<String, dynamic> json)
      : customerId = json['CustomerId'],
        assistantId = json['AssistantId'],
        desc = json['Description'],
        points = json['Points'];

  Map<String, dynamic> toJson() => {
        'CustomerId': customerId,
        'AssistantId': assistantId,
        'Description': desc,
        'Points': points,
      };
}
