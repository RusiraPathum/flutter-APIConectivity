import 'package:flutter/material.dart';
import 'package:uidesign01/user_screen.dart';

import 'rest_api_service.dart';
// import 'package:uidesign01/rest_api_service.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  final apiService = RestAPIService();

  @override
  void initState() {
    apiService.getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: apiService.getUsers(),
                builder: (context, snapShot) {
                  if (snapShot.hasData) {
                    return ListView.builder(
                      itemCount: snapShot.data!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserScreen(
                                        user: snapShot.data![index])));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 3,
                                      spreadRadius: 3,
                                      color: Colors.grey.withOpacity(0.3))
                                ]),
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: ListTile(
                              title: Text(
                                snapShot.data![index].name != null
                                    ? snapShot.data![index].name
                                    : '',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                              subtitle: Text(
                                snapShot.data![index].city ?? '',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                              leading: ClipOval(
                                child: Image.network(
                                  snapShot.data![index].image,
                                  fit: BoxFit.fill,
                                  width: 60,
                                  height: 60,
                                ),
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.favorite_border),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        );

                        // Container(
                        //   color: Colors.blue,
                        //   height: 50,
                        //   width: 200,
                        //   margin: EdgeInsets.all(10 ),
                        // );
                      },
                    );
                  } else {
                    return Container(
                      child: Center(
                          child: Text(
                        'Loading...',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      )),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
