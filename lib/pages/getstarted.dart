import 'package:coffee_shop/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 205, 205),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Animate(
              effects: const [
                FadeEffect(
                  begin: BlurEffect.neutralBlur,
                  duration: Duration(
                    seconds: 5,
                  ),
                ),
              ],
              child: Image.asset(
                'lib/images/coffee.png',
                scale: 2,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Animate(
              effects: const [
                SlideEffect(
                    duration: Duration(seconds: 4), curve: Curves.bounceInOut)
              ],
              child: const Text(
                'Brew Day',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Animate(
              effects: const [
                SlideEffect(
                    duration: Duration(seconds: 4),
                    curve: Curves.bounceInOut,
                    begin: MoveEffect.defaultValue)
              ],
              child: const Text(
                'How do you like your coffee?',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Animate(
              effects: const [
                FadeEffect(
                  duration: Duration(seconds: 5),
                  begin: BlurEffect.neutralBlur,
                ),
              ],
              child: Container(
                width: 280,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Enter Shop',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
