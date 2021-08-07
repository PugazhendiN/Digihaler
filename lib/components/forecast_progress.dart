import 'package:flutter/material.dart';
import 'package:inhaler_mobile/custom_colors.dart';

class ForecastProgress extends StatefulWidget {
  const ForecastProgress() : super();

  @override
  _ForecastProgressState createState() => _ForecastProgressState();
}

class _ForecastProgressState extends State<ForecastProgress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(children: [
            Center(
              child: SizedBox(
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                  value: 0.5,
                  valueColor:
                      new AlwaysStoppedAnimation<Color>(CustomColors.orange),
                  backgroundColor: Colors.white,
                ),
                height: 60.0,
                width: 60.0,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  width: 50,
                  height: 40,
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/arcapis_transp.png'),
                  ),
                ),
              ),
            )
          ]),
          SizedBox(
            height: 5,
          ),
          Text(
            'Air Quality',
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            '99 Good',
            style: TextStyle(
                fontSize: 8, fontWeight: FontWeight.bold, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
