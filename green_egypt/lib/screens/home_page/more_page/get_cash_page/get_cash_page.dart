import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/screens/home_page/more_page/get_cash_page/components/cash_qrcode.dart';
import 'package:green_egypt/screens/home_page/more_page/get_cash_page/components/grey_container.dart';
import 'package:green_egypt/screens/home_page/more_page/get_cash_page/components/scan_and_earn_row.dart';
import 'package:green_egypt/screens/home_page/more_page/get_cash_page/controller/get_cash_page_controller.dart';
import 'package:green_egypt/services/boxes/user_data_db.dart';

class GetCashPage extends StatelessWidget {
  const GetCashPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<GetCashPageController>(
            init: GetCashPageController(),
            builder: (controller) {
              return controller.userAuthorized
                  ? showAuzorizedView(controller: controller)
                  : showUnAuthrizedView();
            }),
      ),
    );
  }
}

Widget showAuzorizedView({required GetCashPageController controller}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(.5),
    ),
    width: Dimensions.width,
    height: Dimensions.height,
    child: Center(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        width: Dimensions.width * .8,
        height: Dimensions.height * .6,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 750),
          opacity: controller.opacity,
          curve: Curves.easeInOutCubic,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              const GreyContainer(),
              Text(
                  "Thanks for Suppoting Recycling \n\n ${UserDataBox.instance.get_userName()}",
                  textAlign: TextAlign.center),
              const ScanAndEarnRow(),
              CashQrcode(),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("I'm Done"),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget showUnAuthrizedView() {
  return Container(
    color: Colors.black.withOpacity(.5),
    width: Dimensions.width,
    height: Dimensions.height,
    child: Center(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        width: Dimensions.width * .8,
        height: Dimensions.height * .3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.lock_outline_rounded,
              size: Dimensions.width * .15,
            ),
            Text(
              "Verify with Biometric \nauthintication first",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    ),
  );
}

/**
 * *************** Draw Ticket shape with code
 */

// class MyCustomClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     double w = Dimensions.width;
//     double h = Dimensions.height;
//     final path = Path()
//       ..lineTo(w * .05, 0)
//       ..quadraticBezierTo(w * .1, h * .05, w * .2, 0)
//       ..close();

//     throw UnimplementedError();
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }
