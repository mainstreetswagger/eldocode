import 'package:eldo_app/models/assistant.dart';
import 'package:eldo_app/models/user.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final User u;
  final Assistant a;
  const Profile(Key? key, this.u, this.a) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    print('profile is here');
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Position:  ${widget.a.position}'),
        Text('Name:  ${widget.u.name}'),
        Text('Age:  ${widget.u.age}'),
        Text('Address:  ${widget.u.address}'),
        Text('Phone:  ${widget.u.phone}'),
        Text('Shop:  ${widget.a.shop}'),
      ],
    ));
  }
}
