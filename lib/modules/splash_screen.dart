import 'dart:async';
import 'package:ayha/modules/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void startTimer() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (route) => false);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/splash.jpeg"),
          fit: BoxFit.cover,
        )),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                image: AssetImage('assets/images/helal.png'),
              ),
              SizedBox(height: 20,),
              Text(
                'آيه',
                style: TextStyle(
                  fontSize: 100,
                  color: Color(0xffDFB281),
                ),
              ),
              Expanded(
                  child: Text(
                ' من الله',
                style: TextStyle(
                  wordSpacing: 15,
                    fontSize: 100,
                    color: Color(0xffDFB281),
                   ),
              )),
            ],
          ),
        )),
      ),
    );
  }
}
