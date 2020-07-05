//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import '../widgets/TabNotFoundWidget.dart';
import '../singletons/GlobalAppData.dart';
import '../screens/PostDealPage.dart';
// import '../widgets/tabpostdeal/TabPostDealOnlineWidget.dart';
//==========================================================================
// MAIN CLASS
//==========================================================================
class TabPostDealWidget extends StatefulWidget {
//==========================================================================
// CONSTUCTURE
//==========================================================================  
  const TabPostDealWidget({
    Key key,
  }) : super(key: key);  
//==========================================================================
// OVERRIDE
//==========================================================================   
  @override
  _TabPostDealWidgetState createState() => _TabPostDealWidgetState();
}

//==========================================================================
// STATE CLASS
//==========================================================================
class _TabPostDealWidgetState extends State<TabPostDealWidget> {
//==========================================================================
// DECLARE VARIABLE
//==========================================================================  
  int tabIndex = 0;  
  TextEditingController nameController = TextEditingController()..text = globalAppData.name;
  TextEditingController surnameController = TextEditingController();
  TextEditingController nationalityController = TextEditingController()..text = 'Thai';    
  TextEditingController emailController = TextEditingController()..text = globalAppData.email;
  TextEditingController mobileController = TextEditingController()..text = globalAppData.mobile;
  TextEditingController lineController = TextEditingController();     
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: choices.length,
      child: Scaffold(
          // backgroundColor: Colors.white,
          appBar: AppBar(
            //leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.white),onPressed: () => Navigator.of(context).pop(),),
            title: Text('ประกาศของฉัน'),
//==========================================================================
// ACTION -> CHANGE TO WIDGET
//==========================================================================          
            actions: <Widget>[
              FlatButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PostDealPage()),);
                },
                //padding: EdgeInsets.all(2),
                child: Container(
                  color: Colors.white,
                  child: Row(children: <Widget>[
                    Icon(Icons.add, color: Colors.deepOrange,),
                    Padding(
                      padding: const EdgeInsets.only(right: 4,top: 8,bottom: 8,left: 4),
                      child: Text('เพิ่มรายการ',style: TextStyle(fontSize: 12,color: Colors.deepOrange),),
                    ),              
                  ],),
                ),
              )
              
            ],
//==========================================================================
// TAB BAR
//==========================================================================  
          bottom:  
            
            TabBar(   
              
              isScrollable: true,   
              onTap: (int index){setState(() => tabIndex = index);},  
              tabs:choices.map((Choice choice) {return Tab(text: choice.title,icon: Icon(choice.icon),);}).toList(), )
          ),
//==========================================================================
// BODY: TABBAR VIEW
//==========================================================================
          body: TabBarView(          
            children: choices.map((Choice choice) {
              return Container(
                color: Colors.black87,
                child: 
                // tabIndex == 0 ? TabPostDealOnlineWidget():
                // tabIndex == 1 ? TabPostDealOnlineWidget():
                // tabIndex == 2 ? TabPostDealOnlineWidget():
                TabNotFoundWidget(),
              );
            }).toList(),
          ),   
      ),
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
// LIST
//==========================================================================
const List<Choice> choices = const <Choice>[
  const Choice(title: 'ออนไลน์ (1)', icon: Icons.flight),
  const Choice(title: 'รอการตรวจสอบ (2)', icon: Icons.train),
  const Choice(title: 'รอการแก้ไข (1)', icon: Icons.hotel),
];


