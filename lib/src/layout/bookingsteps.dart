import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:test_app/src/layout/UserInfoForBook.dart';

class BookingSteps extends StatefulWidget {
  BookingSteps({Key key}) : super(key: key);

  @override
  _BookingStepsState createState() => _BookingStepsState();
}

class _BookingStepsState extends State<BookingSteps> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white
                ),
                child: Center(
                  child: _getPage(selectedIndex),
                ),
              ),
            NumberStepper(
            numbers: [1, 2, 3],
            direction: Axis.horizontal,
            onStepReached: (value) {
              setState(() {
                print('value: $value');
                selectedIndex = value;
              });
            },
          ),
        ],
      ),
    ),
  ),
  );
}

    _getPage(int page) {
    switch (page) {
      case 0:
        return UserInfoToBook();
      case 1:
        return null;
      default:
        return null;
    }
  }
}
