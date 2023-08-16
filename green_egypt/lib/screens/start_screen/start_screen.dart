
import 'package:flutter/material.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/screens/start_screen/components/start_screen_login_button.dart';
import 'package:green_egypt/screens/start_screen/components/start_screen_register_button.dart';
import 'package:lottie/lottie.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Dimensions.width,
        height: Dimensions.height,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset('assets/animated_vectors/hello.json', width: 350),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  "We are happy to see you in Green Egypt",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 48,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Don't have an Account !",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                /**
                 * Regsiter button
                 */
                const StartScreenRegisterButton(),
                const SizedBox(
                  height: 12,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Already have an Account !",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                /**
                 * Login button
                 */
                const StartScreenLoginButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
