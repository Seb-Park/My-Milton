import 'package:flutter/material.dart';

class CreateAnnouncementDialogue extends StatefulWidget {
  CreateAnnouncementDialogue({Key key}) : super(key: key);

  @override
  _CreateAnnouncementDialogueState createState() =>
      _CreateAnnouncementDialogueState();
}

class _CreateAnnouncementDialogueState
    extends State<CreateAnnouncementDialogue> {
  final TextEditingController titleController = new TextEditingController();
  final TextEditingController contentController = new TextEditingController();
  String dialogueTitle = "New Post";

  @override
  void initState() {
    titleController.addListener(() {
      if (titleController.text != "") {
        setState(() {
          dialogueTitle = titleController.text;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      content: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(dialogueTitle,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: "Title",
                  ),
                ),
                TextFormField(
                    controller: contentController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "Message",
                    )),
                MaterialButton(
                  elevation: 0,
                  color: Colors.blue,
                  child: Text("Post", style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    if (titleController.text != null &&
                        titleController.text.length > 0) {
                      sendPost(titleController.text, contentController.text);
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future sendPost(String title, String content) async {
    print(title + " " + content);
  }
}
