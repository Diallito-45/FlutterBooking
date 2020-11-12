import 'package:flutter/material.dart';


// ignore: camel_case_types
class Hotel_Detail_Page extends StatefulWidget {
  @override
  _Hotel_Detail_PageState createState() => _Hotel_Detail_PageState();
}

// ignore: camel_case_types
class _Hotel_Detail_PageState extends State<Hotel_Detail_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24)
                ),
                image: DecorationImage(
                  image: NetworkImage("url")
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 16,
                    top: 32,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () => {},
                      ),
                    )
                ],
              ),
            )
            ),
            Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                top: 24
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Platinium Gold', style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),),
                  Row(
                    children: [
                      Text('Tokyo Square, Japan -', style: TextStyle(
                        color: Colors.black,
                        fontSize: 12
                      ),),
                      Text('Show in Map', style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12
                      ),
                      ),
                    ],
                  ),
                  SizedBox(height:16),
                  Text("""this upscale, contemporary hotel is 2kmfrom hazrat international Airport and 1 km fromanother luxirious airpot . so do you anjoy your coding""", style: TextStyle(
                    color: Colors.blueGrey[300],
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ],
              ),
            ),
            ),
            Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('price', style: TextStyle(
                          color: Colors.grey
                        ),
                        ),
                        SizedBox(height: 8),
                        Text('\$120', style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Reviews', 
                          style: TextStyle(
                            color: Colors.grey
                          )
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Text('4.4/5',style: TextStyle(
                                color: Colors.greenAccent,
                                fontSize: 12,
                                fontWeight: FontWeight.bold
                              ),
                              ),
                              Icon(Icons.star, color: Colors.greenAccent, size: 12),
                              Icon(Icons.star, color: Colors.greenAccent, size: 12),
                              Icon(Icons.star, color: Colors.greenAccent, size: 12),
                              Icon(Icons.star_half, color: Colors.greenAccent, size: 12),
                              Icon(Icons.star_border, size: 12),
                            ],
                          )
                        ],
                      )
                      ),
                      Expanded(
                        flex: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Recently Booked', style: TextStyle(
                              color: Colors.grey
                            ),
                            ),
                            SizedBox(height: 8),
                            Container(
                              height: 18,
                              width: 64,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 28,
                                    top: 0,
                                    bottom: 0,
                                    child: Container(
                                      height: 18,
                                      width: 18,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    bottom: 0,
                                    child: Container(
                                      height: 18,
                                      width: 18,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 16,
                                    top: 0,
                                    bottom: 0,
                                    child: Container(
                                      height: 18,
                                      width: 18,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 24,
                                    top: 0,
                                    bottom: 0,
                                    child: Container(
                                      height: 18,
                                      width: 18,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 28,
                                    top: 0,
                                    bottom: 0,
                                    child: Container(
                                      height: 18,
                                      width: 18,
                                      decoration: BoxDecoration(
                                        color: Colors.pink,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        ),
                ],
              ),
            )
            ),
            Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Commoditées',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 3,
                                  spreadRadius: 2
                              ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4)
                            ),
                            child: Icon(
                              Icons.motorcycle, 
                              color: Colors.greenAccent,
                              ),
                          ),
                          SizedBox(height: 8,),
                          Text('Parking')
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 3,
                                  spreadRadius: 2
                              ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4)
                            ),
                            child: Icon(
                              Icons.panorama_vertical, 
                              color: Colors.greenAccent,
                              ),
                          ),
                          SizedBox(height: 8),
                          Text('Bath')
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 3,
                                  spreadRadius: 2
                              ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4)
                            ),
                            child: Icon(
                              Icons.room_service, 
                              color: Colors.greenAccent,
                              ),
                          ),
                          SizedBox(height: 8),
                          Text('Bar')
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 3,
                                  spreadRadius: 2
                              ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4)
                            ),
                            child: Icon(
                              Icons.wifi, 
                              color: Colors.greenAccent,
                              ),
                          ),
                          SizedBox(height: 8),
                          Text('Wifi')
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 3,
                                  spreadRadius: 2
                              ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4)
                            ),
                            child: Icon(
                              Icons.fitness_center, 
                              color: Colors.greenAccent,
                              ),
                          ),
                          SizedBox(height: 8),
                          Text('Gym')
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 3,
                                  spreadRadius: 2
                              ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4)
                            ),
                            child: Icon(
                              Icons.more_horiz, 
                              color: Colors.greenAccent,
                              ),
                          ),
                          SizedBox(height: 8),
                          Text('more')
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
            ),
            Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 3,
                                  spreadRadius: 2
                              ),
                              ],
                      color: Colors.greenAccent[100],
                      borderRadius: BorderRadius.circular(8)
                    
                    ),
                    
                    child: Center(
                      child: Icon(Icons.favorite_border,
                      color: Colors.greenAccent,
                      size: 48),
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 18,
                      bottom: 18,
                      right: 16,
                      left: 16
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 3,
                                  spreadRadius: 2
                              ),
                              ],
                      color: Colors.greenAccent[700],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text('Book Now', style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    ),
                  ),
                ),
              ],
            )
            ),
        ],
      ),
    );
  }
}