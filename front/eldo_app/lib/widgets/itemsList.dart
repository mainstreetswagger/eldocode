import 'dart:convert';
import 'dart:io';

import 'package:eldo_app/models/cart.dart';
import 'package:eldo_app/models/customer.dart';
import 'package:eldo_app/models/item.dart';
import 'package:eldo_app/models/responseCart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Items extends StatefulWidget {
  final List<Item> items;
  final String atId;
  const Items(Key? key, this.items, this.atId) : super(key: key);
  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    List<String> itemIds = [];
    var items = widget.items;
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (_, index) {
        return Column(
          children: [
            Column(
              children: [
                Container(child: Text(items[index].name)),
                Container(
                  child: Image.memory(
                      base64Decode(items[index].image).buffer.asUint8List()),
                ),
                Container(child: Text(items[index].price.toString() + ' Р.')),
                Container(child: Text(items[index].description)),
                ElevatedButton.icon(
                    onPressed: () {
                      itemIds.add(items[index].id);
                    },
                    icon: Icon(Icons.add),
                    label: Text('Add to customer')),
                SizedBox(
                  height: 5.0,
                )
              ],
            ),
            ElevatedButton.icon(
                onPressed: () async {
                  var rc = await addCart(itemIds, widget.atId);
                  print('this new id of cart ' + rc.id);
                },
                icon: Icon(Icons.help),
                label: Text('Send to customer')),
          ],
        );
      },
    );
  }
}

Future getItems() async {
  print('do u work?');
  var url = Uri.parse('http://localhost:53343/api/items/get');
  var res = await http.get(url);
  return res.body;
}

Future<Customer> getCustomer() async {
  var url = Uri.parse('http://localhost:53343/api/customer/get');
  var res = await http.get(url);
  Map<String, dynamic> map = jsonDecode(res.body);

  return Customer.fromJson(map);
}

Future<ResCart> addCart(List<String> itemIds, String atId) async {
  print('watch here');
  var c = await getCustomer();
  print('this is customer id' + c.id);
  var cart = Cart(itemIds: itemIds, customerId: c.id, assistantId: atId);
  var cont = 'application/json';
  var url = Uri.parse('http://localhost:53343/api/items/addcart');
  var res = await http.post(url,
      headers: {
        HttpHeaders.contentTypeHeader: cont,
      },
      body: json.encode(cart));
  Map<String, dynamic> map = jsonDecode(res.body);
  return ResCart.fromJson(map);
}
