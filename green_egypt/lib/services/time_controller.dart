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
      message = "Good morning!";
    } else if (currentHour >= 12 && currentHour < 18) {
      message = "Good afternoon!";
    } else if (currentHour >= 18 && currentHour < 22) {
      message = "Good evening!";
    } else {
      message = "Good night!";
    }
    print('timing message : $message');
  }
}
