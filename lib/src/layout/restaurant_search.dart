import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:test_app/src/utils/colors.dart';
import 'package:test_app/src/widgets/eat_form.dart';

class restaurent_research extends StatefulWidget {
  @override
  _restaurent_researchState createState() => _restaurent_researchState();
}

class _restaurent_researchState extends State<restaurent_research> {
  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      appBar: BackdropAppBar(
        title: Text("Réservation de Restaurants"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          //color: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          BackdropToggleButton(
            icon: AnimatedIcons.list_view,
          )
        ],
      ),
      backLayer: Center(
        child: Column(children: <Widget>[
          EatForm(),
          RaisedButton(
            child: Text('Valider'),
            onPressed: () => print('presed'),
            elevation: 6.0,
            color: cyan200,
          ),
        ]),
      ),
      frontLayer: Center(
        child: Text("Front Layer"),
      ),
    );
  }
}
