import 'package:flutter/material.dart';
import 'package:inhaler_mobile/components/custom_button.dart';
import 'package:inhaler_mobile/components/input_custom_txf.dart';
import 'package:inhaler_mobile/custom_colors.dart';

import 'forecast_progress.dart';

class HomeScreenForecast extends StatefulWidget {
  const HomeScreenForecast() : super();

  @override
  _HomeScreenForecastState createState() => _HomeScreenForecastState();
}

class _HomeScreenForecastState extends State<HomeScreenForecast> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 15),
        child: Column(
          children: [
            Container(
              height: 50,
              color: Color(CustomColors.pinkDark),
              child: Center(
                child: Text(
                  'Daily Asthma Forecast',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              height: 300,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.70,
                        child: InputWithIcon(
                          color: Color(CustomColors.pinkDark),
                          hintText: 'Enter city name',
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Expanded(
                          child: CustomButton(
                        height: 40,
                        text: 'Go',
                        onTap: () {},
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      strokeWidth: 1,
                    ),
                  ),
                  Flexible(
                    child: GridView.count(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 20,
                        children: List.generate(4, (i) => ForecastProgress())),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
