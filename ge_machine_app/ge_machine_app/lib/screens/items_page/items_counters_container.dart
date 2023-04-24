import 'package:flutter/material.dart';
import 'package:ge_machine_app/controllers/items_controller.dart';
import 'package:ge_machine_app/screens/items_page/green_divider.dart';
import 'package:ge_machine_app/screens/items_page/items_counters.dart';
import 'package:get/get.dart';

class ItemsCountersContainer extends StatelessWidget {
  const ItemsCountersContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetBuilder<ItemsController>(
          init: ItemsController(),
          builder: (itemsController) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.green, width: 2),
              ),
              padding: EdgeInsets.all(36),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ItemsCounters(
                      itemName: 'Plastic',
                      itemCounter: itemsController.plasticItems),
                  GreenDivider(),
                  ItemsCounters(
                      itemName: 'Cans', itemCounter: itemsController.cansItems),
                  GreenDivider(),
                  ItemsCounters(
                      itemName: 'Points', itemCounter: itemsController.points)
                ],
              ),
            );
          }),
    );
  }
}
