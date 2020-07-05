//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//==========================================================================
// MAIN CLASS
//==========================================================================
class DatePickerWidget extends StatefulWidget {
//==========================================================================
// CONSTRUCTURE
//==========================================================================  
  final VoidCallback onPressed;
  final String text;
  final TextStyle textStyle;
  final double borderRadius;
  final double height;
  final double fontSize;
  final Color datePickerColor;
//==========================================================================
// GET/SET
//==========================================================================
  DatePickerWidget({
    this.onPressed,
    this.borderRadius=0,
    this.text = 'Tap to select date',
    this.textStyle,
    this.height,
    this.datePickerColor=Colors.grey,
    this.fontSize,
    Key key,
  })  : assert(text != null),
        super(key: key);

//==========================================================================
// OVERIDE
//==========================================================================
  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

//==========================================================================
// STATE CLASS
//==========================================================================
class _DatePickerWidgetState extends State<DatePickerWidget> {
  String _selectedDate = DateFormat.yMMMMd("en_US").format(DateTime.now());

//==========================================================================
// FUNCTION: SELECT DATE
//==========================================================================
  Future<void> _selectDate(BuildContext context) async {
    final DateTime d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (d != null)
      setState(() {
        _selectedDate = DateFormat.yMMMMd("en_US").format(d);
      });
  }

//==========================================================================
// BUILD WIDGET
//==========================================================================
  @override
  Widget build(BuildContext context) {
//==========================================================================
// RETURN WIDGET
//==========================================================================    
    return  Container(
      padding: EdgeInsets.only(top: 4, bottom: 4),
      // color: widget.datePickerColor,      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
//==========================================================================
// CONTAINER: DECORATION
//==========================================================================        
          Container(
            // width: 180,
            decoration: const BoxDecoration(
                color: Colors.grey,      
                border: Border(
                  top: BorderSide(width: 1.0, color: Colors.black),
                  left: BorderSide(width: 1.0, color: Colors.black),
                  right: BorderSide(width: 1.0, color: Colors.black),
                  bottom: BorderSide(width: 1.0, color: Colors.black),
                ),
                borderRadius: BorderRadius.all(Radius.circular(0))),
//==========================================================================
// DATE PICKER
//==========================================================================              
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.calendar_today, color: Colors.white,),
                    tooltip: widget.text,
                    onPressed: () {_selectDate(context);
                    },
                  ),                  
                  InkWell(
                    child: Text(_selectedDate,textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 12)),
                    onTap: () {_selectDate(context);
                    }
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
