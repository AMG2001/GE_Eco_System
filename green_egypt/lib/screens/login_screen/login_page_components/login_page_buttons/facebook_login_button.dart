import 'package:flutter/material.dart';
import 'package:green_egypt/services/custom_toast.dart';
import 'package:green_egypt/services/firebase_services/facebook_auth.dart';

class FacebookSignInButton extends StatelessWidget {
  const FacebookSignInButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(28))),
        backgroundColor: MaterialStateProperty.all<Color>(
          const Color(0xFF1877F2),
        ),
      ),
      onPressed: () async {
        try {
          await FacebookCustomAuth.signInWithFacebook(context: context);
          CustomToast.showBlackToast(
              messsage: 'this functionallity disabled for Future Fix');
        } catch (e) {
          print(e.toString());
          CustomToast.showRedToast(messsage: e.toString());
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .12,
            ),
            Image(
              width: MediaQuery.of(context).size.width * .08,
              height: MediaQuery.of(context).size.height * .04,
              image: const AssetImage("assets/icons/facebook.png"),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .05,
            ),
            const Text(
              "Sign with Facebook",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
