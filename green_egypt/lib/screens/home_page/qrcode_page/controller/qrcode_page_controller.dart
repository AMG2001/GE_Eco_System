import 'package:get/get.dart';
import 'package:green_egypt/services/console_message.dart';
import 'package:hive/hive.dart';

class QrcodePageController extends GetxController {
  QrcodePageController._privateConstructor();

  static final QrcodePageController _instance =
      QrcodePageController._privateConstructor();

  static QrcodePageController get instance => _instance;

  late Box lastOperationBox;

  late int lastOperationNumber;

  String _boxKey_lastOperationBox = 'last_operation_box_key';

  String _key_last_operation = 'last_operation_key';

  Future<void> init_lastOperationBox() async {
    lastOperationBox = await Hive.openBox(_boxKey_lastOperationBox);
    lastOperationNumber =
        lastOperationBox.get(_key_last_operation, defaultValue: 0);
    ConsoleMessage.successMessage('last Operation box openned successfully');
  }

  Future<bool> checkAndStore_storedLastOperationNom_with_NewLastOperationNumber(
      {required int newLastOperationNumber}) async {
    late bool b;
    if (newLastOperationNumber == lastOperationNumber) {
      b = false;
    } else {
      await lastOperationBox.put(_key_last_operation, newLastOperationNumber);
      lastOperationNumber = newLastOperationNumber;
      b = true;
    }
    return b;
  }
}
