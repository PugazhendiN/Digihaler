import 'package:flutter/material.dart';
import 'package:inhaler_mobile/screens/activities_screen.dart';
import 'package:inhaler_mobile/screens/doctors_screen.dart';
import 'package:inhaler_mobile/screens/home_screen.dart';
import 'package:inhaler_mobile/screens/profile_screen.dart';
import 'package:inhaler_mobile/screens/report_screen.dart';

class HomeBucket extends StatefulWidget {
  const HomeBucket() : super();

  @override
  _HomeBucketState createState() => _HomeBucketState();
}

class _HomeBucketState extends State<HomeBucket> {
  int _currentTab = 0;
  final List<Widget> screens = [
    ReportScreen(),
    ActivitiesScreen(),
    ProfileScreen(),
    DoctorsScreen(),
    HomeScreen()
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        backgroundColor:
            _currentTab == 0 ? Theme.of(context).primaryColor : Colors.grey,
        onPressed: () {
          setState(() {
            currentScreen = HomeScreen();
            _currentTab = 0;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = ActivitiesScreen();
                        _currentTab = 1;
                      });
                    },
                    minWidth: 40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.local_activity,
                          color: _currentTab == 1
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                        ),
                        Text(
                          'Activity',
                          style: TextStyle(
                              color: _currentTab == 1
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = ReportScreen();
                        _currentTab = 2;
                      });
                    },
                    minWidth: 40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.report,
                          color: _currentTab == 2
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                        ),
                        Text(
                          'Report',
                          style: TextStyle(
                              color: _currentTab == 2
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = DoctorsScreen();
                        _currentTab = 3;
                      });
                    },
                    minWidth: 40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.medical_services,
                          color: _currentTab == 3
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                        ),
                        Text(
                          'Doctor',
                          style: TextStyle(
                              color: _currentTab == 3
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = ProfileScreen();
                        _currentTab = 4;
                      });
                    },
                    minWidth: 40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_balance,
                          color: _currentTab == 4
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                              color: _currentTab == 4
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
