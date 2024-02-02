import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/network/network.dart';
import 'package:taskati/core/text_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskati/features/home/homeView.dart';
import 'package:taskati/features/home/upload/upload.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    bool isApload = appLocal.getCachData(appLocal.isApload_key) ?? false;
    Future.delayed(Duration(seconds: 7), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => isApload ? homeVeiw() : upload(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/logo.json'),
            Text(
              'taskati',
              style: getTitleStyle(),
            ),
            Text(
              'it\'s time to be organized',
              style: getBodyStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
