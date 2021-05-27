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
      case 1:
        {
          return "Monday";
        }
        break;

      case 2:
        {
          return "Tuesday";
        }
        break;

      case 3:
        {
          return "Wednesday";
        }

      case 4:
        {
          return "Thursday";
        }

      case 5:
        {
          return "Friday";
        }

      case 6:
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
}
