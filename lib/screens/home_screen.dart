import 'package:flutter/material.dart';
import 'package:inhaler_mobile/components/home_appointement.dart';
import 'package:inhaler_mobile/components/home_screen_forecast.dart';
import 'package:inhaler_mobile/components/home_screen_infos.dart';
import 'package:inhaler_mobile/custom_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen() : super();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 5,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(
              Icons.timer,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        title: Container(
          child: Row(
            children: [
              Image(
                width: 60,
                height: 40,
                fit: BoxFit.cover,
                image: AssetImage('assets/arcapis_transp.png'),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Inhaler App',
                style: TextStyle(
                    color: Color(CustomColors.pinkDark),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeScreenInfos(),
              HomeAppointement(),
              HomeScreenForecast()
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 5,
      ),
    );
  }
}
