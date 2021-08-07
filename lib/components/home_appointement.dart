import 'package:flutter/material.dart';
import 'package:inhaler_mobile/components/custom_button.dart';

import '../custom_colors.dart';

class HomeAppointement extends StatefulWidget {
  const HomeAppointement() : super();

  @override
  _HomeAppointementState createState() => _HomeAppointementState();
}

class _HomeAppointementState extends State<HomeAppointement> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 80,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                alignment: Alignment.center,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Next doctor's appointment",
                          style: TextStyle(
                              color: Color(CustomColors.pinkDark),
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      Text('2021-09-01 at 09:00 am',
                          style: TextStyle(
                              color: Color(CustomColors.pinkDark),
                              fontSize: 16,
                              fontWeight: FontWeight.w300)),
                    ],
                  ),
                )),
            Flexible(
              child: CustomButton(
                text: 'See',
                textSize: 12,
                height: 30,
                width: 90,
              ),
            )
          ],
        ),
      ),
    );
  }
}
