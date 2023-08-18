import 'package:green_egypt/config/localization/language_box.dart';
import 'package:green_egypt/screens/home_page/qrcode_page/controller/qrcode_page_controller.dart';
import 'package:green_egypt/services/Shared_preferences/first_launch.dart';
import 'package:green_egypt/services/boxes/transactions_box.dart';
import 'package:green_egypt/services/boxes/user_data_db.dart';
import 'package:green_egypt/services/biometric_auth.dart';
import 'package:green_egypt/config/theme/application_theme_controller_box.dart';
import 'package:green_egypt/services/time_controller.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

class ApplicationServices {
  static Future<void> initAllApplicationServices() async {
    TimeController.instance.initTimingController();
    /**
     * init language box to retrieve last stored language on application .
     */
    await LanguageBox.instance.initLanguageBox();
    // user Data Box that contain all user data stored in .
    // boxes are local storing objects as Shared Preferences put with extra speed .
    UserDataBox.instance.initiateUserBox();

    await ApplicationThemeController.instance
        .initApplicationThemeController_ThemeAndBox();

    await BiometricController.instance.initBiometricAuth();

    await QrcodePageController.instance.init_lastOperationBox();
    // initialize First launch Shared pref to decide Navigation Destination .
    await FirstLaunch.init();

    await TransactionsBox.instance.init_TransactionsBox();

    // await Supabase.initialize(
    //   url: 'YOUR_SUPABASE_URL',
    //   anonKey: 'YOUR_SUPABASE_ANON_KEY',
    // );
  }
}
