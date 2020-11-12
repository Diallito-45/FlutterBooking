import 'package:flutter/material.dart';
import 'package:test_app/src/layout/home.dart';
import 'package:test_app/src/layout/hotel_detail_test.dart';
import 'package:test_app/src/layout/profil.dart';
import 'package:test_app/src/layout/reservation.dart';
import 'package:test_app/src/layout/room_list.dart';
import 'package:test_app/src/models/github_repository.dart';
import 'package:test_app/src/widgets/color_picker_dialog.dart';
import 'package:test_app/src/widgets/widget_test.dart';

class HomeScreen extends StatefulWidget {
  final GithubRepository githubRepository;

  const HomeScreen({Key key, this.githubRepository}) : super(key: key);
  
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey bottomNavigationKey = GlobalKey();
  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: _getPage(_currentTab),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30.0,
            ),
            title: Text("Accueil", style: TextStyle(fontSize: 19)),
          ),
          BottomNavigationBarItem(

            icon: Icon(
              Icons.business_center,
              size: 30.0,
            ),
            title: Text("Réservations", style: TextStyle(fontSize: 19)),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              size: 30,
            ),
            title: Text("Profil", style: TextStyle(fontSize: 19)),
          )
        ],
      ),
    );
  }


  _getPage(int page) {
    switch (page) {
      case 0:
        return HommePage();
      case 1:
        return Mes_Reservations_Page();
      default:
        return RoomListTest();
    }
  }
}
