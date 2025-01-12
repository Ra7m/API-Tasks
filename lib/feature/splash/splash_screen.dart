import 'package:category/feature/category/view/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateAfterThreeSeconds();
    super.initState();
  }

  void navigateAfterThreeSeconds() {
    Future.delayed(const Duration(seconds: 5)).then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const LoginScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpp6IVMMZ-0wdYYfsokzBbdRxN8rrKgkvaBQ&s'),
          ),
          color: Color.fromARGB(255, 236, 234, 234),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SpinKitThreeBounce(color: Colors.brown),
            SizedBox(height: 150),
          ],
        ),
      ),
    );
  }
}
