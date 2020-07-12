

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/InputSwitchWidget.dart';
import '../widgets/InputLineWidget.dart';
import '../widgets/InputSectionSeparatorWidget.dart';
import '../widgets/InputCurrencyWidget.dart';
import '../widgets/InputDropDownWidget.dart';
import '../widgets/InputDateWidget.dart';


//==========================================================================
// TAB:1 ADD DETAIL
//==========================================================================
class TabPostAddDetailWidget extends StatelessWidget {
  const TabPostAddDetailWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    ListView(children: <Widget>[
      //SectionWidget(),   
//==========================================================================
// TEXT "URL"
//==========================================================================                 
        Padding(padding: const EdgeInsets.only(left:8, top: 4, bottom:4),child: CupertinoTextField(decoration: BoxDecoration(border: null),placeholder: 'Title',controller: TextEditingController(text: ''),clearButtonMode: OverlayVisibilityMode.editing,),),   
        InputLineWidget(),           
        Padding(padding: const EdgeInsets.only(left:8, top: 4, bottom:4),child: CupertinoTextField(decoration: BoxDecoration(border: null),placeholder: 'Description',controller: TextEditingController(text: ''),clearButtonMode: OverlayVisibilityMode.editing,),),           
        InputLineWidget(),            
        InputDropdownWidget(title: 'Room', text: '2 Rooms'), 
        InputLineWidget(),          
        InputDropdownWidget(title: 'Max Guest', text: '4 people'),         
        InputLineWidget(),                 
        InputDateWidget(title: 'From', text: '7 Jul 2020'),  
        InputLineWidget(),                 
        InputDateWidget(title: 'To', text: '7 Jul 2020'),       
        InputLineWidget(),                 
        InputCurrencyWidget(title: 'Price', text: '0 Baht'),                    
        InputSectionSeparatorWidget(),    
        InputSwitchWidget(title: 'Breakfast', isSelect: true),     
        InputLineWidget(),           
        InputSwitchWidget(title: 'Allow Pet', isSelect: true),     
        InputLineWidget(),     
        InputSwitchWidget(title: 'Allow Party', isSelect: false),     
        InputLineWidget(),           
        InputDropdownWidget(title: 'Location', text: 'Yan Nawa, Bangkok'),                    
        InputLineWidget(),   
//==========================================================================
// TEXT "NOTE"
//==========================================================================     
        Padding(padding: const EdgeInsets.only(left:8, top: 4, bottom:4),child: CupertinoTextField(decoration: BoxDecoration(border: null),placeholder: 'URL',controller: TextEditingController(text: ''),clearButtonMode: OverlayVisibilityMode.editing,),), 
        InputLineWidget(),                                    
        Padding(padding: const EdgeInsets.only(left:8,top: 4, bottom:4),child: CupertinoTextField(decoration: BoxDecoration(border: null),maxLines: 5,placeholder: 'Note',controller: TextEditingController(text: ''),clearButtonMode: OverlayVisibilityMode.editing,),),          
    ],);    

  }
}

