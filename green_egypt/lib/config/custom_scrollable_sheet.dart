import 'package:flutter/material.dart';

class CustomDraggableScrollableSheet {
  void showCustomDraggableScrollableSheet(
      {required BuildContext context,
      required Widget child,
      double initialSize = 1,
      double minSize = 1,
      double maxSize = 1,
      Color sheetBackgroundColor = Colors.black,
      double precentOfSheetOnScreen = .8,
      bool isDismissable = false}) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isDismissible: isDismissable,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          height: height * precentOfSheetOnScreen,
          width: width,
          child: DraggableScrollableSheet(
              initialChildSize: initialSize,
              maxChildSize: maxSize,
              minChildSize: minSize,
              snap: true,
              builder: (context, scrollController) {
                return ListView(
                  controller: scrollController,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: sheetBackgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      padding: EdgeInsets.all(16),
                      width: width,
                      child: child,
                    )
                  ],
                );
              }),
        );
      },
    );
  }
}
