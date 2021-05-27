import 'package:flutter/material.dart';
import 'package:my_milton/values/constants.dart';

import 'package:my_milton/screens/home.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {
                    return HomeWrapper();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Login with Google"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        ClipPath(
          clipper: LoginPageSecondaryWaveClipper(extremity: 20),
          child: Container(
            height: MediaQuery.of(context).size.height / 2 + 10,
            decoration: BoxDecoration(gradient: dramaticBrightOrangeGradient),
          ),
        ),
        ClipPath(
          clipper: LoginPageWaveClipper(extremity: 30),
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(gradient: loginScreenGradient),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(text: "my", style: myMiltonTextStyle),
                    TextSpan(
                        text: "Milton",
                        style: myMiltonTextStyle.copyWith(
                            color: miltonTitleOrange)),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class LoginPageWaveClipper extends CustomClipper<Path> {
  final double extremity;

  LoginPageWaveClipper({this.extremity = 30});

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - extremity);
    path.quadraticBezierTo(size.width / 4, size.height + extremity,
        size.width / 2, size.height - extremity);
    path.quadraticBezierTo(size.width * 3 / 4, size.height - extremity * 3,
        size.width, size.height - extremity);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class LoginPageSecondaryWaveClipper extends CustomClipper<Path> {
  final double extremity;

  LoginPageSecondaryWaveClipper({this.extremity = 30});

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - extremity);
    path.quadraticBezierTo(size.width / 4, size.height + extremity,
        size.width / 2, size.height - extremity);
    path.quadraticBezierTo(size.width * 3 / 4, size.height - extremity * 3,
        size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
