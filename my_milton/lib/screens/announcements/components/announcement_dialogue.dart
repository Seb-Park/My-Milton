import 'package:flutter/material.dart';
import 'package:my_milton/values/constants.dart';

class AnnouncementDetailPopup extends StatefulWidget {
  const AnnouncementDetailPopup(
      {Key key, this.title, this.author, this.content, this.time})
      : super(key: key);

  final String title;
  final String author;
  final String content;
  final DateTime time;

  @override
  _AnnouncementDetailPopupState createState() =>
      _AnnouncementDetailPopupState();
}

class _AnnouncementDetailPopupState extends State<AnnouncementDetailPopup> {
  double dialogHeight = periodPopupStartHeight;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
  }

  void _afterLayout(_) {
    setState(() {
      dialogHeight = MediaQuery.of(context).size.height / 2;// this will collapse the close button but will lead to smoother animation.
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      content: AnimatedContainer(
        curve: Curves.easeInOutQuart,
        constraints: BoxConstraints(maxHeight: dialogHeight),
        duration: animatedPopupAnimationDuration,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                child: Text(
                  widget.title,
                  overflow: TextOverflow.ellipsis,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text(widget.author, style: TextStyle(fontSize: 20)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.time.toString()),
              ),
              Container(
                child: Container(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height / 3),
                  width: double.infinity,
                  color: const Color(0xfff0f0f0),
                  child: SingleChildScrollView(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.content),
                  )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60)),
                elevation: 0,
                color: Colors.blue,
                child: Text("Close", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
