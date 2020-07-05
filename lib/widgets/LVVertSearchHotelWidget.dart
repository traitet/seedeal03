//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';

//==========================================================================
// MAIN CLASS
//==========================================================================
class LVVertSearchHotelWidget extends StatelessWidget {
//==========================================================================
// CONSTRUCTURE
//==========================================================================
  final VoidCallback onTap;
  final String imageAssetName; //CHANGE TO LIST
  final String title;
  final String textDescription;
//==========================================================================
// GET/SET
//==========================================================================
  LVVertSearchHotelWidget({
    this.onTap,
    this.imageAssetName = '',
    this.title = '',
    this.textDescription = '',
    Key key,
  })  : assert(title != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top:4, left: 4, right: 4),
//==========================================================================
// LIST VIEW.BILDER
//==========================================================================      
      child: ListView.builder(
//==========================================================================
// NUMBER OF LIST
//==========================================================================   
        itemCount: hotelList.length,
        scrollDirection: Axis.vertical,
//==========================================================================
// RETRN ITEM BUILDER
//==========================================================================        
        itemBuilder: (context,index){
          return  buildCard(hotelList[index].imageAssetName,hotelList[index].title,hotelList[index].textRating,hotelList[index].location,hotelList[index].price);
        },
      ),
    );
  }

//==========================================================================
// BUILD CARD
//==========================================================================
  buildCard(String imageAssetName, String title, String textRating, String location,double price) {
    return Container(
      width: 150,
      child: InkWell(
        onTap: onTap,
        child: Card(
          child: Row(
            children: <Widget>[
//==========================================================================
// IMAGE
//==========================================================================
              Image(height: 100, width: 100, image: AssetImage(imageAssetName)),
//==========================================================================
// COLUMN
//==========================================================================
              Expanded(
                child: Container(               
                  padding: EdgeInsets.only(left: 8),
                  width: 250,     // need to auto calcuate
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,         
                    children: <Widget>[
//==========================================================================
// TEXT RATING
//==========================================================================                  
                      Text(textRating,style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Colors.black)),
//==========================================================================
// TITLE: HOTEL NAME
//==========================================================================                  
                      Text(title,
                        overflow: TextOverflow.visible,maxLines: 2,
                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black)),  
//==========================================================================
// STAR
//==========================================================================                  
                      Row(
                        children: <Widget>[
                          Icon(Icons.star,size: 18,color: Colors.orange,),
                          Icon(Icons.star,size: 18,color: Colors.orange,),
                          Icon(Icons.star,size: 18,color: Colors.orange,),
                          Text('HOTEL',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black))                                        
                        ],
                      ),   
//==========================================================================
// LOCATION
//==========================================================================                  
                      Row(
                        children: <Widget>[
                          Icon(Icons.location_on,size: 18),
                          Text(location,style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black)),                        
                        ],
                      ),     
                                        
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

//==========================================================================
// CLASS CHOICE  --> will change
//==========================================================================
class Hotel {
  const Hotel({this.imageAssetName, this.title,  this.textRating, this.location, this.price});
  final String title;    
  final String imageAssetName;
  final String textRating;
  final String location; 
  final double price;   
}

//==========================================================================
// CLASS CHOICE
//==========================================================================
const List<Hotel> hotelList = const <Hotel>[
  Hotel(imageAssetName: 'assets/images/hotel01.JPG',textRating: 'Very Good', title: 'Paradisus Cancun All Inclusive', location:'Puerto Jures', price: 2121),
  Hotel(imageAssetName: 'assets/images/hotel02.JPG',textRating: 'Excellent', title: 'Grand Riviera Princess All Suites Resort & Spa-All Inclusive', location:'Lafitte', price: 943),
  Hotel(imageAssetName: 'assets/images/hotel03.JPG',textRating: 'Excellent', title: 'Ocean Riviera Paradise All Inclusive', location:'Lafitte', price: 2121),
  Hotel(imageAssetName: 'assets/images/hotel04.JPG',textRating: 'Excellent', title: 'Occidental At Xcaret Destination', location:'Xcaret', price: 966),
  Hotel(imageAssetName: 'assets/images/hotel05.JPG',textRating: 'Excellent', title: 'Hard Rock Hotel Cancun All-Inclusive', location:'Puerto Juarez', price: 2121),        
  Hotel(imageAssetName: 'assets/images/hotel01.JPG',textRating: 'Very Good', title: 'Paradisus Cancun All Inclusive', location:'Puerto Jures', price: 2121),
  Hotel(imageAssetName: 'assets/images/hotel02.JPG',textRating: 'Excellent', title: 'Grand Riviera Princess All Suites Resort & Spa-All Inclusive', location:'Lafitte', price: 943),
  Hotel(imageAssetName: 'assets/images/hotel03.JPG',textRating: 'Excellent', title: 'Ocean Riviera Paradise All Inclusive', location:'Lafitte', price: 2121),
  Hotel(imageAssetName: 'assets/images/hotel04.JPG',textRating: 'Excellent', title: 'Occidental At Xcaret Destination', location:'Xcaret', price: 966),
  Hotel(imageAssetName: 'assets/images/hotel05.JPG',textRating: 'Excellent', title: 'Hard Rock Hotel Cancun All-Inclusive', location:'Puerto Juarez', price: 2121), 
];
