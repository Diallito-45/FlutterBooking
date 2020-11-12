import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:test_app/src/utils/colors.dart';
import 'package:test_app/src/widgets/car_form.dart';
class bus_search extends StatefulWidget {
  @override
  _bus_searchState createState() => _bus_searchState();
}


class _bus_searchState extends State<bus_search> {
  @override
  // ignore: todo
  //TODO: a faire n'oublie pas  
  Widget build(BuildContext context) {
    return BackdropScaffold(
      appBar: BackdropAppBar(
        title: Text("Réservation de tickets"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          //color: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          //FIXME: noublie jamai
          BackdropToggleButton(
            icon: AnimatedIcons.list_view,
          )
        ],
      ),
      backLayer: Center(
        child: Column(children: <Widget>[
          DriveForm(),
          RaisedButton(
            child: Text('Valider'),
            onPressed: () => print('presed'),
            elevation: 6.0,
            color: cyan700,
          ),
        ]),
      ),
      frontLayer: Center(
        child: Text("Front Layer"),
      ),
    );
  }
}

