import 'package:flutter/material.dart';
import 'package:my_milton/values/constants.dart';

class AnnouncementCard extends StatelessWidget {
  const AnnouncementCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(announcementCardMargin),
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.only(bottomRight: Radius.circular(50.0),bottomLeft: Radius.circular(50.0),topRight: Radius.circular(50.0)),
          borderRadius: BorderRadius.circular(8.0),
          color: announcementCardColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 3.0),
              blurRadius: 5.0,
            ),
          ],
        ),
        width: double.infinity,
        // color: announcementCardColor,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(announcementProfilePicMargin),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(announcementProfilePicHeight),
                child: Image.network(
                  "https://s3.amazonaws.com/heysummit-production/media/thumbnails/uploads/events/2020-spechapterconferences/2S5tKcLR9KXAwPar5rc8x3_square_large.jpg",
                  height: announcementProfilePicHeight,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "Chinese Club at 3:00 Today! Come out to WRE312 and ",
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text("Sebastian Park - Today at 3:30pm",
                        style: TextStyle(color: Colors.grey)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
