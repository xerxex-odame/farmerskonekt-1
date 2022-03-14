import 'package:farmers_konekt/change_pas.dart';
import 'package:farmers_konekt/farmers/notification.dart';
import 'package:farmers_konekt/farmers/settings.dart';
//import 'package:farmers_konekt/homeview/login.dart';
import 'package:farmers_konekt/message.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Dash extends StatefulWidget {
  const Dash({Key? key}) : super(key: key);

  @override
  State<Dash> createState() => _DashState();
}

List<_SalesData> data = [
  _SalesData('Jan', 1),
  _SalesData('Feb', 28),
  _SalesData('Mar', 34),
  _SalesData('Apr', 32),
  _SalesData('May', 40),
  _SalesData('Jun', 34),
  _SalesData('Jul', 32),
  _SalesData('Aug,', 40),
  _SalesData('Sept', 34),
  _SalesData('Oct', 32),
  _SalesData('Nov', 40),
  _SalesData('Dec', 34),
];

class _DashState extends State<Dash> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          // PopupMenuButton(
          //   child: Center(child: Text('Hire me')),
          //   itemBuilder: (context) {
          //     return List.generate(1, (index) {
          //       return PopupMenuItem(
          //         child: Column(children: [
          //           Text('Clic here to choose  a quipment youre lookig for!'),
          //           TextButton(onPressed: () {}, child: Text('Equipment')),
          //         ]),
          //       );
          //     });
          //   },
          // ),
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
                                      builder: (context) => Recoverd()));
                            },
                            child: Text('Change Password')),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Settings()));
                            },
                            child: Text('Change personal inf')),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Settings()));
                            },
                            child: Text('Settings')),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RequestBooking()));
                            },
                            child: Text('History')),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Settings()));
                            },
                            child: Text('Change Password')),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Message()));
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
            //Container(
            Card(
              color: Colors.lightBlue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                //color: Colors.amberAccent,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  SizedBox(
                    width: 10,
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
                ],
              ),
            ),
            //),

            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
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
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                    'The chart beside shows the tractor services you requested'),
                Expanded(
                  child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      // Chart title
                      title: ChartTitle(text: 'Request history'),
                      // Enable legend
                      legend: Legend(isVisible: true),
                      // Enable tooltip
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries<_SalesData, String>>[
                        LineSeries<_SalesData, String>(
                            dataSource: data,
                            xValueMapper: (_SalesData sales, _) => sales.year,
                            yValueMapper: (_SalesData sales, _) => sales.sales,
                            name: 'Request Odered',
                            // Enable data label
                            dataLabelSettings:
                                DataLabelSettings(isVisible: true))
                      ]),
                ),
                

                // Expanded(
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     //Initialize the spark charts widget
                //     child: SfSparkLineChart.custom(
                //       //Enable the trackball
                //       trackball: SparkChartTrackball(
                //           activationMode: SparkChartActivationMode.tap),
                //       //Enable marker
                //       marker: SparkChartMarker(
                //           displayMode: SparkChartMarkerDisplayMode.all),
                //       //Enable data label
                //       labelDisplayMode: SparkChartLabelDisplayMode.all,
                //       xValueMapper: (int index) => data[index].year,
                //       yValueMapper: (int index) => data[index].sales,
                //       dataCount: 1,
                //     ),
                //   ),
                // ),
              ],
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
    ));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
