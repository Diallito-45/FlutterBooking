import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_app/src/blocs/hotel/rooms/bloc/rooms_barel.dart';
import 'package:test_app/src/layout/bookingsteps.dart';
import 'package:test_app/src/models/hotel/hotel_rooms.dart';
import 'package:test_app/src/blocs/hotel/rooms/bloc/rooms_state.dart';

class RoomsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Chambres'),
        ),
        body: Room_Search_Body()
    );
  }
}

// ignore: camel_case_types
class Room_Search_Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomsBloc, RoomsState>(
      cubit: BlocProvider.of<RoomsBloc>(context),
      builder: (BuildContext context, RoomsState state) {
        if (state is RoomsInLoading) {
          return LinearProgressIndicator();
        }
        if (state is RoomsLoadFailure) {
          return Text('Une erreur est survenue: ${state.error}');
        }
        if (state is RoomsloadedSucees) {
          return state.rommsitem.isEmpty
              ? Center(child: Text('No Results matching your conditions found'))
              : Column(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 700,
                        child:
                          _HotelW(context: context, items: state.rommsitem),
                      ),
                    ),
                    Card(
                      borderOnForeground: true,
                      elevation: 5,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Text('Total TTC: '),
                            Spacer(),
                            RaisedButton(
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => BookingSteps(),
                                ),
                              ),
                              child: Text('Je Reserve'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
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
    @required this.items,
  }) : super(key: key);

  final BuildContext context;
  final List<Findavailableroom> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return _Search_Result_Item_Rooms(item: items[index]);
      },
    );
  }
}

// ignore: camel_case_types
class _Search_Result_Item_Rooms extends StatefulWidget {
  final Findavailableroom item;

  _Search_Result_Item_Rooms({Key key, @required this.item}) : super(key: key);

  @override
  __Search_Result_Item_RoomsState createState() =>
      __Search_Result_Item_RoomsState(this.item);
}

// ignore: camel_case_types
class __Search_Result_Item_RoomsState extends State<_Search_Result_Item_Rooms> {
  final Findavailableroom item;

  static const menuItems = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int nbr;

  final List<DropdownMenuItem<int>> _dropdownmenuitems = menuItems
      .map((int value) => DropdownMenuItem<int>(
            value: value,
            child: Text('$value'),
          ))
      .toList();

  __Search_Result_Item_RoomsState(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                widget.item.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Text('test'),
            ),
            Divider(),
            Card(
              child: Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        ...ListTile.divideTiles(
                          color: Colors.grey,
                          tiles: [
                            ListTile(
                              leading: Icon(Icons.hotel),
                              title: Text("Grand Lit"),
                              subtitle: Text("Confortable"),
                            ),
                            ListTile(
                              leading: Icon(Icons.streetview),
                              title: Text("Superficie"),
                              subtitle: Text(""),
                            ),
                            ListTile(
                              leading: Icon(Icons.smoking_rooms),
                              title: Text("Chambre fummeurs"),
                              subtitle: Text(""),
                            ),
                            ListTile(
                              leading: Icon(Icons.wifi),
                              title: Text("Wifi Gratuit"),
                            ),
                            ListTile(
                              leading: Icon(FontAwesomeIcons.airFreshener),
                              title: Text("Climatisations"),
                            ),
                            ListTile(
                              trailing: Text(
                                'Prix pour une nuit:',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            ListTile(
                              title: Text('le nombre de chambre:'),
                              trailing: DropdownButton(
                                value: nbr,
                                hint: Text('Choisir'),
                                items: _dropdownmenuitems,
                                onChanged: ((int newValue) {
                                  setState(() {
                                    nbr = newValue;
                                  });
                                }),
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget column(BuildContext context, RoomsState state) {
  return Container();
}
