import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SampleLoginPage extends StatefulWidget {
  const SampleLoginPage({super.key});

  @override
  State<SampleLoginPage> createState() => _SampleLoginPageState();
}

class _SampleLoginPageState extends State<SampleLoginPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        leading: const Icon(
          Icons.home,
          color: Colors.white,
          size: 24.0,
          semanticLabel: 'Text to announce in accessibility modes',
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  blurRadius: 2.0,
                  spreadRadius: 3.0),
            ]),
        width: 200,
        height: 100,
        child: Center(
          // child: Image.asset('assets/27214903.png'),
          child: Image.network(
              'https://i.postimg.cc/PJ4DgYbQ/Screenshot-2022-12-27-214903.png'),
          // child: Text(
          //   'Login Page',
          //   style: TextStyle(color: Colors.white, fontSize: 20),
          // ),
        ),
      ),
    );
  }
}
