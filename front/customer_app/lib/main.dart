import 'dart:convert';
import 'dart:io';

import 'package:customer_app/models/auth.dart';
import 'package:customer_app/models/credentials.dart';
import 'package:customer_app/models/item.dart';
import 'package:customer_app/models/user.dart';
import 'package:customer_app/screens/assessment.dart';
import 'package:flutter/material.dart';

import 'models/assistant.dart';
import 'models/customer.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Customer App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(body: ButtonPush()));
  }
}

class ButtonPush extends StatefulWidget {
  const ButtonPush({Key? key}) : super(key: key);

  @override
  _ButtonPushState createState() => _ButtonPushState();
}

class _ButtonPushState extends State<ButtonPush> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () async {
          var cu = await getCustomer();
          var at = await getAt();
          var items = await getAllCarts(at.id, cu.id);
          var uAt = await getAtUser();
          var uCu = await getCuUser();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyHomePage(
                        key: null,
                        items: items,
                        customer: cu,
                        at: at,
                        userAt: uAt,
                        userCu: uCu,
                      )));
        },
        icon: Icon(Icons.star_border_purple500_rounded),
        label: Text('Customer Start'),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.orangeAccent)),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  List<Item> items;
  Customer customer;
  Assistant at;
  User userAt;
  User userCu;
  MyHomePage(
      {Key? key,
      required this.items,
      required this.customer,
      required this.at,
      required this.userAt,
      required this.userCu})
      : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _refresh() {
    setState(() async {
      widget.userAt = await getAtUser();
      widget.userCu = await getCuUser();
      widget.customer = await getCustomer();
      widget.at = await getAt();
      widget.items = await getAllCarts(widget.at.id, widget.customer.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    var items = widget.items;
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (_, index) {
          return Column(
            children: [
              Column(
                children: [
                  Container(
                    child: Text(
                      'Assistant ${widget.userAt.name} recommends this item.',
                      style: TextStyle(
                          backgroundColor: Colors.amberAccent, fontSize: 25.0),
                    ),
                  ),
                  Container(child: Text(items[index].name)),
                  Container(
                    child: Image.memory(
                        base64Decode(items[index].image).buffer.asUint8List()),
                  ),
                  Container(child: Text(items[index].price.toString() + ' Р.')),
                  Container(child: Text(items[index].description)),
                  SizedBox(
                    height: 5.0,
                  )
                ],
              ),
              ElevatedButton.icon(
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Assessment(
                                key: null,
                                at: widget.at,
                                cu: widget.customer)));
                  },
                  icon: Icon(Icons.assessment),
                  label: Text('Grade Assistants Job')),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refresh,
        tooltip: 'Check Cart',
        child: Icon(Icons.refresh),
      ),
    );
  }
}

Future<Customer> getCustomer() async {
  var url = Uri.parse('http://localhost:53343/api/customer/get');
  var res = await http.get(url);
  Map<String, dynamic> map = jsonDecode(res.body);
  return Customer.fromJson(map);
}

Future<Assistant> getAt() async {
  var url = Uri.parse('http://localhost:53343/api/assistant/getat');
  var res = await http.get(url);
  Map<String, dynamic> map = jsonDecode(res.body);
  return Assistant.fromJson(map);
}

Future<List<Item>> getAllCarts(String atId, String cuId) async {
  var cont = 'application/json';
  var url = Uri.parse('http://localhost:53343/api/items/getallcartitems');
  var res = await http.post(url,
      headers: {
        HttpHeaders.contentTypeHeader: cont,
      },
      body: json.encode(Credentials(customerId: cuId, assistantId: atId)));

  Iterable it = jsonDecode(res.body);
  return List<Item>.from(it.map((model) => Item.fromJson(model)));
}

Future<User> getAtUser() async {
  var auth = Auth(login: 'sergei', password: '123123');
  var cont = 'application/json';
  var url = Uri.parse('http://localhost:53343/api/user/logassistant');
  var res = await http.post(url,
      headers: {
        HttpHeaders.contentTypeHeader: cont,
      },
      body: json.encode(auth));
  Map<String, dynamic> map = jsonDecode(res.body);
  return User.fromJson(map);
}

Future<User> getCuUser() async {
  var auth = Auth(login: 'katya', password: '123123');
  var cont = 'application/json';
  var url = Uri.parse('http://localhost:53343/api/user/logcustomer');
  var res = await http.post(url,
      headers: {
        HttpHeaders.contentTypeHeader: cont,
      },
      body: json.encode(auth));
  Map<String, dynamic> map = jsonDecode(res.body);
  return User.fromJson(map);
}
