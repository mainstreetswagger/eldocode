import 'dart:convert';

import 'package:eldo_app/models/assistant.dart';
import 'package:eldo_app/models/eval.dart';
import 'package:eldo_app/models/item.dart';
import 'package:eldo_app/models/user.dart';
import 'package:eldo_app/packages/titled_nav_bar/navigation_bar.dart';
import 'package:eldo_app/packages/titled_nav_bar/navigation_bar_item.dart';
import 'package:eldo_app/widgets/itemsList.dart';
import 'package:eldo_app/widgets/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'evaluation.dart';

class NavBar extends StatefulWidget {
  final User user;
  final Assistant at;
  final List<Item> items;
  final List<Eval> evals;
  const NavBar(Key? key, this.user, this.at, this.items, this.evals)
      : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  var profile =
      TitledNavigationBarItem(icon: Icon(Icons.person), title: Text('profile'));
  var shop =
      TitledNavigationBarItem(icon: Icon(Icons.shop), title: Text('shop'));
  var eval = TitledNavigationBarItem(
      icon: Icon(Icons.assessment), title: Text('points'));
  List<TitledNavigationBarItem> list = [];
  int length = 0;
  int index = 0;
  int currentIndex = 0;
  late Function(int) tap;
  late TitledBottomNavigationBar bar;
  void initState() {
    list = [profile, shop, eval];
    length = list.length;
    tap = (index) {
      setState(() {
        currentIndex = index;
      });
      print(index);
    };
    bar = TitledBottomNavigationBar(
      onTap: tap,
      items: list,
      currentIndex: index,
    );
  }

  void _onItemTapped(int i) {
    setState(() {
      index = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pageList = <Widget>[
      Profile(null, widget.user, widget.at),
      Items(null, widget.items, widget.at.id),
      Evaluation(key: null, atId: widget.at.id, evals: widget.evals),
    ];
    print('Now see here ' + index.toString());
    return MaterialApp(
      title: 'Go Eldorado',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Assistant: ' + widget.user.name),
          centerTitle: true,
        ),
        bottomNavigationBar: bar,
        body: Center(
          child: pageList[currentIndex],
        ),
      ),
    );
  }
}
