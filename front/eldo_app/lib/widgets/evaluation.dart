import 'dart:convert';
import 'dart:io';

import 'package:eldo_app/models/eval.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Evaluation extends StatefulWidget {
  String atId;
  List<Eval> evals;
  Evaluation({Key? key, required this.atId, required this.evals})
      : super(key: key);

  @override
  _EvaluationState createState() => _EvaluationState();
}

class _EvaluationState extends State<Evaluation> {
  late List<Eval> list;
  Future<List<Eval>>? _refresh() async {
    return await getEval(widget.atId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Eval>>(
        future: _refresh(),
        builder: (BuildContext context, AsyncSnapshot<List<Eval>> snapshot) {
          widget.evals = snapshot.data!;
          return ListView.builder(
              itemCount: widget.evals.length,
              itemBuilder: (_, index) {
                return Column(
                  children: [
                    Container(
                        child: Text(
                      widget.evals[index].createdDate,
                      style:
                          TextStyle(color: Colors.greenAccent, fontSize: 25.0),
                    )),
                    Container(
                        child: Text(
                      widget.evals[index].points.toString() + ' points',
                      style:
                          TextStyle(color: Colors.greenAccent, fontSize: 25.0),
                    )),
                    Container(
                        child: Text(
                      widget.evals[index].desc,
                      style:
                          TextStyle(color: Colors.greenAccent, fontSize: 25.0),
                    )),
                    SizedBox(
                      height: 15.0,
                    ),
                  ],
                );
              });
        },
      ),
    );
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
