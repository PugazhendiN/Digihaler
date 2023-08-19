import 'package:flutter/material.dart';

import '../../custom_colors.dart';

class DoctorsScreen extends StatefulWidget {
  const DoctorsScreen() : super();

  @override
  _DoctorsScreenState createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Doctor notes',
          style: TextStyle(
              color: Color(CustomColors.pinkDark),
              fontSize: 22,
              fontWeight: FontWeight.w300),
        ),
        centerTitle: true,
      ),
      body: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        height: double.infinity,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(right: 20, left: 20, top: 20),
              padding: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  color: Color(CustomColors.pinkDark).withOpacity(0.8),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 30, bottom: 15),
                    height: 100,
                    width: double.infinity,
                    child: Center(
                      child: Stack(
                        children: [
                          Container(
                            width: 100,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.8)),
                            child: Center(
                              child: Container(
                                height: 60,
                                width: 60,
                                child: Center(
                                  child: Icon(
                                    Icons.account_box,
                                    color: Colors.white,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(CustomColors.pinkDark)),
                              ),
                            ),
                          ),
                          Positioned(
                            child: Container(
                              padding: EdgeInsets.all(4),
                              child: Icon(
                                Icons.edit,
                                size: 20,
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),
                            right: 0,
                            bottom: 2,
                          )
                        ],
                      ),
                    ),
                  ),
                  Text(
                    'Dr. Rohit Sinha',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '993834923209',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ListView(
                  children: ListTile.divideTiles(context: context, tiles: [
                    ListTile(
                      leading: Icon(
                        Icons.data_usage,
                        color: CustomColors.orange,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
                      title: Text(
                        'Notes from doctor',
                        style:
                            TextStyle(color: CustomColors.orange, fontSize: 18),
                      ),
                      subtitle: Text(
                        'Take your medication in time. Take your medication in time...',
                        maxLines: 2,
                        style: TextStyle(fontSize: 12),
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.chat),
                      title: Text('Chat with doctor'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.calendar_today),
                      title: Text('Fix appointment'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.timer),
                      title: Text('Reminders'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.edit_rounded),
                      title: Text("Change doctor"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {},
                    ),
                  ]).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
