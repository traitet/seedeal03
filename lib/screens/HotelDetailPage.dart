//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
// import '../screens/PaymentMethodPage.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

//==========================================================================
// MAIN CLASS
//==========================================================================
class HotelDetailPage extends StatefulWidget {
  @override
  _HotelDetailPageState createState() => _HotelDetailPageState();
}

//==========================================================================
// STATE CLASS
//==========================================================================
class _HotelDetailPageState extends State<HotelDetailPage> {
  @override
  Widget build(BuildContext context) {
    // const padding = 15.0;

    FlutterStatusbarcolor.setStatusBarColor(Theme.of(context).primaryColor);
    return MaterialApp(
//==========================================================================
// SHOW DEBUG
//==========================================================================
        debugShowCheckedModeBanner: false,
//==========================================================================
// THEME
//==========================================================================
        theme: ThemeData(
          primarySwatch: Theme.of(context).primaryColor,
        ),
//==========================================================================
// HOME
//==========================================================================
        home: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
              onPressed: () => Navigator.of(context).pop()),
              centerTitle: true,
              title: Text('Hotel Detail'),
            ),
//==========================================================================
// BODY
//==========================================================================
            body: SafeArea(
              child: ListView(
                children: <Widget>[
//==========================================================================
// HEADER BAR
//==========================================================================
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
//==========================================================================
// SEARCH INFO
//==========================================================================
                        Row(
                          children: <Widget>[
                            Text('30 May - 31 May',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12)),
                            Text(' | ', style: TextStyle(color: Colors.black)),
                            Text('14 Nights',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12)),
                            Text(' | ',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12)),
                            Icon(Icons.person, color: Colors.black, size: 16),
                            Text(' 2',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12)),
                            Text(' | ',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12)),
                            Icon(Icons.hotel, color: Colors.black, size: 16),
                            Text(' 2',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12)),
                          ],
                        ),
//==========================================================================
// MODIFY
//==========================================================================
                        Row(
                          children: <Widget>[
                            Text(
                              'Modify',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.edit, color: Colors.blue, size: 18),
                          ],
                        ),
                      ],
                    ),
                  ),
//==========================================================================
// PHOTO
//==========================================================================
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      Container(
                        height: 250,
                        padding: EdgeInsets.only(top: 8, bottom: 8),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/hotel1.JPG'),
                              fit: BoxFit.cover),
                        ),
                      ),
//==========================================================================
// BAR SEE ALL PHOTO
//==========================================================================
                      Container(
                          alignment: Alignment(0, 0),
                          color: Colors.black54,
                          padding: EdgeInsets.all(8),
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(Icons.person, color: Colors.white, size: 16),
                              Expanded(
                                  child: Text('See all photos',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14))),
                              Text('1/34',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14)),
                            ],
                          ))
                    ],
                  ),
//==========================================================================
// HOTEL INFO - NAME
//==========================================================================
                  Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text('Natya Hotel',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              Icon(
                                Icons.star,
                                size: 18,
                                color: Colors.orange,
                              ),
                              Icon(
                                Icons.star,
                                size: 18,
                                color: Colors.orange,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
//==========================================================================
// HOTEL INFO - LOCATION
//==========================================================================
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.location_on,
                                size: 18,
                                color: Colors.blue,
                              ),
                              Text(hotelList[0].title,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.blue)),
                            ],
                          ),
                        ],
                      )),
//==========================================================================
// LINE
//==========================================================================
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.grey, width: 1),
                      ),
                    ),
                  ),
//==========================================================================
// LIST VIEW - HORIZONTAL
//==========================================================================
                  Container(
                    height: 120,
                    color: Colors.white,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
//==========================================================================
// CARD#1
//==========================================================================
                        Container(
                          width: 150,
                          child: Container(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                    padding: EdgeInsets.only(top: 8),
                                    height: 70,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.chat_bubble,
                                          size: 18,
                                          color: Colors.green,
                                        ),
                                        Text('Excellent',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                      ],
                                    )),
                              ),
                              Text('1092 reviews',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue)),
                              SizedBox(height: 15)
                            ],
                          )),
                        ),
//==========================================================================
// CARD#2
//==========================================================================
                        Container(
                          width: 150,
                          child: Container(
                              child: Column(
                            children: <Widget>[
//==========================================================================
// CARD#2/1
//==========================================================================
                              Expanded(
                                child: Container(
                                  height: 70,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
//==========================================================================
// CARD#2/1 - ROW 1
//==========================================================================
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.free_breakfast,
                                            size: 16,
                                            color: Colors.black,
                                          ),
                                          Text('Breakfast included',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ],
                                      ),
//==========================================================================
// CARD#2/1 - ROW 2
//==========================================================================
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.pets,
                                            size: 16,
                                            color: Colors.black,
                                          ),
                                          Text('No pets or service',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
//==========================================================================
// CARD#2/2 - BOTTOM
//==========================================================================
                              Text('Show facilities',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue)),
                              SizedBox(height: 15)
                            ],
                          )),
                        ),

