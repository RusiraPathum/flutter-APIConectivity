import 'package:flutter/material.dart';
import 'package:uidesign01/user_screen.dart';

import 'rest_api_service.dart';
import 'user.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:uidesign01/rest_api_service.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  final apiService = RestAPIService();

  List<User> usersList = <User>[];
  List<bool> favoritStatusList = [];
  List<String> favoritUsersList = [];

  late Icon favoritIcon;

  @override
  void initState() {
    apiService.getUsers().then((value) {
      // if (value != null) {
      // setState(() {
      //   usersList = value;
      // });

      // }

      if (value.isNotEmpty) {
        for (User user in value) {
          favoritStatusList.add(false);
        }
      }
    });

    // print(favoritStatusList);

    favoritIcon = Icon(
      Icons.favorite_border,
      color: Colors.red,
    );
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
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: usersList.length ?? 0,
            //     itemBuilder: (context, index) {
            //       if (usersList != null && usersList.isNotEmpty) {
            //         return InkWell(
            //           onTap: () {
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) =>
            //                         UserScreen(user: usersList[index])));
            //           },
            //           child: Container(
            //             decoration: BoxDecoration(
            //                 color: Colors.white,
            //                 borderRadius: BorderRadius.circular(10),
            //                 boxShadow: [
            //                   BoxShadow(
            //                       blurRadius: 3,
            //                       spreadRadius: 3,
            //                       color: Colors.grey.withOpacity(0.3))
            //                 ]),
            //             margin:
            //                 EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            //             padding:
            //                 EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            //             child: ListTile(
            //               title: Text(
            //                 usersList[index].name != null
            //                     ? usersList[index].name
            //                     : '',
            //                 style: TextStyle(fontSize: 17, color: Colors.black),
            //               ),
            //               subtitle: Text(
            //                 usersList[index].city ?? '',
            //                 style: TextStyle(fontSize: 15, color: Colors.black),
            //               ),
            //               leading: ClipOval(
            //                 child: Image.network(
            //                   usersList[index].image,
            //                   fit: BoxFit.fill,
            //                   width: 60,
            //                   height: 60,
            //                 ),
            //               ),
            //               trailing: IconButton(
            //                 icon: Icon(Icons.favorite_border),
            //                 onPressed: () {},
            //               ),
            //             ),
            //           ),
            //         );
            //       } else {
            //         return Container(
            //           child: Center(
            //               child: Text(
            //             'Loading...',
            //             style: TextStyle(color: Colors.black, fontSize: 15),
            //           )),
            //         );
            //       }
            //     },
            //   ),
            // )

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
                                    fontSize: 17, color: Colors.black),
                              ),
                              subtitle: Text(
                                snapShot.data![index].city ?? '',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
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
                                icon: getFavourItemIcon(index),
                                onPressed: () {
                                  setState(() {
                                    favoritStatusList[index] =
                                        !favoritStatusList[index];

                                    // if (favoritStatusList.contains(snapShot.data![index])) {
                                    //   favoritStatusList.remove(snapShot.data![index]);
                                    // }else{
                                    //   favoritStatusList.add(snapShot.data![index]);
                                    // }

                                    // if (favoritStatusList[index]) {
                                    //   favoritStatusList[index] = false;
                                    // }else{
                                    //   favoritStatusList[index] = true;
                                    // }
                                  });
                                },
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
                        //     child: Text(
                        //   'Loading...',
                        //   style: TextStyle(color: Colors.black, fontSize: 15),
                        // )

                        child: SpinKitCircle(
                          color: Colors.orange,
                          duration: const Duration(milliseconds: 30000),
                        ),
                      ),
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

  Icon getFavourItemIcon(int index) {
    if (favoritStatusList[index]) {
      return Icon(Icons.favorite, color: Colors.red);
    } else {
      return Icon(
        Icons.favorite_border,
        color: Colors.red,
      );
    }
  }
}
