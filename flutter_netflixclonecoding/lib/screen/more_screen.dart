import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 50),
            child: CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('images/bbongflix_logo.png'),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              '준희',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white),
            ),
          ),
//          이름밑에 밑줄
          Container(
            padding: EdgeInsets.all(10),
            width: 140,
            height: 5,
            color: Colors.red,
          ),
          Container(
              padding: EdgeInsets.all(10),
//            링크부분은 실행이 안된다 왜그런지 담에 필요하면 알아보도록 하자
              child: Linkify(
                onOpen: (link) async {
                  if (await canLaunch(link.url)) {
                    await launch(link.url);
                  }
                },
                text: 'https://m.youtube.com/channel/UC-TdsOSXDB5A-0uW9oDQQUg',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                linkStyle: TextStyle(color: Colors.white),
              )),
          Container(
            padding: EdgeInsets.all(10),
            child: FlatButton(
              onPressed: () {},
              child: Container(
                color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '프로필 수정하기',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
