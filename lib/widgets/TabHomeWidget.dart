//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
// import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import '../screens/HotelDetailPage.dart';
// import '../screens/SearchDealFlightHotelPage.dart';
// import '../screens/SearchDealHotelPage.dart';
// import '../screens/SearchDealTrainPage.dart';
import '../widgets/LVHoriSearchDealWidget.dart';

//==========================================================================
// MAIN CLASS
//==========================================================================
class TabHomeWidget extends StatefulWidget {
//==========================================================================
// CONSTRUCTURE
//==========================================================================  
  const TabHomeWidget({
    Key key,
  }) : super(key: key);  
//==========================================================================
// OVERRIDING
//==========================================================================  
  @override
  _TabHomeWidgetState createState() => _TabHomeWidgetState();
}

//==========================================================================
// STATE CLASS
//==========================================================================
class _TabHomeWidgetState extends State<TabHomeWidget> {
//==========================================================================
// DECLARE VARIABLE
//==========================================================================

//==========================================================================
// OVERRIDE BUILD WIDGET
//========================================================================== 
  @override
  Widget build(BuildContext context) {
    // FlutterStatusbarcolor.setStatusBarColor(Theme.of(context).primaryColor);
    return 
//==========================================================================
// BODY
//==========================================================================
            ListView(
              children: <Widget>[
//==========================================================================
// IMAGE
//==========================================================================
                Image(image: AssetImage('assets/images/tophome.JPG')),
//==========================================================================
// TAB BAR
//==========================================================================
                Container(
                  height: 80,
                  color: Theme.of(context).primaryColor,
                  child: DefaultTabController(
                    initialIndex: 0,
                    length: choices.length,
                    child: TabBar(
                    onTap: (int index){
                      switch (index) {
                        // case 0: {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SearchDealFlightHotelPage()),);}break;
                        // case 1: {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SearchDealTrainPage()),);}break;
                        // case 2: {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SearchDealHotelPage()),);}break;              
                        default:
                      }
                    },                            
                      tabs: choices.map((Choice choice) {
                        return Tab(
                          text: choice.title,
                          icon: Icon(choice.icon),
                        );
                      }).toList(),
                    ),
                  ),
                ),
//==========================================================================
// TOP DEAL
//==========================================================================
      Padding(
        padding: const EdgeInsets.only(right: 8,left: 8, top: 8, bottom: 4),
        child: Text('Top Deals',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),), 
      ),
//==========================================================================
// LIST VIEW HORIZONAL
//==========================================================================   
      LVHoriSearchDealWidget(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HotelDetailPage()),);},), 
//==========================================================================
// TOP DEAL
//==========================================================================
      Padding(
        padding: const EdgeInsets.only(right: 8,left: 8, top: 8, bottom: 4),
        child: Text('Something extra for your trip?',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),), 
      ),
 //==========================================================================
// IMAGE
//==========================================================================           
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image(image: AssetImage('assets/images/lady.JPG')),
      ),
//==========================================================================
// WIDGET
//==========================================================================
            ],
            );
  }
}

//==========================================================================
// CLASS CHOICE
//==========================================================================
class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

//==========================================================================
// CLASS CHOICE
//==========================================================================
const List<Choice> choices = const <Choice>[
  Choice(title: 'Flight + Hotel', icon: Icons.flight),
  Choice(title: 'Train', icon: Icons.tram),
  Choice(title: 'Hotel', icon: Icons.hotel),
];
