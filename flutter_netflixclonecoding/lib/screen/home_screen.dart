import 'package:flutter/material.dart';
import 'package:flutter_netflixclonecoding/model/model_movie.dart';
//영화의 데이터를 백엔드에서 가져와야하기 때문에 홈은 스테풀 위젯으로만든다

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {
//  영화리스트 가져오기
// set이 아닌 리스트로 만드는 이유는 파이어베이스 연동시 그걸 그대로 쓰기 위함.
  List<Movie> movies =[
    Movie.fromMap(
        {
          'title':'사랑의 불시착',
          'keyword':'사랑/로맨스/판타지',
          'poster':'test_movie_1.png',
          'like': false
        }
    )
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return TopBar();
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 70, 20, 7),
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

