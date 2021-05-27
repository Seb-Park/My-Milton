import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_milton/blocs/announcements/announcement_bloc.dart';
import 'package:my_milton/blocs/announcements/announcement_events.dart';
import 'package:my_milton/blocs/announcements/announcement_states.dart';
import 'package:my_milton/screens/announcements/components/announcement_card.dart';
import 'package:my_milton/screens/announcements/components/announcements_top_bar.dart';
import 'package:my_milton/screens/announcements/components/create_announcement_dialogue.dart';
import 'package:my_milton/values/constants.dart';

class AnnouncementPage extends StatefulWidget {
  AnnouncementPage({Key key}) : super(key: key);

  @override
  _AnnouncementPageState createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> {
  @override
  void initState() {
    final scheduleBloc = BlocProvider.of<AnnouncementsBloc>(context);

    scheduleBloc.add(FetchAnnouncements());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<AnnouncementsBloc, AnnouncementsState>(
            builder: (context, state) {
          if (state is AnnouncementsNotCalled) {
            return Container();
          } else if (state is AnnouncementsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AnnouncementsLoaded) {
            return ListView.builder(
              itemCount: state.loadedAnnouncements.announcements.length + 1,
              itemBuilder: (context, index) {
                if (index != 0) {
                  return AnnouncementCard.fromAnnouncementModel(
                      state.loadedAnnouncements.announcements[index - 1]);
                }
                return SizedBox(
                  height: announcementTopBarHeight,
                );
              },
            );
          }
          return Center(child: Text(announcementsErrorMessage));
        }),
        AnnouncementsTopBar(),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(floatingActionButtonSpacing),
            child: FloatingActionButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return CreateAnnouncementDialogue();
                    });
              },
              child: Container(
                width: 60,
                height: 60,
                child: Icon(
                  Icons.chat_bubble,
                  size: 30,
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, gradient: mainBrightOrangeGradient),
              ),
            ),
          ),
        )
      ],
    );
  }
}
