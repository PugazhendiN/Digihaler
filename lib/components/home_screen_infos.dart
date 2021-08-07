import 'package:flutter/material.dart';
import 'package:inhaler_mobile/custom_colors.dart';

class HomeScreenInfos extends StatefulWidget {
  const HomeScreenInfos() : super();

  @override
  _HomeScreenInfosState createState() => _HomeScreenInfosState();
}

class _HomeScreenInfosState extends State<HomeScreenInfos> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      color: Colors.white,
      height: 250,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Next Inhalation',
                          style: TextStyle(
                              color: Color(CustomColors.pinkDark),
                              fontSize: 14,
                              fontWeight: FontWeight.w400)),
                      Text('Today : 09:00 am',
                          style: TextStyle(
                              color: Color(CustomColors.pinkDark),
                              fontSize: 16,
                              fontWeight: FontWeight.w300)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Last Inhalation',
                          style: TextStyle(
                              color: Color(CustomColors.pinkDark),
                              fontSize: 14,
                              fontWeight: FontWeight.w400)),
                      Text('Today : 06:00 am',
                          style: TextStyle(
                              color: Color(CustomColors.pinkDark),
                              fontSize: 16,
                              fontWeight: FontWeight.w300)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Expiration date',
                          style: TextStyle(
                              color: Color(CustomColors.pinkDark),
                              fontSize: 14,
                              fontWeight: FontWeight.w400)),
                      Text('2021-09-01',
                          style: TextStyle(
                              color: Color(CustomColors.pinkDark),
                              fontSize: 16,
                              fontWeight: FontWeight.w300)),
                    ],
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                child: Image(
                  width: MediaQuery.of(context).size.width * 0.3,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/inhaler.gif'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
