import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inhaler_mobile/components/custom_button.dart';
import 'package:inhaler_mobile/custom_colors.dart';
import 'package:inhaler_mobile/screens/profile/cubit/profile_cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileCubit cubit;
  @override
  void initState() {
    cubit = BlocProvider.of<ProfileCubit>(context);
    cubit.fetchUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLogout) {
          Navigator.pushReplacementNamed(context, '/login');
        }
      },
      buildWhen: (previous, current) => (previous != current),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              'Profile',
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
                  padding: EdgeInsets.only(bottom: 20),
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
                        cubit.userDetail?.name ?? "",
                        style: TextStyle(
                            color: Color(CustomColors.pinkDark),
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomButton(
                              onTap: () {},
                              textColor: Colors.black,
                              text: 'Edit profile',
                              height: 30,
                              textSize: 14,
                              width: 120,
                              color: Color(CustomColors.grey),
                            ),
                            CustomButton(
                              onTap: () {
                                cubit.logout();
                              },
                              textColor: Colors.black,
                              text: 'Logout',
                              height: 30,
                              textSize: 14,
                              width: 120,
                              color: CustomColors.orange,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(CustomColors.grey),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: ListView(
                      children: ListTile.divideTiles(context: context, tiles: [
                        ListTile(
                          leading: Icon(
                            Icons.data_usage,
                          ),
                          title: Text(
                            'Gender : Male',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.data_usage,
                          ),
                          title: Text(
                            'Age : 10',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.data_usage,
                          ),
                          title: Text(
                            'Weight : 60',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.data_usage,
                          ),
                          title: Text(
                            'Blood Group : O+',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.data_usage,
                          ),
                          title: Text(
                            'Allergies : Allergie to pollen',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.data_usage,
                          ),
                          title: Text(
                            cubit.userDetail?.phoneNumber ?? "",
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.data_usage,
                          ),
                          title: Text(
                            'Switch account',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ),
                      ]).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
