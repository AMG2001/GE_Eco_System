import 'package:flutter/material.dart';

class ItemsCounters extends StatelessWidget {
  ItemsCounters({required this.itemName, required this.itemCounter});
  late String itemName;
  late int itemCounter;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          itemName,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 18,
        ),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.green, width: 2),
          ),
          child: Text(
            itemCounter < 10
                ? "0" + itemCounter.toString() 
                : itemCounter.toString(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }
}
