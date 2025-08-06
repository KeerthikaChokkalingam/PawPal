import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 40, right: 40, bottom: 40, top: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Find Your Best \n',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 36,
                      fontWeight: FontWeight.w800),
                ),
                TextSpan(
                  text: 'Companion \n',
                  style: TextStyle(
                      color: Colors.amber,
                      fontSize: 36,
                      fontWeight: FontWeight.w800),
                ),
                TextSpan(
                  text: 'With Us \n \n',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 36,
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/splashImage.png',
          ),
          Bounceable(
              onTap: () {},
              child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.amber,
                  ),
                  child: const Center(
                      child: Text("Get Started",
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.8,
                          ))))),
        ],
      ),
    );
  }
}
