import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

class Dev extends StatefulWidget {
  @override
  _DevState createState() => _DevState();
}

class _DevState extends State<Dev> {

  List social = [];

  @override
  void initState() {
    super.initState();
    social = [
      {
        'URL': 'https://github.com/himanshusharma89',
        'iconURL': 'assets/github.png'
      },
      {
        'URL': 'https://twitter.com/_SharmaHimanshu',
        'iconURL': 'assets/twitter.png'
      },
      {
        'URL': 'https://www.linkedin.com/in/himanshusharma89/',
        'iconURL': 'assets/linkedin.png'
      },
      {
        'URL': 'https://stackoverflow.com/users/11545939/himanshu-sharma',
        'iconURL': 'assets/stack-overflow.png'
      },
      {
        'URL': 'https://codepen.io/himanshusharma89',
        'iconURL': 'assets/codepen.png'
      },
      {
        'URL': 'https://medium.com/@rageremix',
        'iconURL': 'assets/medium.png'
      },
    ];
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
          height: height*0.7,
          width: width*0.85,
          color: const Color(0xffe9c14a),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FittedBox(
                  child: Text(
                    "Hello, I'm Himanshu",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                SizedBox(height: 20),
                FittedBox(
                  child: Text(
                    "Flutter Dev | Open-Source Contributor | MLSA | Writer",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.normal
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  height: height*0.06,
                  width: width*0.7,
                  child: FittedBox(
                    child: Row(
                      children: social.map((e) => 
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 100),
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: ()=> launchURL(e['URL']),
                              child: Image.asset(e['iconURL']),
                            ),
                          ),
                        )
                      ).toList(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}