import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/constants.dart';
import 'package:green_egypt/config/theme/default_colors.dart';
import 'package:green_egypt/screens/home_page/more_page/feed_back_page/feedback_component/app_header.dart';
import 'package:green_egypt/screens/home_page/more_page/feed_back_page/feedback_component/custom_app_bar.dart';
import 'package:green_egypt/screens/home_page/more_page/feed_back_page/feedback_component/reviewArea_submitButton.dart';
import 'package:green_egypt/screens/home_page/more_page/feed_back_page/feedback_component/points.dart';
import 'package:green_egypt/screens/home_page/more_page/feed_back_page/feedback_page_controller.dart';
import 'package:green_egypt/services/boxes/user_data_db.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<FeedbackPageController>(
          init: FeedbackPageController(context: context),
          builder: (controller) {
            return SingleChildScrollView(
              child: Stack(
                children: [
                  const AppHeader(),
                  Positioned(
                      top: -380,
                      left: -187,
                      child: Opacity(
                          opacity: 0.9,
                          child: Image.asset('assets/images/bg.png'))),
                  SafeArea(
                      child: Padding(
                    padding: const EdgeInsets.all(Constants.kDefaultPadding),
                    child: Column(
                      children: [
                        const CustomAppBar(),
                        const SizedBox(height: Constants.kDefaultPadding * 4),
                        /**
                         * Circle avatar that show user image .
                         */
                        CircleAvatar(
                          backgroundImage:
                              NetworkImage(controller.userImageUrl),
                          radius: 70,
                        ),
                        const SizedBox(height: Constants.kDefaultPadding),
                        Divider(
                          color: DefaultColors.kTextLightColor,
                        ),
                        const SizedBox(height: Constants.kDefaultPadding),
                        const PointStats(),
                        const SizedBox(height: Constants.kDefaultPadding),
                        Divider(
                          color: DefaultColors.kTextLightColor,
                        ),
                        const SizedBox(height: Constants.kDefaultPadding),
                        Text(
                          "${'Hi ,'.tr} ${UserDataBox.instance.get_userName()}",
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          'How Would You Rate Our App?'.tr,
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: Constants.kDefaultPadding),
                        StatefulBuilder(builder: (context, setState) {
                          return SmoothStarRating(
                            borderColor: DefaultColors.kTextLightColor,
                            spacing: Constants.kDefaultPadding,
                            allowHalfRating: false,
                            color: DefaultColors.kPrimaryColor,
                            onRatingChanged: (v) {
                              setState(() {
                                controller.setRating = v.toInt();
                              });
                            },
                            starCount: 5,
                            rating: controller.rating.toDouble(),
                            size: 45.0,
                          );
                        }),
                        const SizedBox(height: Constants.kDefaultPadding),
                        ReviewArea_SubmitButton(controller: controller)
                      ],
                    ),
                  ))
                ],
              ),
            );
          }),
    );
  }
}
