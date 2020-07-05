//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';


//==========================================================================
// MAIN CLASS
//==========================================================================
class LVHoriSearchDealWidget extends StatelessWidget {
//==========================================================================
// CONSTRUCTURE
//==========================================================================
  final VoidCallback onTap;
  final String imageAssetName;    //CHANGE TO LIST
  final String title;
  final String textDescription;
//==========================================================================
// GET/SET
//==========================================================================
  LVHoriSearchDealWidget({
    this.onTap,
    this.imageAssetName = 'Sign in',
    this.title = '',
    this.textDescription = '',
    Key key,
  })  : assert(title != null),
        super(key: key);  
  @override
  Widget build(BuildContext context) {
    return
         Container(
        padding: const EdgeInsets.only(left: 8,right: 8),        
        height: 220,
        width:  150,        
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
//==========================================================================
// CARD
//==========================================================================            
            buildCard(context,'assets/images/hotel1.JPG', 'Book in advance', 'Book early for the best deal and SAVE! Plus secure your deal with a low deposit today!',199),
            buildCard(context,'assets/images/city1.JPG', 'Costa Blanca', 'Summer 2021 now on sale! Flights + 4 nights bed & breakfast in 4* hotel departing in May.',199),
            buildCard(context,'assets/images/city2.JPG', 'Dublin', '2 nights hotel return flights Septermber departure ATOL protected',133),
            buildCard(context,'assets/images/city3.JPG', 'Bali', 'Bargant Bali escape! 14 nights+ flights in a 4* beachfront resort departing in October.',819),                           
          ],
        ),
      )   
    ;
  }

//==========================================================================
// BUILD CARD
//==========================================================================  
  buildCard(BuildContext context, String imageAssetName, String title, String textDescription, double price) {
    return Container(
      width:  150,      
      height: 200,
      child: InkWell(
        onTap: onTap,
        child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Image(
                      height: 100,
                      width:  150,
                      image: AssetImage(imageAssetName)),
                    Text(title,style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),), 
                    Container(
                      height: 40,  
                      child: Text(textDescription,style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.grey),)
                      
                    ), 
                    SizedBox(height: 8),
                    Text('from',style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.grey),), 
                    Text(price.toStringAsFixed(0)+'pp',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),),                
                  ],
                ),
              ),
      ),
    );
  }
}


//==========================================================================
// CLASS CHOICE  --> will change
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
  Choice(title: 'Flight + Hotel', icon: Icons.hotel),
  Choice(title: 'Hotels', icon: Icons.hotel),
  Choice(title: 'Flights', icon: Icons.flight),
];