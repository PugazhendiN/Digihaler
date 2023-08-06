import 'package:flutter/material.dart';
import 'package:inhaler_mobile/components/custom_button.dart';
import 'package:inhaler_mobile/custom_colors.dart';
import 'package:inhaler_mobile/screens/home_screen.dart';
import 'package:inhaler_mobile/screens/sign_screen.dart';

class BrandingScreen extends StatefulWidget {
  BrandingScreen({Key? key}) : super(key: key);

  @override
  _BrandingScreenState createState() => _BrandingScreenState();
}

class _BrandingScreenState extends State<BrandingScreen> {
  static const double BOTTOM_SIZE = 50;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          curve: Curves.fastLinearToSlowEaseIn,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - BOTTOM_SIZE,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height:
                    (MediaQuery.of(context).size.height - BOTTOM_SIZE) * 0.25,
              ),
              Image(
                width: MediaQuery.of(context).size.width * 0.5,
                height:
                    (MediaQuery.of(context).size.height - BOTTOM_SIZE) * 0.25,
                fit: BoxFit.cover,
                image: AssetImage('assets/inhaler.gif'),
              ),
              Container(
                height:
                    (MediaQuery.of(context).size.height - BOTTOM_SIZE) * 0.25,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height:
                            (MediaQuery.of(context).size.height - BOTTOM_SIZE) *
                                0.25 *
                                0.25,
                      ),
                      Text(
                        'Holistic Asthma',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontFamily: 'Poppins',
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Managment Solution',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontFamily: 'Poppins',
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        height: 2,
                        thickness: 2,
                        color: Color(CustomColors.grey),
                        indent: MediaQuery.of(context).size.width * 0.46,
                        endIndent: MediaQuery.of(context).size.width * 0.46,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Never Forget your medication ever again ...',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w200),
                      ),
                    ]),
              ),
              Container(
                height:
                    (MediaQuery.of(context).size.height - BOTTOM_SIZE) * 0.2,
                child: Center(
                    child: Container(
                  child: Center(
                    child: CustomButton(
                      textSize: 20,
                      textColor: Colors.black,
                      color: Colors.blue,
                      height: 25,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignScreen()));
                      },
                      text: 'NEXT',
                      width: 120,
                    ),
                  ),
                )),
              )
            ],
          )),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Container(
          height: BOTTOM_SIZE,
          child: Center(
            child: Text(
              'I hereby accept privacy policy and terms and conditions',
              style: TextStyle(
                  color: Color.fromRGBO(192, 193, 194, 1),
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w200),
            ),
          ),
        ),
      ),
    );
  }
}
