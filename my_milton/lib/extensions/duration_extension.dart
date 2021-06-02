extension on Duration {
  String toReadableTime() {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(this.inMinutes.remainder(60));
    return "${twoDigits(this.inHours)}:$twoDigitMinutes";
  }
}

class TimeMethods {
  //make easier to code if people don't have extensions enabled
//if you want to enable extensions make sure you're switched to dart dev channel and have experimental features enabled
//https://stackoverflow.com/questions/55477046/how-can-i-enable-flutter-dart-language-experiments
  static String durationToReadableTime(Duration dur) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(dur.inMinutes.remainder(60));
    return "${dur.inHours}:$twoDigitMinutes";
  }

  static String weekdayFromInt(int dayNo) {
    switch (dayNo) {
      case DateTime.monday:
        {
          return "Monday";
        }
        break;

      case DateTime.tuesday:
        {
          return "Tuesday";
        }
        break;

      case DateTime.wednesday:
        {
          return "Wednesday";
        }

      case DateTime.thursday:
        {
          return "Thursday";
        }

      case DateTime.friday:
        {
          return "Friday";
        }

      case DateTime.saturday:
        {
          return "Saturday";
        }

      default:
        {
          return "Sunday";
        }
        break;
    }
  }

  static String monthNameFromInt(int monthNo) {
    switch (monthNo) {
      case 1:
        {
          return "January";
        }
        break;

      case 2:
        {
          return "February";
        }
        break;

      case 3:
        {
          return "March";
        }
        break;

      case 4:
        {
          return "April";
        }
        break;

      case 5:
        {
          return "May";
        }
        break;

      case 6:
        {
          return "June";
        }
        break;

      case 7:
        {
          return "July";
        }
        break;

      case 8:
        {
          return "August";
        }
        break;

      case 9:
        {
          return "September";
        }
        break;
      case 10:
        {
          return "October";
        }
        break;

      case 11:
        {
          return "November";
        }
        break;

      default:
        {
          return "December";
        }
        break;
    }
  }

  static String dateTimeToRelativeDay(DateTime dt) {
    if (dt.toUtc().isAfter(DateTime.now().toUtc())) {}
  }

  static String dateTimeToYYYYMMDD(DateTime dt) {
    return dt.year.toString() +
        "." +
        dt.month.toString().padLeft(2, "0") +
        "." +
        dt.day.toString().padLeft(2, "0");
  }

  static String getShortenedWeekday(DateTime dt) {
    return TimeMethods.weekdayFromInt(dt.weekday).substring(0, 3);
  }

  static DateTime getDayInTheWeekOf(DateTime dt, int desiredWeekday) {
    return dt
        .add(Duration(days: -dt.weekday))
        .add(Duration(days: desiredWeekday));
  }

  static bool checkIfDayIsSame(DateTime d1, DateTime d2) {
    return (d1.day == d2.day && d1.month == d2.month && d1.year == d2.year);
  }

  static DateTime convertDateTimeToDate(DateTime dt) {
    return dt.add(Duration(
        hours: -dt.hour,
        minutes: -dt.minute,
        seconds: -dt.second,
        milliseconds: -dt.millisecond,
        microseconds: -dt.microsecond));
  }

  static DateTime addWeeks(DateTime dt, int weeks){
    return dt.add(Duration(days: weeks * 7));
  }
}
