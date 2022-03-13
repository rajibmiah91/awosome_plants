import 'dart:async';

import 'package:cart_ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
        Timer(Duration(seconds: 2), (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const GridViewHome()));
        });
    super.initState();
  }

 @override
void didChangeDependencies() {

  super.didChangeDependencies();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        SpinKitFadingCircle(
          color: Colors.amber, size: 70,
        )
        ],
      ),
    );
  }
}