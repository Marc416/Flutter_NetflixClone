import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_netflixclonecoding/model/model_movie.dart';

class DetailScreen extends StatefulWidget {
  final Movie movie;

  DetailScreen({this.movie});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool like = false;

  @override
  void initState() {
    super.initState();
    like = widget.movie.like;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
//                Body
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/' + widget.movie.poster),
                          fit: BoxFit.cover),
                    ),
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black.withOpacity(0.1),
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 45, 0, 10),
                                  child: Image.asset(
                                      'images/' + widget.movie.poster),
                                  height: 300,
                                ),
                                Container(
                                  padding: EdgeInsets.all(7),
                                  child: Text(
                                    '99%일치 2019 15 + 시즌 1개',
                                    style: TextStyle(fontSize: 13),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
//                              영화 타이틀컨테이너
                                Container(
                                  padding: EdgeInsets.all(7),
                                  child: Text(
//                                   바로 아래 타이틀 이게 글자를 대신 불러오는 거구만
                                    widget.movie.title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
//                              재생버튼
                                Container(
                                  padding: EdgeInsets.all(3),
                                  child: FlatButton(
                                    onPressed: () {},
                                    color: Colors.red,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(Icons.play_arrow),
                                        Text('재생')
                                      ],
                                    ),
                                  ),
                                ),
//                              영화 설명
                                Container(
                                  padding: EdgeInsets.all(5),
                                  child: Text(widget.movie.toString()),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    '출연: 현빈, 손예진, 서지혜 \n제작자: 이정효, 박지은',
                                    style: TextStyle(
                                        color: Colors.white60, fontSize: 12),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
//                Appbar생성(닫기)=>, 팝업 다이얼로그에 기본으로 적용되어 있어서 따로 기능 선언 없이 쓸 수 있음.
                  Positioned(
                    child: AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                  )
                ],
              ),
              makeMenuButton(like),
            ],
          ),
        ),
      ),
    );
  }
}

Widget makeMenuButton(bool like) {
  return Container(
    color: Colors.black26,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
//      내가 찜한 컨텐츠 버튼
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: InkWell(
            onTap: () {},
            child: Column(
              children: <Widget>[
                like ? Icon(Icons.check) : Icon(Icons.add),
                Padding(padding: EdgeInsets.all(5)),
                Text(
                  '내가 찜한 컨텐츠',
                  style: TextStyle(fontSize: 11, color: Colors.white60),
                )
              ],
            ),
          ),
        ),
//      평가버튼
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Container(
            child: Column(
              children: <Widget>[
                Icon(Icons.thumb_up),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                Text(
                  '평가',
                  style: TextStyle(fontSize: 11, color: Colors.white60),
                )
              ],
            ),
          ),
        ),
//      공유버튼
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Container(
            child: Column(
              children: <Widget>[
                Icon(Icons.send),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                Text(
                  '공유',
                  style: TextStyle(fontSize: 11, color: Colors.white60),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}
