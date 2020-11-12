import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:test_app/src/blocs/UserInput.dart';
import 'package:test_app/src/layout/room_list.dart';
import 'package:test_app/src/models/hotel/search_result_item_hotel.dart';
import 'package:test_app/src/blocs/hotel/rooms/bloc/rooms_barel.dart';

// ignore: camel_case_types
class Hotel_Detail_Page extends StatefulWidget {
  final Search_Result_Item_Hotel item;

  const Hotel_Detail_Page({Key key, this.item}) : super(key: key);
  @override
  _Hotel_Detail_PageState createState() => _Hotel_Detail_PageState(this.item);
}

// ignore: camel_case_types
class _Hotel_Detail_PageState extends State<Hotel_Detail_Page> {
  PhotoViewController photoViewController;
  final Search_Result_Item_Hotel item;

  _Hotel_Detail_PageState(this.item);

  _onFindAvailableRoomsPressed() async {
    BlocProvider.of<RoomsBloc>(context).add(
      FindAvailablreRoomsPressed(
        hotel_id: '"${item.id}"',
        startDate: '"${UserInfo.startDate}"',
        endDate: '"${UserInfo.endDate}"',
        max_occupancy: UserInfo.max_occupancy,
        room_number: UserInfo.room_number,
      ),
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => RoomsList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
              child: Column(
          children: [
            Expanded(
              flex: 9,
              child: Stack(children: [
                Swiper(
                    onTap: (int index) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              _BuildPhotoViewWidget(
                            item: item,
                            indeximg: index,
                          ),
                        ),
                      );
                    },
                    autoplay: true,
                    itemBuilder: (BuildContext context, int index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: PNetworkImage(
                          item.imageListUrl[index],
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                    viewportFraction: 0.8,
                    scale: 0.9,
                    pagination: SwiperPagination(),
                    itemCount: item.imageListUrl.length),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        iconSize: 30.0,
                        color: Colors.black,
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, top: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: 7.0,
                    ),
                    Row(
                      children: [
                        Text(
                          '    Vile: ${item.city.name}  ',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                        Text(
                          '  \nVoire sur La Carte',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      """this upscale, contemporary hotel is 2kmfrom hazrat international Airport and 1 km fromanother luxirious airpot . so do you anjoy your coding""",
                      style: TextStyle(
                          color: Colors.blueGrey[300],
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'prix:',
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(height: 8),
                            Text(
                              ' ${item.price} XOF',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
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
                                  style: TextStyle(color: Colors.grey)),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    '4.4/5',
                                    style: TextStyle(
                                        color: Colors.greenAccent,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(Icons.star,
                                      color: Colors.greenAccent, size: 12),
                                  Icon(Icons.star,
                                      color: Colors.greenAccent, size: 12),
                                  Icon(Icons.star,
                                      color: Colors.greenAccent, size: 12),
                                  Icon(Icons.star_half,
                                      color: Colors.greenAccent, size: 12),
                                  Icon(Icons.star_border, size: 12),
                                ],
                              )
                            ],
                          )),
                      Expanded(
                        flex: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Recently Booked',
                              style: TextStyle(color: Colors.grey),
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
                )),
            Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Commoditées',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 16,
                      ),
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
                                          spreadRadius: 2),
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4)),
                                child: Icon(
                                  Icons.motorcycle,
                                  color: Colors.greenAccent,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
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
                                          spreadRadius: 2),
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4)),
                                child: Icon(
                                  Icons.panorama_vertical,
                                  color: Colors.greenAccent,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text('Douche privé')
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
                                          spreadRadius: 2),
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4)),
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
                                          spreadRadius: 2),
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4)),
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
                                          spreadRadius: 2),
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4)),
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
                                          spreadRadius: 2),
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4)),
                                child: Icon(
                                  Icons.more_horiz,
                                  color: Colors.greenAccent,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text('plus')
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                )),
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
                                spreadRadius: 2),
                          ],
                          color: Colors.greenAccent[100],
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Icon(Icons.favorite_border,
                            color: Colors.greenAccent, size: 48),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: InkWell(
                      enableFeedback: true,
                      onTap: () => 
                      _onFindAvailableRoomsPressed(),
                        child: Container(
                        margin: EdgeInsets.only(
                            top: 18, bottom: 18, right: 16, left: 16),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 3,
                                spreadRadius: 2),
                          ],
                          color: Colors.greenAccent[700],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            'Choisir les chambres',
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PNetworkImage extends StatelessWidget {
  final String image;
  final BoxFit fit;
  final double width, height;
  const PNetworkImage(this.image, {Key key, this.fit, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      fit: fit,
      width: width,
      height: height,
    );
  }
}

class _BuildPhotoViewWidget extends StatelessWidget {
  final Search_Result_Item_Hotel item;
  final int indeximg;
  final PhotoViewController photoViewController;
  const _BuildPhotoViewWidget(
      {Key key, this.item, this.photoViewController, this.indeximg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('images'),
      ),
      body: PhotoViewGallery.builder(
        itemCount: item.imageListUrl.length,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(item.imageListUrl[indeximg]),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered,
          );
        },
        backgroundDecoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
        ),
        scrollPhysics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
