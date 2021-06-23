import 'dart:convert';
import 'dart:io';

import 'package:eldo_app/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/assistant.dart';
import 'models/auth.dart';
import 'models/eval.dart';
import 'models/item.dart';
import 'models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Go Eldorado',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Eldorado Assistant Entry'),
          centerTitle: true,
        ),
        body: Login(),
      ),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var login = TextEditingController();
  var pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: login,
              decoration: const InputDecoration(
                labelText: 'Login',
                icon: Icon(Icons.person),
              ),
              style: TextStyle(color: Colors.greenAccent),
            ),
            TextFormField(
              controller: pass,
              decoration: const InputDecoration(
                labelText: 'Password',
                icon: Icon(Icons.security),
              ),
              style: TextStyle(color: Colors.greenAccent),
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red)),
                onPressed: () async {
                  var auth = Auth(login: login.text, password: pass.text);
                  var cont = 'application/json';
                  var url =
                      Uri.parse('http://localhost:53343/api/user/logassistant');

                  var res = await http.post(url,
                      headers: {
                        HttpHeaders.contentTypeHeader: cont,
                      },
                      body: json.encode(auth));
                  Map<String, dynamic> map = jsonDecode(res.body);
                  var u = User.fromJson(map);
                  url = Uri.parse('http://localhost:53343/api/assistant/getat');
                  res = await http.get(url);
                  map = jsonDecode(res.body);
                  var at = Assistant.fromJson(map);

                  url = Uri.parse('http://localhost:53343/api/items/get');
                  res = await http.get(url);

                  Iterable it = jsonDecode(res.body.toString());
                  List<Item> items =
                      List<Item>.from(it.map((model) => Item.fromJson(model)));
                  var evals = await getEval(at.id);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NavBar(null, u, at, items, evals)));
                },
                child: Text('Login'))
          ],
        ));
  }
}

Future<List<Eval>> getEval(String atId) async {
  var url = Uri.parse('http://localhost:53343/api/EvaluationSystem/get');
  var cont = 'application/json';

  var res = await http.post(url,
      headers: {
        HttpHeaders.contentTypeHeader: cont,
      },
      body: json.encode(atId));

  Iterable it = jsonDecode(res.body.toString());
  return List<Eval>.from(it.map((model) => Eval.fromJson(model)));
}
