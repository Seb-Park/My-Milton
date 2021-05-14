import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_milton/blocs/schedule/schedule_bloc.dart';
import 'package:my_milton/blocs/schedule/schedule_repository.dart';
import 'package:my_milton/screens/schedule/schedule.dart';
import 'package:my_milton/values/constants.dart';

class HomeWrapper extends StatefulWidget {
  HomeWrapper({Key key}) : super(key: key);

  @override
  _HomeWrapperState createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: paleBlue, width: 15))),
        child: CurvedNavigationBar(
          backgroundColor: paleBlue,
          color: navBarColor,
          items: <Widget>[
            Icon(Icons.calendar_today, size: 30, color: navButtonColor,),
            Icon(Icons.chat_bubble_outline, size: 30, color: navButtonColor,),
            Icon(Icons.list, size: 30, color: navButtonColor,),
          ],
          onTap: (index) {
            //Handle button tap
          },
        ),
      ),
      body: BlocProvider(
        create: (BuildContext context) => ScheduleBloc(ScheduleRepo()),
        child: Schedule()),
    );
  }
}