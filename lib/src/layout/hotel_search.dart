import 'dart:async';
import 'dart:core';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:test_app/src/blocs/UserInput.dart';
import 'package:test_app/src/blocs/hotel/hotel_bloc_bloc.dart';
import 'package:test_app/src/blocs/hotel/hotel_bloc_event.dart';
import 'package:test_app/src/layout/hotel_list.dart';
import 'package:test_app/src/models/github_repository.dart';
import 'package:test_app/src/utils/colors.dart';
import 'package:test_app/src/widgets/search.dart';

class Hotelsearch extends StatefulWidget {
  final GithubRepository githubRepository;

  Hotelsearch({Key key, this.githubRepository}) : super(key: key);
  @override
  _HotelsearchState createState() => _HotelsearchState(this.githubRepository);
}

class _HotelsearchState extends State<Hotelsearch> {
  final GithubRepository githubRepository;

  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(Duration(days: 3));
  String _result;
  String _cityid;
  int _currentPersonnValue = 1;
  int _currentRoomValue = 1;

  _HotelsearchState(this.githubRepository);
  //NumberPicker integerNumberPicker;

  Future _showIntDialog() async {
    await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return new NumberPickerDialog.integer(
          minValue: 1,
          maxValue: 30,
          step: 1,
          initialIntegerValue: _currentPersonnValue,
          title: Text('Nombre de Personnes'),
          highlightSelectedValue: true,
        );
      },
    ).then((num value) {
      if (value != null) {
        setState(() => _currentPersonnValue = value);
      }
    });
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    final city = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MySearcheWidget()),
    );
    if (city != null) {
      print(city);
      setState(() => {_result = city.name, _cityid = city.id});
    }
  }

  Future _showIntDialog1() async {
    await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return new NumberPickerDialog.integer(
          minValue: 1,
          maxValue: 30,
          step: 1,
          initialIntegerValue: _currentRoomValue,
          title: Text('Nombre de chambres'),
          highlightSelectedValue: true,
        );
      },
    ).then((num value) {
      if (value != null) {
        setState(() => _currentRoomValue = value);
      }
    });
  }

  Future displayDateRangePicker(BuildContext context) async {
    final List<DateTime> picked = await DateRagePicker.showDatePicker(
        context: context,
        initialFirstDate: _startDate,
        initialLastDate: _endDate,
        firstDate: new DateTime(DateTime.now().year - 50),
        lastDate: new DateTime(DateTime.now().year + 50));
    const Locale("fr", "FR");
    if (picked != null && picked.length == 2) {
      setState(() {
        _startDate = picked[0];
        _endDate = picked[1];
      });
    }
  }

  _onscafold(BuildContext context) {
    final snackbar = SnackBar(
      content: Text('Veiullez selectionnez une ville d\'abord !!'),
    );
    Scaffold.of(context).showSnackBar(snackbar);
  }

  _onLoginButtonPressed() {
    BlocProvider.of<HotelBloc>(context).add(
      ValidateButtonPressed(
        cityId: '"$_cityid"',
        startDate: '"$_startDate"',
        endDate: '"$_endDate"',
        max_occupancy: _currentPersonnValue,
        room_number: _currentRoomValue,
      ),
    );
    UserInfo.startDate = _startDate;
    UserInfo.endDate = _endDate;
    UserInfo.room_number = _currentRoomValue;
    UserInfo.max_occupancy = _currentPersonnValue;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => QuantHotelsBookingPage(),
      ),
    );
  }

  static const String _title = 'Rechercher Un Hotel';
  // get model => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cyan400,
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
        title: const Text(_title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 24.0),
            RaisedButton(
              onPressed: () => _navigateAndDisplaySelection(context),
              child: Text("Entrez Un Lieu"),
            ),
            SizedBox(height: 24),
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: Colors.black),
                    left: BorderSide(width: 1.0, color: Colors.black),
                    right: BorderSide(width: 1.0, color: Colors.black),
                    bottom: BorderSide(width: 1.0, color: Colors.black),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(_result != null
                        ? "Lieu: $_result"
                        : "Veuillez Entrez un lieu"),
                  ],
                ),
              ),
            ),
            Divider(color: Colors.grey, height: 32),
            SizedBox(height: 4.0),
            RaisedButton(
              onPressed: () async {
                await displayDateRangePicker(context);
              },
              child: new Text("Date"),
            ),
            SizedBox(height: 24),
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: Colors.black),
                    left: BorderSide(width: 1.0, color: Colors.black),
                    right: BorderSide(width: 1.0, color: Colors.black),
                    bottom: BorderSide(width: 1.0, color: Colors.black),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                        "Du: ${DateFormat('dd/MM/yyyy').format(_startDate).toString()}"),
                    Text(
                        "Au: ${DateFormat('dd/MM/yyyy').format(_endDate).toString()}"),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            Divider(color: Colors.grey, height: 32),
            RaisedButton(
              onPressed: () => _showIntDialog(),
              child: new Text("Personne"),
            ),
            SizedBox(height: 24),
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: Colors.black),
                    left: BorderSide(width: 1.0, color: Colors.black),
                    right: BorderSide(width: 1.0, color: Colors.black),
                    bottom: BorderSide(width: 1.0, color: Colors.black),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("Nombre de persones: $_currentPersonnValue"),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Divider(color: Colors.grey, height: 32),
            RaisedButton(
              onPressed: () => _showIntDialog1(),
              child: new Text("Chambre"),
            ),
            SizedBox(height: 24),
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: Colors.black),
                    left: BorderSide(width: 1.0, color: Colors.black),
                    right: BorderSide(width: 1.0, color: Colors.black),
                    bottom: BorderSide(width: 1.0, color: Colors.black),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("Nombre de chambres: $_currentRoomValue"),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24.0),
            RaisedButton(
              onPressed: _cityid != null ? () => _onLoginButtonPressed() : null,
              child: Text('Valider'),
              color: cyanAcent200,
              elevation: 5,
            ),
          ],
        ),
      ),
    );
  }
}
