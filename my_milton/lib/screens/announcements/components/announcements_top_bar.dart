import 'package:flutter/material.dart';
import 'package:my_milton/values/constants.dart';

class AnnouncementsTopBar extends StatelessWidget {
  const AnnouncementsTopBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
return Container(
          width: double.infinity,
          height: announcementTopBarHeight,
          decoration: BoxDecoration(
            gradient: scheduleTopBarGradient
          ),
          // child: Card(
          //   color: Colors.cyan,
          //   elevation: 5.0,
          //   shape:
          //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          // ),
          // color: Colors.cyan,
          child: Center(child: Text("announcements", style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Poppins'),)),
        );
  }
}