import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:chat_app/componants/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AvatarGlow(
                startDelay: const Duration(microseconds: 1000),
                glowColor: Colors.blueAccent,
                endRadius: 100,
                child: Material(
                  elevation: 10,
                  shape: const CircleBorder(),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[100],
                    child: Image.asset(
                      'assets/images/scholar.png',
                      height: 60,
                    ),
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Pacifico',
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('Chat App!'),
                    TypewriterAnimatedText('SCHOLAR'),
                  ],
                  onTap: () {
                    if (kDebugMode) {
                      print("Tap Event");
                    }
                  },
                ),
              ),
            ),
            AvatarGlow(
              startDelay: const Duration(microseconds: 1000),
              glowColor: Colors.blueAccent,
              endRadius: 60,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: kPrimaryColor,
                child: IconButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'SignIn');
                    },
                    icon: const Icon(
                      Icons.arrow_forward,
                      size: 40,
                        color: Colors.white,
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
