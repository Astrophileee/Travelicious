import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../nav/bottnav.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _textController;
  late Animation<double> _textScaleAnimation;
  bool _showLottie = false;

  @override
  void initState() {
    super.initState();

    _textController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..forward();

    _textScaleAnimation = CurvedAnimation(
      parent: _textController,
      curve: Curves.elasticOut,
    );

    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _showLottie = true;
      });
    });

    Future.delayed(Duration(seconds: 3, milliseconds: 500), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                MyCustomNavBar()),
      );
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f3f5),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (_showLottie)
              Lottie.asset(
                'lib/assets/lottie/Splash.json',
                width: 300,
                height: 300,
              ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 300),
                ScaleTransition(
                  scale: _textScaleAnimation,
                  child: Text(
                    'TRAVELICIOUS',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1b1b1b),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
