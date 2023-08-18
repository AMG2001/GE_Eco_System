import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/screens/home_page/transactions_page/components/top_container/transaction_info_model.dart';
import 'package:green_egypt/services/boxes/transactions_box.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BottomContainer extends StatelessWidget {
  BottomContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransactionsBox>(
      init: TransactionsBox.instance,
      builder: (transactionsBoxController) {
        if (transactionsBoxController.numberOfStoredTransaction == 0) {
          return ListView(
            children: [
              Container(
                width: Device.width,
                height: Device.height * .7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "There is not Transaction implemented !!".tr,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Lottie.asset(
                        "assets/animated_vectors/empty_transactions_list.json"),
                  ],
                ),
              ),
            ],
          );
        } else {
          return SizedBox(
            width: Dimensions.width,
            height: 0.4 * Dimensions.height,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Transactions'.tr,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 17),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'View All'.tr,
                          style: const TextStyle(
                              color: Color(0XFFD9D9D9),
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount:
                        transactionsBoxController.allStoredTransactions.length,
                    itemBuilder: (context, index) {
                      /*
                    assets\animated_vectors\empty_transactions_list.json
                    */
                      return TransactionInfoModel(
                          date: transactionsBoxController
                              .allStoredTransactions[index]['date'],
                          garbage:
                              'Plastic : ${transactionsBoxController.allStoredTransactions[index]['plastic']} , Cans :  ${transactionsBoxController.allStoredTransactions[index]['cans']}'
                                  .tr,
                          points:
                              '${transactionsBoxController.allStoredTransactions[index]['points']}');
                    },
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
