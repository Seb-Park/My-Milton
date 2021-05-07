import 'package:flutter/material.dart';

class ScheduleItem extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Row(
            children: [
              Text("1"),
              Container(
                height: 15,
                width: 15,
                child: Material(color: Colors.grey, shape: CircleBorder()),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 250,
              child: MaterialButton(
                color: Color.fromRGBO(255, 190, 190, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0))),
                onPressed: () {},
                elevation: 0.0,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 25),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Adv. Physics",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("Pedersen PSC201"),
                        Text("8:05 - 8:50")
                      ]),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
