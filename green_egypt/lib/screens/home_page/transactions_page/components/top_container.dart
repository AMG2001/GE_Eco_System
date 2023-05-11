import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/theme/application_theme_controller_box.dart';
import 'package:green_egypt/screens/home_page/transactions_page/controller/transaction_page_header_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransactionsPageUpperContainerController>(
        init: TransactionsPageUpperContainerController(),
        builder: (controller) {
          return Container(
            height: Dimensions.height * .3,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: ApplicationThemeController.instance.isDark
                        ? [Color.fromARGB(120, 158, 158, 158), Colors.black]
                        : [Colors.black, Colors.white])),
            width: Dimensions.width,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        width: Dimensions.width * .05,
                      ),
                      Text(
                        'Transactions'.tr,
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Icon(
                        Icons.history,
                        color: Colors.white,
                        size: 20.sp,
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      height: Dimensions.height * .06,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        controller.barsViewindex == 0
                                            ? Colors.white
                                            : Colors.black),
                                onPressed: () {
                                  controller.show7DaysView();
                                },
                                child: Text(
                                  '7 Days'.tr,
                                  style: TextStyle(
                                      color: controller.barsViewindex == 0
                                          ? Colors.black
                                          : Colors.white),
                                )),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        controller.barsViewindex == 1
                                            ? Colors.white
                                            : Colors.black),
                                onPressed: () {
                                  controller.show4WeeksView();
                                },
                                child: Text(
                                  '4 Weeks'.tr,
                                  style: TextStyle(
                                      color: controller.barsViewindex == 1
                                          ? Colors.black
                                          : Colors.white),
                                )),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: controller.barsViewindex == 2
                                      ? Colors.white
                                      : Colors.black),
                              onPressed: () {
                                controller.show12MonthView();
                              },
                              child: Text(
                                '12 Month'.tr,
                                style: TextStyle(
                                    color: controller.barsViewindex == 2
                                        ? Colors.black
                                        : Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Total : 15.689 \$'.tr,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Expanded(
                  child: PageView.builder(
                    
                    onPageChanged: (value) {
                      if (value == 0)
                        controller.show7DaysView();
                      else if (value == 1)
                        controller.show4WeeksView();
                      else if (value == 2) controller.show12MonthView();
                    },
                    controller: controller.pageController,
                    itemCount: controller.barsView.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: controller.barsView[index],
                      );
                    },
                  ),
                )
              ],
            ),
          );
        });
  }
}
