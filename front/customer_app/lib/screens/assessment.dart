import 'dart:convert';
import 'dart:io';

import 'package:customer_app/models/assistant.dart';
import 'package:customer_app/models/customer.dart';
import 'package:customer_app/models/eval.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Assessment extends StatefulWidget {
  const Assessment({Key? key, required this.at, required this.cu})
      : super(key: key);
  final Customer cu;
  final Assistant at;
  @override
  _AssessmentState createState() => _AssessmentState();
}

class _AssessmentState extends State<Assessment> {
  @override
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var descCon = TextEditingController();
  var pointsCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: descCon,
                decoration: const InputDecoration(
                    labelText: 'Comments', icon: Icon(Icons.comment)),
                style: TextStyle(color: Colors.greenAccent),
              ),
              TextFormField(
                controller: pointsCon,
                decoration: const InputDecoration(
                  labelText: 'Points from 1-5',
                  icon: Icon(Icons.point_of_sale),
                ),
                style: TextStyle(color: Colors.greenAccent),
              ),
              ElevatedButton(
                  onPressed: () async {
                    var p = int.parse(pointsCon.text);
                    var e = Eval(
                        customerId: widget.cu.id,
                        assistantId: widget.at.id,
                        desc: descCon.text,
                        points: p);
                    var cont = 'application/json';
                    var url = Uri.parse(
                        'http://localhost:53343/api/EvaluationSystem/add');

                    var res = await http.post(url,
                        headers: {
                          HttpHeaders.contentTypeHeader: cont,
                        },
                        body: json.encode(e));
                    Map<String, dynamic> map = jsonDecode(res.body);
                    var u = Eval.fromJson(map);

                    Navigator.pop(context);
                  },
                  child: Text('Grade'))
            ],
          )),
    );
  }
}

class Thanks extends StatefulWidget {
  const Thanks({Key? key}) : super(key: key);

  @override
  _ThanksState createState() => _ThanksState();
}

class _ThanksState extends State<Thanks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(child: Text('OK')),
      ),
    );
  }
}
