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

                Stack(
                  alignment: Alignment.bottomCenter,
//==========================================================================
// TEXT
//==========================================================================                  
                  children: <Widget>[
                    FadeInImage.assetNetwork(placeholder: 'assets/images/loading.gif', image: 'https://firebasestorage.googleapis.com/v0/b/hellotest06-88fae.appspot.com/o/logo%2Ftoplogo3.jpg?alt=media&token=7f9f78ef-fed9-4505-8a19-25fda52bfbec'),
                    //FadeInImage.assetNetwork(placeholder: 'assets/images/loading.gif', image: 'https://firebasestorage.googleapis.com/v0/b/hellotest06-88fae.appspot.com/o/logo%2Ftoplogo.JPG?alt=media&token=fe467e4d-288b-44cc-ab3d-bb86257d8a80'),
                    //  Padding(padding: const EdgeInsets.only(bottom: 10),child: 
                    //  Column(
                    //    children: <Widget>[
                    //      Text('Last Minute Deal',style: TextStyle(color: Colors.white, fontSize: 20,fontFamily: 'Kanit')),
                    //      Text('Seedel, est. 2020',style: TextStyle(color: Colors.white, fontSize: 12)),                         
                    //    ],
                    //  ),
                     
                    //  ),
// //==========================================================================
// // IMAGE
// //==========================================================================
//                     // Container(
//                     //   height: 150,
//                     //   child: Image(fit: BoxFit.cover,
//                     //   image: AssetImage('assets/images/tophome.JPG'))),
//                     // FadeInImage.assetNetwork(placeholder: 'assets/images/loading.gif', image: 'https://firebasestorage.googleapis.com/v0/b/seedeal03.appspot.com/o/top1.PNG?alt=media&token=7668e441-5e7f-4049-a116-9d1480485810'),
//                     //FadeInImage.assetNetwork(placeholder: 'assets/images/loading.gif', image: 'https://firebasestorage.googleapis.com/v0/b/hellotest06-88fae.appspot.com/o/logo%2Ftoplogo.JPG?alt=media&token=fe467e4d-288b-44cc-ab3d-bb86257d8a80'),
                  ],
                ),
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
        child: FadeInImage.assetNetwork(placeholder: 'assets/images/loading.gif', image: 'https://firebasestorage.googleapis.com/v0/b/hellotest06-88fae.appspot.com/o/logo%2Fbottomlogo2.jpg?alt=media&token=71bf1c14-a6fe-4002-a842-57286476efd5'),
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