//==========================================================================
// CARD#3
//==========================================================================
                        Container(
                          width: 150,
                          child: Container(
                              child: Column(
                            children: <Widget>[
                              Container(
                                height: 70,
                                alignment: Alignment.center,
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.flight,
                                      size: 18,
                                      color: Colors.black,
                                    ),
                                    Container(
                                      width: 124,
                                      child: Text('1898 alternatives',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black)),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(child: Container()),
                              Text('Flight included',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue)),
                              SizedBox(height: 15)
                            ],
                          )),
                        ),
                      ],
                    ),
                  ),

//==========================================================================
// LINE
//==========================================================================
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.grey, width: 1),
                      ),
                    ),
                  ),
//==========================================================================
// LIST VIEW - HORIZONTAL
//==========================================================================
                  Container(
                      height: 50,
                      padding: EdgeInsets.all(12),
                      child:
                          ListView(scrollDirection: Axis.horizontal, children: <
                              Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 24),
                          child: Text(
                            'General Information',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.blue),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 24),
                          child: Text('Flight',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.blue)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 24),
                          child: Text('Room',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.blue)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 24),
                          child: Text('Review',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.blue)),
                        ),
                      ])),
//==========================================================================
// LINE
//==========================================================================
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.grey, width: 1),
                      ),
                    ),
                  ),

//==========================================================================
// BOTTOM
//==========================================================================
                  Container(
                    height: 60,
                    padding: EdgeInsets.all(8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,                      
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(right: 8),
                            alignment: Alignment.centerRight,
                              width: 70,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,                                
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text('From £746',style: TextStyle(fontSize: 16, color: Colors.black)),
                                  Text('Price per person 14 nights',style: TextStyle(fontSize: 12, color: Colors.black)),
                                ],
                              )),
                        ),
                        RaisedButton(color:Colors.pink, onPressed: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentMethodPage()),);
                          }, child: Text('Book Now',style: TextStyle(fontSize: 14, color: Colors.white),))
                      ],
                    ),
                  ),

//==========================================================================
// WIDGET
//==========================================================================
                ],
              ),
            )));
  }
}

//==========================================================================
// CLASS CHOICE  --> will change
//==========================================================================
class Hotel {
  const Hotel(
      {this.imageAssetName,
      this.title,
      this.textRating,
      this.location,
      this.price});
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
  Hotel(
      imageAssetName: 'assets/images/hotel01.JPG',
      textRating: 'Very Good',
      title: 'Paradisus Cancun All Inclusive',
      location: 'Puerto Jures',
      price: 2121),
  Hotel(
      imageAssetName: 'assets/images/hotel02.JPG',
      textRating: 'Excellent',
      title: 'Grand Riviera Princess All Suites Resort & Spa-All Inclusive',
      location: 'Lafitte',
      price: 943),
  Hotel(
      imageAssetName: 'assets/images/hotel03.JPG',
      textRating: 'Excellent',
      title: 'Ocean Riviera Paradise All Inclusive',
      location: 'Lafitte',
      price: 2121),
  Hotel(
      imageAssetName: 'assets/images/hotel04.JPG',
      textRating: 'Excellent',
      title: 'Occidental At Xcaret Destination',
      location: 'Xcaret',
      price: 966),
  Hotel(
      imageAssetName: 'assets/images/hotel05.JPG',
      textRating: 'Excellent',
      title: 'Hard Rock Hotel Cancun All-Inclusive',
      location: 'Puerto Juarez',
      price: 2121),
  Hotel(
      imageAssetName: 'assets/images/hotel01.JPG',
      textRating: 'Very Good',
      title: 'Paradisus Cancun All Inclusive',
      location: 'Puerto Jures',
      price: 2121),
  Hotel(
      imageAssetName: 'assets/images/hotel02.JPG',
      textRating: 'Excellent',
      title: 'Grand Riviera Princess All Suites Resort & Spa-All Inclusive',
      location: 'Lafitte',
      price: 943),
  Hotel(
      imageAssetName: 'assets/images/hotel03.JPG',
      textRating: 'Excellent',
      title: 'Ocean Riviera Paradise All Inclusive',
      location: 'Lafitte',
      price: 2121),
  Hotel(
      imageAssetName: 'assets/images/hotel04.JPG',
      textRating: 'Excellent',
      title: 'Occidental At Xcaret Destination',
      location: 'Xcaret',
      price: 966),
  Hotel(
      imageAssetName: 'assets/images/hotel05.JPG',
      textRating: 'Excellent',
      title: 'Hard Rock Hotel Cancun All-Inclusive',
      location: 'Puerto Juarez',
      price: 2121),
];
