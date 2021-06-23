class Assistant {
  late String id;
  late String shop;
  late String position;
  late String contacts;
  Assistant(
      {required this.id,
      required this.shop,
      required this.position,
      required this.contacts});

  Assistant.fromJson(Map<String, dynamic> json)
      : id = json['Id'],
        shop = json['Shop'],
        position = json['Position'],
        contacts = json['Contacts'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'shop': shop,
        'position': position,
        'contacts': contacts,
      };
}
