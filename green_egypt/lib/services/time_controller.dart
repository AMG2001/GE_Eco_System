class TimeController {
  TimeController._privateConstructor();

  static final TimeController _instance = TimeController._privateConstructor();

  static TimeController get instance => _instance;

  String message = "";

  String get getDayTimeMessage => message;

  void initTimingController() {
    DateTime now = DateTime.now();
    int currentHour = now.hour;
    if (currentHour >= 5 && currentHour < 12) {
      message = "Good Morning";
    } else if (currentHour >= 12 && currentHour < 18) {
      message = "Good Afternoon";
    } else if (currentHour >= 18 && currentHour < 22) {
      message = "Good Evening";
    } else {
      message = "Good Night";
    }
    print('timing message : $message');
  }
}
