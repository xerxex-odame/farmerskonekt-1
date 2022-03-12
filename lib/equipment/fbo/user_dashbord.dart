import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmers_konekt/farmers/das.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:video_player/video_player.dart';

class UserDashBoardr extends StatefulWidget {
  const UserDashBoardr({Key? key}) : super(key: key);

  @override
  State<UserDashBoardr> createState() => _UserDashBoardrState();
}

late VideoPlayerController _controller;
// List<SalesData> _chartData;
//String _SalesData = 'value';
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

//String _getChartData = '';
// @override
// void iniState() {
//   _chartData = getChartData();
//   super.initState();
// }

class _UserDashBoardrState extends State<UserDashBoardr> {
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        var _initializeVideoPlayerFuture = _controller.initialize();
        // Ensure the first frame is shown after the video is initialized
        setState(() {
          _controller.play();
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: Column(
          children: [
          Card(
            child: Column(children: [
              SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _controller.value.size.width * 0.5,
                    height: _controller.value.size.height * 0.5,
                    child: VideoPlayer(_controller),
                  ),
                ),
              ),
            ]
            ),
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('The chart beside shows the tractor services you requested'),
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
                          dataLabelSettings: DataLabelSettings(isVisible: true))
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
          //Initialize the chart widget
        ]),
      ),
    );
  }

  // List<SalesData> getChartData() {
  //   final List<SalesData> chatData = [
  //     SalesData(2017, 25),
  //     SalesData(2018, 24),
  //     SalesData(2019, 23),
  //     SalesData(2020, 20),
  //   ];
  //   return chatData;
  // }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

// class SalesData {
//   SalesData(this.year, this.sales);
//   final double year;
//   final double sales;
// }
