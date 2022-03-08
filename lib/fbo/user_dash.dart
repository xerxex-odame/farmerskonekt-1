import 'package:farmers_konekt/farmers/das.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UserDash extends StatefulWidget {
  const UserDash({ Key? key }) : super(key: key);

  @override
  State<UserDash> createState() => _UserDashState();
}

class _UserDashState extends State<UserDash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          PopupMenuButton(
            child: Center(child: Text('Hire me')),
            itemBuilder: (context) {
              return List.generate(1, (index) {
                return PopupMenuItem(
                  child: Column(children: [
                    Text('Clic here to choose  a quipment youre lookig for!'),
                    TextButton(onPressed: () {}, child: Text('Equipment')),
                  ]),
                );
              });
            },
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          CircleAvatar(
            backgroundColor: Colors.redAccent,
            child: const Text('ko'),
          ),
          PopupMenuButton(
            //initialValue: 0,
            child: Center(child: Icon(Icons.menu)),
            itemBuilder: (context) {
              return List.generate(1, (index) {
                return PopupMenuItem(
                    value: index,
                    child: Column(
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dash()));
                            },
                            child: Text('Change Password')),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dash()));
                            },
                            child: Text('Change personal inf')),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dash()));
                            },
                            child: Text('Settings')),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dash()));
                            },
                            child: Text('History')),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dash()));
                            },
                            child: Text('Change Password')),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dash()));
                            },
                            child: Text('Contact Us')),
                      ],
                    ));
              });
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.greenAccent,
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 47, 101, 145),
              ),
              child: Text('Seth Abbey'),
            ),
            Divider(
              color: Colors.blueAccent,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.chat_sharp),
                Text('DashBoard'),
              ],
            ),
            Divider(
              color: Colors.blueAccent,
            ),
            Text('Equipment request'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.refresh),
                TextButton(onPressed: () {}, child: Text('All Request')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.hide_image_rounded),
                TextButton(onPressed: () {}, child: Text('Hiring')),
              ],
            ),
            Divider(
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Actions',
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.white),
              ),
            ),
            Row(
              children: [
                Icon(Icons.settings),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Settings',
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
            Row(
              children: [
                Icon(Icons.restart_alt),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Log out',
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ],
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      color: Colors.blueAccent,
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('0'),
                            SizedBox(
                              height: 20,
                            ),
                            Icon(Icons.refresh_rounded)
                          ],
                        ),
                        Text('Total Request'),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(color: Colors.lightBlue),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('View'),
                            SizedBox(
                              height: 20,
                            ),
                            Icon(Icons.forward),
                          ],
                        )
                      ]),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      color: Colors.blueAccent,
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('0'),
                            SizedBox(
                              height: 20,
                            ),
                            Icon(Icons.refresh_rounded)
                          ],
                        ),
                        Text('Pending Request'),
                        Divider(color: Colors.lightBlue),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('View'),
                            SizedBox(
                              height: 20,
                            ),
                            Icon(Icons.forward),
                          ],
                        )
                      ]),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      color: Colors.blueAccent,
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('0'),
                            SizedBox(
                              height: 20,
                            ),
                            Icon(Icons.refresh_rounded)
                          ],
                        ),
                        Text('Assigned Request'),
                        Divider(color: Colors.lightBlue),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('View'),
                            SizedBox(
                              height: 20,
                            ),
                            Icon(Icons.forward),
                          ],
                        )
                      ]),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      color: Colors.blueAccent,
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('0'),
                            SizedBox(
                              height: 20,
                            ),
                            Icon(Icons.refresh_rounded)
                          ],
                        ),
                        Text('Completed Request'),
                        Divider(color: Colors.lightBlue),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('View'),
                            SizedBox(
                              height: 20,
                            ),
                            Icon(Icons.forward),
                          ],
                        )
                      ]),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      color: Colors.blueAccent,
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('0'),
                            SizedBox(
                              height: 20,
                            ),
                            Icon(Icons.refresh_rounded)
                          ],
                        ),
                        Text('Cancelled Request'),
                        Divider(color: Colors.lightBlue),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('View'),
                            SizedBox(
                              height: 20,
                            ),
                            Icon(Icons.forward),
                          ],
                        )
                      ]),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: 400,
              child: Column(
                //color: Colors.amberAccent,
                children: [
                Row(
                  children: [
                    Text('Equipment Request'),
                    PopupMenuButton(
                      child: Center(child: Text('Weekly')),
                      itemBuilder: (context) {
                        return List.generate(1, (index) {
                          return PopupMenuItem(
                            child: Column(children: [
                              Text('Choose time range'),
                              TextButton(
                                  onPressed: () {}, child: Text('weekly')),
                              TextButton(
                                  onPressed: () {}, child: Text('Monthly')),
                              TextButton(
                                  onPressed: () {}, child: Text('Yearly')),
                            ]),
                          );
                        });
                      },
                    ),
                  ],
                ),
              ]),
            ),
            Text('No data avaliable'),
            Divider(
              color: Colors.blueGrey,
            ),
            Row(
              children: [
                Icon(Icons.plus_one_outlined),
                ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Request Service',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              height: 200,
              width: 300,
              color: Colors.blueGrey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.replay_outlined),
                      Text('Recent Requests')
                    ],
                  ),
                  Text('No data avaliable yet'),
                ],
              ),
            ),
          ]),
        ),
      ),

      // body: ListView(
      //   children: [
      //     SizedBox(
      //       //height: MediaQuery.of(context).size.height / 4,
      //       child: ListView(
      //         scrollDirection: Axis.horizontal,
      //         children: [

      //           GestureDetector(
      //             onTap: () {
      //               Navigator.push(context,
      //                   MaterialPageRoute(builder: (context) => LogIn()));
      //             },
      //             child: Container(
      //               height: MediaQuery.of(context).size.height / 2,
      //               width: MediaQuery.of(context).size.width / 2,
      //               color: Colors.lightBlue,
      //               child: Column(
      //                 children: [
      //                   Padding(
      //                     padding: const EdgeInsets.all(20.0),
      //                     child: Card(
      //                       color: Colors.lightBlueAccent,
      //                       child: Row(
      //                         children: [
      //                           Row(
      //                             mainAxisAlignment:
      //                                 MainAxisAlignment.spaceBetween,
      //                             children: [
      //                               Text('0'),
      //                               SizedBox(
      //                                 width: 220,
      //                               ),
      //                               Icon(Icons.refresh_sharp),
      //                             ],
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                   ),
      //                   Text('Total Request'),
      //                   Divider(
      //                     color: Colors.black,
      //                   ),
      //                   Padding(
      //                     padding: const EdgeInsets.all(20.0),
      //                     child: Row(
      //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                       //crossAxisAlignment: CrossAxisAlignment.baseline,
      //                       children: [
      //                         Text('Views'),
      //                         // SizedBox(
      //                         //   width: 50,
      //                         // ),
      //                         Icon(Icons.forward),
      //                       ],
      //                     ),
      //                   )
      //                 ],
      //               ),
      //             ),
      //           ),
      //           Card(
      //             child: Container(
      //                height: MediaQuery.of(context).size.height / 2,
      //               width: MediaQuery.of(context).size.width / 2,
      //               color: Colors.redAccent,
      //               child: Column(
      //                 children: [
      //                   Padding(
      //                     padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      //                   ),
      //                   Row(
      //                     children: [
      //                       Padding(
      //                         padding: const EdgeInsets.all(15.0),
      //                         child: Text('0'),
      //                       ),
      //                       SizedBox(
      //                         width: 40,
      //                       )
      //                     ],
      //                   ),
      //                   Text('Pending Request'),
      //                   Divider(
      //                     color: Colors.black,
      //                   ),
      //                   Padding(
      //                     padding: const EdgeInsets.all(20.0),
      //                     child: Row(
      //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                       children: [
      //                         Text('Views'),
      //                         SizedBox(
      //                           width: 40,
      //                         ),
      //                         Icon(Icons.forward),
      //                       ],
      //                     ),
      //                   )
      //                 ],
      //               ),
      //             ),
      //           ),
      //           Card(
      //             child: Container(
      //               //height: MediaQuery.of(context).size.height / 4,
      //               //width: MediaQuery.of(context).size.width / 4,
      //               color: Colors.greenAccent,
      //               child: Column(
      //                 children: [
      //                   Padding(
      //                     padding: EdgeInsets.fromLTRB(15.0, 5, 15, 5),
      //                   ),
      //                   Row(
      //                     children: [
      //                       Padding(
      //                         padding: const EdgeInsets.all(15.0),
      //                         child: Text('0'),
      //                       ),
      //                       SizedBox(
      //                         width: 40,
      //                       ),
      //                     ],
      //                   ),
      //                   Text('Compled Request'),
      //                   Divider(
      //                     color: Colors.black,
      //                   ),
      //                   Row(
      //                     children: [
      //                       Text(''),
      //                       SizedBox(
      //                         width: 40,
      //                       )
      //                     ],
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(40.0),
      //       child: Center(
      //         child: Container(
      //           color: Colors.greenAccent,
      //           height: MediaQuery.of(context).size.height / 3,
      //           width: MediaQuery.of(context).size.width / 3,
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: [
      //               Padding(
      //                 padding: const EdgeInsets.all(15.0),
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     Text('Equipment report'),
      //                     Text('Monthly'),
      //                   ],
      //                 ),
      //               ),
      //               SizedBox(
      //                 width: 40,
      //               ),
      //               Center(
      //                 child: Text(
      //                   'No chart available',
      //                   textAlign: TextAlign.center,
      //                 ),
      //               ),
      //               Row(
      //                 children: [
      //                   Icon(Icons.plus_one_outlined),
      //                   SizedBox(
      //                     width: 10,
      //                   ),
      //                    Text('Resquest service'),
      //                 ],
      //               )
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //     Center(
      //       child: Padding(
      //         padding: const EdgeInsets.all(20.0),
      //         child: Container(
      //           color: Colors.blueGrey,
      //           //height: MediaQuery.of(context).size.height / 3,
      //           //width: MediaQuery.of(context).size.width / 3,
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: [
      //               Row(
      //                 children: [
      //                   Icon(Icons.read_more),
      //                   SizedBox(
      //                     width: 10,
      //                   ),
      //                   Text('requests'),
      //                 ],
      //               ),
      //               Text('No item available yet'),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //     GestureDetector(
      //       onTap: () {
      //         Navigator.push(
      //             context, MaterialPageRoute(builder: (context) => LogIn()));
      //       },
      //       child: Container(
      //         //height: MediaQuery.of(context).size.height / 4,
      //         //width: MediaQuery.of(context).size.width / 4,
      //         color: Colors.lightBlue,
      //         child: Column(
      //           children: [
      //             Padding(
      //               padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
      //               child: Card(
      //                 color: Colors.lightBlueAccent,
      //                 child: Row(
      //                   children: [
      //                     Row(
      //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                       children: [
      //                         Text('0'),
      //                         SizedBox(
      //                           width: 20,
      //                         ),
      //                         Icon(Icons.refresh_sharp),
      //                       ],
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //             Text('Total Request'),
      //             Divider(
      //               color: Colors.black,
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(20.0),
      //               child: Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 //crossAxisAlignment: CrossAxisAlignment.baseline,
      //                 children: [
      //                   Text('Views'),
      //                   SizedBox(
      //                     width: 50,
      //                   ),
      //                   Icon(Icons.forward),
      //                 ],
      //               ),
      //             )
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}