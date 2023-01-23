import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uidesign01/login_page.dart';
import 'package:uidesign01/spalsh_screen.dart';

class HomePage extends StatefulWidget {
  final String userName;

  const HomePage({super.key, required this.userName});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> data = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  'Welcome ${widget.userName}',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Expanded(
                child: ListView.builder(
               
                  // scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  // separatorBuilder: (context, index) {
                  //   return Container(color: Colors.grey, height: 1);
                  // },
                  itemBuilder: (context, index) {
                    return Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 3,
                                blurRadius: 3,
                              )
                            ]),
                        child: ListTile(
                            leading: Icon(
                              Icons.calendar_today_outlined,
                              color: Colors.greenAccent,
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              color: Colors.red,
                              onPressed: () {},
                            ),
                            title: Text(
                              data[index],
                              style: TextStyle(color: Colors.black),
                            
                            ),
                            subtitle: Text('Days')));

                    // return ListTile(
                    //   leading: Icon(
                    //     Icons.calendar_today_outlined,
                    //     color: Colors.greenAccent,
                    //   ),
                    //   trailing: IconButton(
                    //     icon: Icon(Icons.delete),
                    //     color: Colors.red,
                    //     onPressed: () {},
                    //   ),
                    //   title: Text(
                    //     data[index],
                    //     style: TextStyle(color: Colors.black),
                    //   ),
                    //   subtitle: Text('Days'),
                    // );

                    // return Container(
                    //   margin:
                    //       EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    //   height: 50,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10),
                    //       color: Colors.blue),
                    //   child: Center(
                    //     child: Text(
                    //       data[index],
                    //       style: TextStyle(
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   ),
                    // );
                  },
                ),
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text('Log out'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
