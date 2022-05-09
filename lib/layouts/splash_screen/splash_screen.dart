import 'package:flutter/material.dart';
import 'package:lung/components/components.dart';
import 'package:lung/layouts/create_account/create_account.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState()
  {
    super.initState();
    goToNextView();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            bottom: 600,
            left: 200,
            child: Image.asset('assets/images/top_circle.png'),
          ),
          Positioned(
            right: 60,
            top: 300,
            child: Center(
              child: Row(
                children: [
                  Image.asset('assets/images/center_circle.png',height: 180,),
                  const SizedBox(width: 40,),
                  Image.asset('assets/images/splash.png'),
                ],
              ),
            ),
          ),
          Positioned(
            top: 700,
            left: 300,
            child: Image.asset('assets/images/bottom_circle.png'),
          ),
        ],
      ),
    );
  }
  void goToNextView() {
    Future.delayed(const Duration(seconds: 3),
            (){
          navigateAndFinish(context,const CreateAccount());
        }
    );
  }
}
