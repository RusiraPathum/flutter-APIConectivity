import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uidesign01/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigationToLoginScreen(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,

      child: Center(
          child: Icon(
        Icons.holiday_village,
        size: 200,
      )),
      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Center(
      //         child: Icon(
      //       Icons.holiday_village,
      //       size: 200,
      //     )),
      //     Container(
      //       child: ElevatedButton(
      //         onPressed: () {
      //           Navigator.pushAndRemoveUntil(
      //             context,
      //             MaterialPageRoute(
      //                 builder: (BuildContext context) => LoginPage()),
      //             ModalRoute.withName('/'),
      //           );
      //         },
      //         child: Text('Push and Remove until'),
      //       ),
      //     )
      //   ],
      // )
    );
  }

  void navigationToLoginScreen(BuildContext context) {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }
}
