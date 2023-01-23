import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
              // Container(
              //   padding: EdgeInsets.only(top: 10, bottom: 10),
              //   width: 300,
              //   child: Center(
              //     child: Image.network(
              //         'https://i.postimg.cc/NMLxBCJs/Logo-removebg-preview.png'),
              //   ),
              // ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      onChanged: (value) => {print(value)},
                      controller: _usernameController,
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter your user name',
                          hintText: 'User Name'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      onChanged: (value) => {print(value)},
                      controller: _passwordController,
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter your password',
                          hintText: 'Password'),
                    ),
                  )
                ]),
              ),
              Container(
                width: 200,
                child: ElevatedButton(
                  onPressed: loginButtonFun,
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //login button function
  void loginButtonFun() {
    if (_usernameController.text == 'user' &&
        _passwordController.text == 'user') {
      print('Login success');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePages()));
    } else {
      print('Login fail');
      showAlertDialog(context);
    }
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('Ok'));

    AlertDialog alertDialog = AlertDialog(
      title: Text('Error'),
      content: Text('Wrong username and password'),
      actions: [okButton],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
