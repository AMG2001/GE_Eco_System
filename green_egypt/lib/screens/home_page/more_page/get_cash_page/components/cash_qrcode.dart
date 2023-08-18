import 'package:flutter/material.dart';
import 'package:green_egypt/services/boxes/user_data_db.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class CashQrcode extends StatelessWidget {
  CashQrcode({super.key});
  String totalPoints = UserDataBox.instance.get_totalPoints().toString();
  String earnedCash = (UserDataBox.instance.get_recycledCansItemsNumber() * .3 +
          UserDataBox.instance.get_recycledPlasticItemsNumber() * .2)
      .toString();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 200,
          child: SfBarcodeGenerator(
            value: '35 Points : 4.5 le',
            symbology: QRCode(),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          "$totalPoints point : $earnedCash le",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
