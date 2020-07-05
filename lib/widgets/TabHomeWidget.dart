//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
//==========================================================================
// STATUS BAR COLOR (IMPORT FLUTTER/SERVICE)
//==========================================================================   
   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor:  Theme.of(context).primaryColor,));
    return 
//==========================================================================
// BODY
//==========================================================================
            ListView(
              children: <Widget>[
//==========================================================================
// IMAGE
//==========================================================================
               // Image(image: AssetImage('assets/images/tophome.JPG')),
                FadeInImage.assetNetwork(placeholder: 'assets/images/loading.gif', image: 'https://firebasestorage.googleapis.com/v0/b/hellotest06-88fae.appspot.com/o/tophome.JPG?alt=media&token=1193fa60-e1f9-43ac-b387-66f455154b19'),

                
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
        child: FadeInImage.assetNetwork(placeholder: 'assets/images/loading.gif', image: 'https://firebasestorage.googleapis.com/v0/b/hellotest06-88fae.appspot.com/o/lady.JPG?alt=media&token=dac6dd41-d0a8-4206-8839-b39ea07adf4e'),
        //child: Image(image: AssetImage('assets/images/lady.JPG')),
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
  Choice(title: 'ที่พัก', icon: Icons.store),
  Choice(title: 'ทัวร์ท้องถิ่น', icon: Icons.accessibility),
  Choice(title: 'ร้านอาหาร', icon: Icons.restaurant)
];
