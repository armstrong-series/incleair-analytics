import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'navbar.dart';
import 'dashboard.dart';

class HomePage extends StatefulWidget {
  final Widget child;
  HomePage({Key key, this.child}) : super(key: key);

  _HomePageState createState() => _HomePageState();

}
class _HomePageState extends State<HomePage>{
  List<charts.Series<Pollution, String>> _seriesData;
  List<charts.Series<Task, String>> _seriesPieData;
  _generateData(){
   var data1 = [
      new Pollution(1980, 'Bathroom', 30),
      new Pollution(1980, 'Kitchen', 40),
      new Pollution(1980, 'LivingRoom', 10),
      new Pollution(1980, 'Bedroom', 150),
    ];

   var data2 = [
     new Pollution(1985, 'Bathroom', 302),
     new Pollution(1980, 'Kitchen', 420),
     new Pollution(1980, 'LivingRoom', 180),
     new Pollution(1980, 'Bedroom', 180),
   ];

   var data3 = [
     new Pollution(1980, 'Bathroom', 180),
     new Pollution(1980, 'Kitchen', 200),
     new Pollution(1980, 'LivingRoom', 300),
     new Pollution(1980, 'Bedroom', 200),
   ];
   var data4 = [
     new Pollution(1980, 'Bathroom', 180),
     new Pollution(1980, 'Kitchen', 200),
     new Pollution(1980, 'LivingRoom', 300),
     new Pollution(1980, 'Bedroom', 200),
   ];


   var pieData = [
      new Task('work', 35.8, Color(0xff3366cc)),
      new Task('Eat', 8.3, Color(0xff990099)),
      new Task('Commute', 10.8, Color(0xff109618)),
      new Task('TV', 15.6, Color(0xfffdbe19)),
      new Task('Sleep', 19.2, Color(0xffff9900)),
      new Task('Other', 10.3, Color(0xffdc3912)),
    ];


   _seriesData.add(
     charts.Series(
       data: data1,
       domainFn: (Pollution pollution,_)=> pollution.place,
       measureFn: (Pollution pollution,_)=> pollution.quantity,
       id: '2000',
       fillPatternFn: (_, __) => charts.FillPatternType.solid,
       fillColorFn: (Pollution pollution, _) => charts.ColorUtil.fromDartColor(Color(0xff9990099))),
   );


   _seriesData.add(
     charts.Series(
         data: data2,
         domainFn: (Pollution pollution,_)=> pollution.place,
         measureFn: (Pollution pollution,_)=> pollution.quantity,
         id: '2005',
         fillPatternFn: (_, __) => charts.FillPatternType.solid,
         fillColorFn: (Pollution pollution, _) => charts.ColorUtil.fromDartColor(Color(0xff109618))),
   );


   _seriesData.add(
     charts.Series(
         data: data3,
         domainFn: (Pollution pollution,_)=> pollution.place,
         measureFn: (Pollution pollution,_)=> pollution.quantity,
         id: '2010',
         fillPatternFn: (_, __) => charts.FillPatternType.solid,
         fillColorFn: (Pollution pollution, _) => charts.ColorUtil.fromDartColor(Color(0xffff9900))),
   );
   _seriesData.add(
     charts.Series(
         data: data4,
         domainFn: (Pollution pollution,_)=> pollution.place,
         measureFn: (Pollution pollution,_)=> pollution.quantity,
         id: '2015',
         fillPatternFn: (_, __) => charts.FillPatternType.solid,
         fillColorFn: (Pollution pollution, _) => charts.ColorUtil.fromDartColor(Color(0xffff9900))),
   );

    _seriesPieData.add(
      charts.Series(
        data: pieData,
        domainFn: (Task task,_)=> task.task,
        measureFn: (Task task,_)=> task.taskvalue,
        colorFn: (Task task,_)=> charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Daily Task',
        labelAccessorFn: (Task row,_) => '${row.taskvalue}',
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesPieData =  List<charts.Series<Task, String>>();
    _seriesData = List<charts.Series<Pollution, String>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     home: DefaultTabController(
       length: 3,
       child: Scaffold(
         drawer: NavDrawer(),
         appBar: AppBar(
           backgroundColor: Color(0xff9962D0),
           bottom: TabBar(
             indicatorColor: Color(0xff9962D0),
             tabs: [
               Tab(icon: Icon(FontAwesomeIcons.home)),
               Tab(icon: Icon(FontAwesomeIcons.chartLine)),
               Tab(icon: Icon(FontAwesomeIcons.chartPie)),

             ],
           ),
           title: Text('Incleair'),
         ),
         body: TabBarView(
           children: [
             Dashboard(),
             Padding(
               padding: EdgeInsets.all(8.0),
               child: Container(
                 child: Center(
                   child: Column(
                     children: <Widget>[
                       Text(
                         'Air Quality Index of Indoor Air Pollutants',
                         style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,
                             color: Colors.black87),
                       ),
                       Expanded(
                           child: charts.BarChart(
                             _seriesData,
                               animate:true,
                               barGroupingType: charts.BarGroupingType.grouped,
                               animationDuration: Duration(seconds: 5),
                           ),
                       ),
                     ],
                   ),
                 ),
               ),
             ),
             Padding(
               padding: EdgeInsets.all(8.0),
               child: Center(
                 child: Column(
                   children: <Widget>[
                     Text(
                       'Time spent on a daily tasks',
                       style: TextStyle(
                         fontSize: 24.0,
                         fontWeight: FontWeight.bold
                       ),
                     ),
                     SizedBox(height: 10.0,),
                     Expanded(
                         child: charts.PieChart(
                           _seriesPieData,
                           animate: true,
                           animationDuration: Duration(seconds: 5),
                           behaviors: [
                             new charts.DatumLegend(
                               outsideJustification: charts.OutsideJustification.endDrawArea,
                               horizontalFirst: false,
                               desiredMaxRows: 2,
                               cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                               entryTextStyle: charts.TextStyleSpec(
                                 color: charts.MaterialPalette.purple.shadeDefault,
                                 fontFamily: 'Georgia',
                                 fontSize: 11)
                             )
                           ],
                           defaultRenderer: new charts.ArcRendererConfig(
                             arcWidth: 100,
                             arcRendererDecorators: [
                              new charts.ArcLabelDecorator(
                                 labelPosition: charts.ArcLabelPosition.inside
                               )
                             ]
                           ),
                         )
                     )
                   ],
                 ),
               ),
             )
           ],
         ),
       ),
     ),
   );
  }
}

class Task{
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}

class Pollution {
  int year;
  String place;
  int quantity;

  Pollution(this.year, this.place, this.quantity);
}