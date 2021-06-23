class User {
  late String id;
  late String name;
  late String surname;
  late int age;
  late String address;
  late String phone;
  late String email;
  late int holderTypeId;
  late String createdDate;
  late String login;
  User(
      {required this.id,
      required this.name,
      required this.surname,
      required this.age,
      required this.address,
      required this.phone,
      required this.email,
      required this.holderTypeId,
      required this.createdDate,
      required this.login});

  User.fromJson(Map<String, dynamic> json)
      : id = json['Id'],
        name = json['Name'],
        surname = json['Surname'],
        age = json['Age'],
        address = json['Address'],
        phone = json['Phone'],
        email = json['Email'],
        holderTypeId = json['HolderTypeId'],
        createdDate = json['CreatedDate'],
        login = json['Login'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'surname': surname,
        'age': age,
        'address': address,
        'phone': phone,
        'email': email,
        'holderTypeId': holderTypeId,
        'createdDate': createdDate,
        'login': login
      };
}
