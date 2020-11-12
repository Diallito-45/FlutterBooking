import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_app/src/layout/bus_search.dart';
import 'package:test_app/src/layout/restaurant_search.dart';
import 'package:test_app/src/widgets/dest_carousel.dart';
import 'package:test_app/src/widgets/hotel_carousel.dart';
import 'fly_search.dart';
import 'hotel_search.dart';


class HommePage extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HommePage> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Text(
                'Reservez, Voyagez, Decouvrez, Explorer et Plus Encore',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            SizedBox(height: 40.0),
            Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkResponse(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => fly_search(),
                        ),
                      ),
                      child: Column(children: <Widget>[
                        Icon(
                          FontAwesomeIcons.plane,
                          semanticLabel: "Vol",
                          color: Colors.cyan,
                          size: 30,
                        ),
                        SizedBox(height: 05.0),
                        Text(
                          "Vol",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ]),
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Hotelsearch(),
                        ),
                      ),
                      child: Column(children: <Widget>[
                        Icon(
                          FontAwesomeIcons.bed,
                          color: Colors.cyan,
                          semanticLabel: "Hotel",
                          size: 30,
                        ),
                        SizedBox(height: 05.0),
                        Text(
                          "Hotel",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      /* InkResponse(
                          onTap: () => Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Hotelsearch())),
                        ),*/
                      ]),
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => bus_search(),
                        ),
                      ),
                      child: Column(children: <Widget>[
                        Icon(
                          FontAwesomeIcons.busAlt,
                          color: Colors.cyan,
                          semanticLabel: "Car",
                          size: 30,
                        ),
                        SizedBox(height: 05.0),
                        Text(
                          "Car",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ]),
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => restaurent_research(),
                        ),
                      ),
                      child: Column(children: <Widget>[
                        Icon(
                          FontAwesomeIcons.drumstickBite,
                          color: Colors.cyan,
                          semanticLabel: "Diner",
                          size: 30,
                        ),
                        SizedBox(height: 05.0),
                        Text(
                          "Diner",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ]),
                    ),
                    /*   .asMap()
                        .entries
                        .map(
                          (MapEntry map) => _buildIcon(map.key),
                        )
                        .toList(),*/
                  ]),
            ),
            SizedBox(height: 40.0),
            DestinationCarousel(),
            SizedBox(height: 20.0),
            HotelCarousel(),
          ],
        ),
      ),
    );
  }
}
