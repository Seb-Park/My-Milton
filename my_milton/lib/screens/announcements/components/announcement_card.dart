import 'package:flutter/material.dart';
import 'package:my_milton/extensions/duration_extension.dart';
import 'package:my_milton/models/announcements_model.dart';
import 'package:my_milton/screens/announcements/components/announcement_dialogue.dart';
import 'package:my_milton/values/constants.dart';

class AnnouncementCard extends StatelessWidget {
  const AnnouncementCard(
      {Key key,
      this.messageText,
      this.authorText,
      this.timePosted,
      this.tags,
      this.titleText})
      : super(key: key);

  final String titleText;
  final String messageText;
  final String authorText;
  final DateTime timePosted;
  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(announcementCardMargin),
      child: Container(
        height: announcementCardHeight,
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.only(bottomRight: Radius.circular(50.0),bottomLeft: Radius.circular(50.0),topRight: Radius.circular(50.0)),
          borderRadius: BorderRadius.circular(announcementCardBorderRadius),
          color: announcementCardColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 4.0),
              blurRadius: 7.0,
            ),
          ],
        ),
        width: double.infinity,
        child: MaterialButton(
          onPressed: () async {
            return showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) {
                  return AnnouncementDetailPopup(
                    title: titleText,
                    time: timePosted,
                    author: authorText,
                    content: messageText,
                  );
                });
          },
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
                        // child: Text(
                        //   titleText,
                        //   overflow: TextOverflow.fade,
                        //   softWrap: false,
                        //   style: TextStyle(fontWeight: FontWeight.bold),
                        // ),
                        child: RichText(
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: titleText + "   ",
                                  style: announcementTitleTextStyle),
                              TextSpan(
                                text: messageText,
                                style: announcementSecondaryTextStyle,
                              ),
                            ],
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text("$authorText - ${TimeMethods.weekdayFromInt(timePosted.weekday)}",
                          style: announcementSecondaryTextStyle),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  factory AnnouncementCard.fromAnnouncementModel(SingleAnnouncementModel sam) {
    return AnnouncementCard(
      titleText: sam.title,
      messageText: sam.announcement,
      authorText: sam.author,
      timePosted: sam.postTimestamp,
      tags: sam.tags,
    );
  }
}
