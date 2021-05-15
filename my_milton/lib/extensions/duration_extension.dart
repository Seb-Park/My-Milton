extension on Duration {
  String toReadableTime() {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(this.inMinutes.remainder(60));
    return "${twoDigits(this.inHours)}:$twoDigitMinutes";
  }
}

class TimeMethods { //make easier to code if people don't have extensions enabled
//if you want to enable extensions make sure you're switched to dart dev channel and have experimental features enabled
//https://stackoverflow.com/questions/55477046/how-can-i-enable-flutter-dart-language-experiments
  static String durationToReadableTime(Duration dur) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(dur.inMinutes.remainder(60));
    return "${dur.inHours}:$twoDigitMinutes";
  }
}