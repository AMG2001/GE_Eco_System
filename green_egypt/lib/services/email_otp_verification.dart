import 'package:email_otp/email_otp.dart';

class EmailOTPVerification {
  EmailOTPVerification._privateIntance();

  static final EmailOTPVerification _instance =
      EmailOTPVerification._privateIntance();

  static EmailOTPVerification get instance => _instance;

  EmailOTP otpAuth = EmailOTP();

  Future<void> sendEmail({required String email}) async {
    otpAuth.setConfig(
        appEmail: "greenegypt@support.com",
        appName: "Green Egypt",
        userEmail: email,
        otpLength: 6,
        otpType: OTPType.digitsOnly);

    try {
      await otpAuth.sendOTP();
      print('message sent');
    } catch (e) {
      print('error while sending email : $e');
    }
  }

  Future<bool> validateOTP({required String userInputtedOTP}) async {
    late bool valid;
    try {
      valid = await otpAuth.verifyOTP(otp: userInputtedOTP);
    } catch (e) {
      valid = false;
      print('user entered wrong OTP');
    }
    return valid;
  }
}
