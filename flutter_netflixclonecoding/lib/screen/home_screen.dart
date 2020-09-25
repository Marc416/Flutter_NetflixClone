import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflixclonecoding/model/model_movie.dart';
import 'package:flutter_netflixclonecoding/widget/box_slider.dart';
import 'package:flutter_netflixclonecoding/widget/carousel_slider.dart';
import 'package:flutter_netflixclonecoding/widget/circle_slider.dart';
//영화의 데이터를 백엔드에서 가져와야하기 때문에 홈은 스테풀 위젯으로만든다

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot> streamData;

  .
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//  여기서의 movie 는 firebase에서 작성한 테이블 명
    streamData = firestore.collection('movie').snapshots();
  }

  Widget _fetchData(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('movie').snapshots(),
      builder: (context, snapshot) {
//      데이터를 못가져오면 리니어 인디케이터 쭉 올라오는 그림 작동 데이터 가져오면 빌드 위젯 실행
        if (!snapshot.hasData)
          return LinearProgressIndicator();
        return _buildBody(context, snapshot.data.docs);
      },
    );
  }

// 이 위젯이 실행되면 앞서 우리가 만들어서 다루었던 더미데이터의 것들과 동일한 데이터가 됌
  Widget _buildBody(BuildContext context, List<DocumentSnapshot> snapshot) {
    List<Movie> movies = snapshot.map((d) => Movie.fromSnapshot(d)).toList();
    return ListView(children: <Widget>[
      Stack(
        children: <Widget>[
          CarouselImage(
            movies: movies,
          ),
          TopBar()
        ],
      ),
      CircleSlider(movies: movies),
      BoxSlider(movies: movies)
    ],);
  }

  @override
  Widget build(BuildContext context) {
    return _fetchData(context);
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            'images/bbongflix_logo.png',
            fit: BoxFit.contain,
            height: 25,
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              'TV프로그램',
              style: TextStyle(fontSize: 14,),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              '영화',
              style: TextStyle(fontSize: 14,),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              '내가찜한 컨텐츠',
              style: TextStyle(fontSize: 14,),
            ),
          ),
        ],
      ),
    );
  }
}




