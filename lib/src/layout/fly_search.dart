import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:test_app/src/utils/colors.dart';
import 'package:test_app/src/widgets/fly_form.dart';
class fly_search extends StatefulWidget {
  @override
  _fly_searchState createState() => _fly_searchState();
}

class _fly_searchState extends State<fly_search> {
  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      headerHeight: 400.0,
      subHeaderAlwaysActive: true,
      subHeader: Center(child: Text("salut mon gars")),
      appBar: BackdropAppBar(
        title: Text("Réservation de Vols"),
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
        child: Column(
          children: <Widget>[
            FlyForm(),
            RaisedButton(
              child: Text('Valider'),
              onPressed: () => print('presed'),
              elevation: 6.0,
              color: cyan700,
            ),
          ],
        ),
      ),
      frontLayer: Center(
        child: Text("Front Layer"),
      ),
    );
  }
}
