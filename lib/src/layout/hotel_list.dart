import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:test_app/src/blocs/hotel/hotel_bloc_bloc.dart';
import 'package:test_app/src/blocs/hotel/hotel_bloc_state.dart';
import 'package:test_app/src/layout/hotel_detail_test.dart';
import 'package:test_app/src/models/hotel/search_result_item_hotel.dart';
import 'dart:core';
import 'dart:developer';

class QuantHotelsBookingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(
                iconTheme: IconThemeData(
                  color: Colors.white,
                  size: 28,
                ),
              ),
              child: Container(
                height: 100,
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.blue[800],
                      Colors.blue[700],
                      Colors.blue[600],
                      Colors.blue[400],
                      Colors.blue[300],
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () => Navigator.pop(context)
                          ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Côte D\'Ivoire',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                              ),
                            ),
                            Text(
                              'Nov 28 - Nov 30 - 1 room, 2 adult',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.swap_vert),
                          SizedBox(width: 10),
                          Icon(Icons.filter_list),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Hotel_Search_Body(),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class Hotel_Search_Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<HotelBloc, HotelState>(
      cubit: BlocProvider.of<HotelBloc>(context),
      builder: (BuildContext context, HotelState state) {
        if (state is HotelLoadInProgress) {
          return LinearProgressIndicator();
        }
        if (state is HotelLoadFailure) {
          return Text('Une erreur est survenue: ${state.error}');
        }
        if (state is HotelLoadSuccess) {
          return state.items.isEmpty
              ? Text('No Results matching your conditions found')
              : Expanded(child: _HotelW(context: context, size: size, items: state.items));
        }
        return Text('Please enter a term to begin');
      },
    );
  }
}

class _HotelW extends StatelessWidget {
  const _HotelW({
    Key key,
    @required this.context,
    @required this.size,
    @required this.items,
  }) : super(key: key);

  final BuildContext context;
  final Size size;
  final List<Search_Result_Item_Hotel> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return _Search_Result_Item_Hotel(item: items[index]);
      },
    );
  }
}


// ignore: camel_case_types
class _Search_Result_Item_Hotel extends StatelessWidget {
  final Search_Result_Item_Hotel item;

  const _Search_Result_Item_Hotel({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        //TODO:ici est le cont
        height: 280,
        width: size.width, 
        child: InkWell(
          enableFeedback: true,
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) =>
                Hotel_Detail_Page(item: item,)
                ),
              );
            },
            child: Card(
              elevation: 8,
              margin: EdgeInsets.all(0),
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        height: 190,
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(item.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          width: size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    item.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.location_on,
                                        size: 18,
                                        color: Colors.grey,
                                      ),
                                      Text(
                                        item.city.name,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: <Widget>[
                                      RatingBarIndicator(
                                        rating: item.rating,
                                        itemCount: 5,
                                        itemSize: 18.0,
                                        physics: BouncingScrollPhysics(),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                      ),
                                      Text(
                                        "${item.rating} reviews",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "\$ ${item.price}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Par  Nuit",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 15,
                    bottom: 70,
                    child: Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.blue[800],
                            Colors.blue[700],
                            Colors.blue[300],
                          ],
                        ),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30.0),
                        onTap: () => {},
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ),
      ),
    );
  }
}