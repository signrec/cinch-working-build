import 'package:cinch/login/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

import '../camera/screen_takepicture.dart';
import '../resources/colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(39, 42, 44, 1),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/login.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Container(
                height: 270,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(39, 42, 44, 1).withOpacity(0.7),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  ),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 5)
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          height: 14.w,
                        ),
                        Text("Welcome to Cinch",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: NowUIColors.beyaz,
                              fontSize: 20.w,
                            )),
                        SizedBox(
                          height: 5.w,
                        ),
                        const Text("Communication is not a barrier",
                            style: TextStyle(
                              color: NowUIColors.beyaz,
                              fontSize: 15,
                              fontFamily: 'Roboto-Regular',
                            )),
                        SizedBox(
                          height: 4.w,
                        ),
                        SizedBox(
                          height: 16.w,
                        ),
                        ButtonTheme(
                          minWidth: 335.0,
                          height: 50.0,
                          child: FlatButton(
                            textColor: NowUIColors.homeclr,
                            color: NowUIColors.beyaz,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: const TakePicture()));
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: const Text(
                              "Register Later\u200d",
                              style: TextStyle(
                                color: NowUIColors.homeclr,
                                fontSize: 14,
                                fontFamily: 'Roboto-Regular',
                                height: 1.5,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 50.0,
                          width: 335.0,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              primary: Colors.white,
                              side: const BorderSide(
                                  color: Colors.white, width: 2),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                            ),
                            child: const Text('Login / SignUp',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Roboto-Regular',
                                  height: 1.5,
                                )),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: LoginScreen()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
