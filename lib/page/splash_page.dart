import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pms_mobile/page/onboarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const OnboardingPage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: const Color(0xFF5053a3),
        elevation: 0,
      ),
      body: Container(
        // width: double.maxFinite,
        // height: double.maxFinite,
        decoration: const BoxDecoration(
          color: Color(0xFF5053a3),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage("assets/icon/sofa.png"),
                color: Colors.white,
                width: 64,
                height: 64,
              ),
              const SizedBox(width: 5),
              Text(
                "Furniture".toUpperCase(),
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 50.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
