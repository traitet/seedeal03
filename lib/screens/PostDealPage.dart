//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/TabPostAddDetailWidget.dart';
import '../widgets/TabPostContactWidget.dart';
import '../widgets/TabPostDeliveryWidget.dart';

//==========================================================================
// MAIN CLASS
//==========================================================================
class PostDealPage extends StatefulWidget {
  @override
  _PostDealPageState createState() => _PostDealPageState();
}

//==========================================================================
// STATE CLASS
//==========================================================================
class _PostDealPageState extends State<PostDealPage> {
//==========================================================================
// DECLARE VARIABLE
//==========================================================================  
  int tabIndex = 0;    
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: choices.length,
      child: Scaffold(
        appBar: AppBar(
//==========================================================================
// TITLE
//==========================================================================          
          title: Title(color: Colors.blue, child: Text('เพิ่มรายการ')),
          actions: <Widget>[
            // IconButton(icon: Icon(Icons.undo), onPressed: (){},),
            IconButton(icon: Icon(Icons.save), onPressed: (){},)    
          ],
//==========================================================================
// BOTTOM NAVIGATOR
//==========================================================================          
          bottom: TabBar(
            isScrollable: true,
                onTap: (int index){setState(() => tabIndex = index);},  
                tabs:choices.map((Choice choice) {return Tab(text: choice.title,icon: Icon(choice.icon),);}).toList(), )          
          ),
//==========================================================================
// BODY
//==========================================================================           
        body: 
        // ListView(children: <Widget>[
//==========================================================================
// Tab#1) Add Imaage
//==========================================================================  
        // tabIndex == 0 ? TabPostAddImageWidget():
        tabIndex == 1 ? TabPostAddDetailWidget():
        tabIndex == 2 ? TabPostContactWidget():      
        tabIndex == 3 ? TabPostDeliveryWidget(): 
        Container(),    

        ),
        
    );
      
  }
}


//*******************************************************************************************************************************
// BUILD WIDGET
//*******************************************************************************************************************************

class TabAddImage extends StatelessWidget {
  const TabAddImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      alignment: Alignment.center,
      child: FlatButton(onPressed: (){
        // Navigator.push(context, MaterialPageRoute(builder: (context) => TabPostAddImageWidget()),);
        }, child: Text('คลิ๊กที่นี่เพื่อเพิ่มรูปภาพ', style: TextStyle(fontSize: 20)),));
  }
}

//*******************************************************************************************************************************
// CLASS
//*******************************************************************************************************************************

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
  const Choice(title: 'เพิ่มรูปภาพ', icon: Icons.image),
  const Choice(title: 'รายละเอียด', icon: Icons.list),
  const Choice(title: 'ติดต่อ', icon: Icons.person),
  const Choice(title: 'รับของ', icon: Icons.local_grocery_store),  
];


