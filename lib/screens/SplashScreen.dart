import 'dart:async';
import 'package:flutter/material.dart';
import 'ConnectScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _controller.forward();

    Timer(Duration(seconds: 3), () {
      _controller.reverse().then((value) {
        Navigator.of(context).pushReplacement(_createRoute());
      });
    });
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => ConnectScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(color: Color(0xFFD4FF5B)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/Logo.png'),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildLogoText('P', -2.36),
                        _buildLogoText('e', -3.30),
                        _buildLogoText('d', -3.77),
                        _buildLogoText('a', -2.83),
                        _buildLogoText('l', -4.25),
                      ],
                    ),

                    Text(
                      'SERVICE',
                      style: TextStyle(
                        color: Color(0xFF121926),
                        fontSize: 23.59,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                        letterSpacing: 10.38,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogoText(String letter, double letterSpacing) {
    return Text(
      letter,
      style: TextStyle(
        color: Color(0xFF121926),
        fontSize: 60,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        height: 1,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
