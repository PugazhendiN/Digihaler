import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:inhaler_mobile/components/custom_button.dart';
import 'package:inhaler_mobile/components/input_custom_txf.dart';
import 'package:inhaler_mobile/custom_colors.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:inhaler_mobile/enums/sign_state_type.dart';
import 'package:inhaler_mobile/network/auth_service.dart';
import 'package:inhaler_mobile/screens/home_bucket.dart';
import 'package:inhaler_mobile/screens/login/cubit/login_cubit.dart';
// import 'package:inhaler_mobile/screens/home_screen.dart';

class SignScreen extends StatefulWidget {
  const SignScreen({Key? key}) : super(key: key);

  @override
  _SignScreenState createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late LoginCubit cubit;

  SignStateType signState = SignStateType.signin;
  late double heightYOffset;
  late double heightOthers;
  late double registerHeightYOffset;
  late double heightSize;
  late double imageMarginTopSize;
  late double widthSize;
  bool _keyBoardVisible = false;

  @override
  void initState() {
    KeyboardVisibilityController().onChange.listen((bool visible) {
      setState(() {
        this._keyBoardVisible = visible;
      });
    });
    cubit = BlocProvider.of<LoginCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    heightSize = MediaQuery.of(context).size.height;
    widthSize = MediaQuery.of(context).size.width;
    switch (signState) {
      case SignStateType.signin:
        heightYOffset = _keyBoardVisible ? 20 : heightSize * 0.2;
        heightOthers = heightSize - heightYOffset - 30;
        registerHeightYOffset = heightSize;
        imageMarginTopSize = heightSize * 0.09;
        break;
      case SignStateType.signup:
        heightYOffset = _keyBoardVisible ? 20 : heightSize * 0.25;
        registerHeightYOffset = _keyBoardVisible ? 20 : heightSize * 0.25;
        heightOthers = heightSize - registerHeightYOffset - 30;
        imageMarginTopSize = heightSize * 0.07;
        break;
    }
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomeBucket()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: <Widget>[
              AnimatedContainer(
                height: double.infinity,
                curve: Curves.fastLinearToSlowEaseIn,
                duration: Duration(milliseconds: 1000),
                color: Colors.white,
                width: double.infinity,
                padding: EdgeInsets.only(top: imageMarginTopSize),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image(
                      width: widthSize * 0.25,
                      height: widthSize * 0.25,
                      fit: BoxFit.cover,
                      image: AssetImage('assets/arcapis.PNG'),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Never Forget your medication ever again ...',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w200),
                    ),
                  ],
                ),
              ),
              AnimatedContainer(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color(CustomColors.pinkDark).withOpacity(0.5),
                        width: 0.3),
                    color: signState == SignStateType.signup
                        ? Theme.of(context).primaryColor.withOpacity(0.1)
                        : Color(CustomColors.pinkDark),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                height: heightOthers,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.symmetric(
                    vertical: signState == SignStateType.signup ? 10 : 30,
                    horizontal: signState == SignStateType.signup ? 20 : 10),
                width: double.infinity,
                transform: Matrix4.translationValues(0, heightYOffset, 1),
                duration: Duration(milliseconds: 2500),
                curve: Curves.fastLinearToSlowEaseIn,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Sign in to continue',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Divider(
                            height: 2,
                            thickness: 1,
                            color: Colors.white,
                            indent: MediaQuery.of(context).size.width * 0.3,
                            endIndent: MediaQuery.of(context).size.width * 0.3,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Sign in with Email / Password',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              prefixIconColor: Colors.blue,
                              prefixIcon: const Icon(Icons.email),
                              border: OutlineInputBorder(),
                              hintText: 'Enter your email',
                            ),
                            controller: _emailController,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              prefixIconColor: Colors.blue,
                              prefixIcon: const Icon(Icons.security),
                              border: OutlineInputBorder(),
                              hintText: 'Enter your password',
                            ),
                            controller: _passwordController,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          CustomButton(
                              width: 100,
                              textSize: 20,
                              textColor: Colors.black,
                              color: Colors.blue,
                              height: 40,
                              text: 'Login',
                              onTap: () async {
                                final email = _emailController.text;
                                final password = _passwordController.text;
                                _emailController.text = "";
                                _passwordController.text = "";
                                cubit.login(email, password);
                              })
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          SignInButtonBuilder(
                            text: 'Sign in with Google',
                            icon: Icons.email,
                            onPressed: () {},
                            backgroundColor: Colors.redAccent,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SignInButton(
                            Buttons.FacebookNew,
                            elevation: 3,
                            text: "Sign up with Facebook",
                            onPressed: () {},
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SignInButtonBuilder(
                            text: 'Sign in with OTP',
                            icon: Icons.phone,
                            onPressed: () {},
                            backgroundColor: Colors.blue,
                          )
                        ],
                      ),
                      CustomButton(
                          textSize: 14,
                          textColor: Colors.black,
                          color: Colors.blue,
                          width: 139,
                          height: 40,
                          text: 'Create New Account',
                          onTap: () {
                            setState(() {
                              signState = SignStateType.signup;
                            });
                          }),
                    ],
                  ),
                ),
              ),
              AnimatedContainer(
                decoration: BoxDecoration(
                    border: Border.all(
                        //color: Theme.of(context).primaryColor.withOpacity(0.5),
                        color: Color(CustomColors.pinkDark).withOpacity(0.5),
                        width: 0.3),
                    color: Color(CustomColors.pinkDark),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                height: heightOthers,
                padding: EdgeInsets.all(30),
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                width: double.infinity,
                transform:
                    Matrix4.translationValues(0, registerHeightYOffset, 1),
                duration: Duration(milliseconds: 2500),
                curve: Curves.fastLinearToSlowEaseIn,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Create a new account',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Divider(
                            height: 2,
                            thickness: 1,
                            color: Colors.white,
                            indent: MediaQuery.of(context).size.width * 0.3,
                            endIndent: MediaQuery.of(context).size.width * 0.3,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Sign up with Email / Password',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          InputWithIcon(
                            color: Colors.blue,
                            radius: 2,
                            icon: Icons.email,
                            hintText: 'Enter your email',
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          InputWithIcon(
                            color: Colors.blue,
                            radius: 2,
                            icon: Icons.security,
                            hintText: 'Enter your password',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                            onTap: () {},
                            textSize: 10,
                            textColor: Colors.black,
                            width: 70,
                            color: Colors.blue,
                            height: 40,
                            text: 'Create',
                          )
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          SignInButtonBuilder(
                            text: 'Sign in with Google',
                            icon: Icons.email,
                            onPressed: () {},
                            backgroundColor: Colors.redAccent,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SignInButton(
                            Buttons.FacebookNew,
                            elevation: 3,
                            text: "Sign up with Facebook",
                            onPressed: () {},
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SignInButtonBuilder(
                            text: 'Sign in with OTP',
                            icon: Icons.phone,
                            onPressed: () {},
                            backgroundColor: Colors.blue,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                              textColor: Colors.black,
                              color: Colors.blue,
                              height: 20,
                              width: 150,
                              textSize: 12,
                              text: '<- Back to login',
                              onTap: () {
                                setState(() {
                                  signState = SignStateType.signin;
                                });
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
