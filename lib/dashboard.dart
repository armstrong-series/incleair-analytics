import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class Dashboard extends StatefulWidget {
  @override
   _DashboardState createState() => _DashboardState();
}



class _DashboardState extends State<Dashboard> {

  Material item(IconData icon, String heading, int color){
    return Material(
       color: Colors.white,
       elevation: 14.0,
       shadowColor: Color(0x802196F3),
       borderRadius: BorderRadius.circular(24.0),
       child:Center(
         child:Padding(
            padding: const EdgeInsets.all(8.0),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                       Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(heading,
                          style: TextStyle(
                            color: new Color(color),
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                  //   Icon
                    Material(
                      color: new Color(color),
                      borderRadius: BorderRadius.circular(24.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(
                          icon,
                          color: Colors.white ,
                          size:30.0,
                        ),
                      ),
                    )
              ],
            ),
         ],)
       ),
       )
    );
  }
  @override

  Widget build(BuildContext context){
    return Scaffold(
      body: StaggeredGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0,),
          children: <Widget>[
            item(Icons.graphic_eq, "TotalViews", 0xffed622b),
            item(Icons.bookmark, "Bookmark", 0xff26cb3c),
            item(Icons.notifications, "Notifications", 0xffff3266),
            item(Icons.attach_money, "Balance", 0xfff4c83f),
            item(Icons.settings, "Settings", 0xff622F74),
            item(Icons.message, "Messages", 0xff7297ff),
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 130.0), 
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(2, 240.0),
          StaggeredTile.extent(2, 120.0),
        ],
      ),
    );
  }
}

