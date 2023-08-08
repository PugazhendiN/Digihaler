import 'package:flutter/material.dart';
import 'package:inhaler_mobile/network/user_service.dart';

import '../custom_colors.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen() : super();

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Report',
          style: TextStyle(
              color: Color(CustomColors.pinkDark),
              fontSize: 22,
              fontWeight: FontWeight.w300),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: ListTile.divideTiles(context: context, tiles: [
          ListTile(
            leading: Icon(Icons.data_usage),
            title: Text('Adherence'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings_applications),
            title: Text('Maintenance dose'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.receipt_sharp),
            title: Text('Rescue dose'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.water_damage),
            title: Text('Environment conditions'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.view_agenda),
            title: Text("Doctor's visit"),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.map),
            title: Text("Maps"),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.location_city),
            title: Text("Location"),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.move_to_inbox),
            title: Text("Inhaler shaking"),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.panorama_wide_angle),
            title: Text("Angle of inhaler"),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
        ]).toList(),
      ),
    );
  }
}
