import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uidesign01/user.dart';

class UserScreen extends StatefulWidget {
  final User user;

  const UserScreen({super.key, required this.user});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Center(
                child: ClipOval(
                  child: Image.network(
                    widget.user.image,
                    fit: BoxFit.cover,
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
