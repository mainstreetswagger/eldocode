class Auth {
  late String login;
  late String password;
  Auth({required this.login, required this.password});

  Auth.fromJson(Map<String, dynamic> json)
      : login = json['login'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        'login': login,
        'password': password,
      };
}
