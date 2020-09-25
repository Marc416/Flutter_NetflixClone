import 'package:flutter/material.dart';
import 'package:flutter_netflixclonecoding/model/model_movie.dart';
import 'package:flutter_netflixclonecoding/screen/detail_screen.dart';

class CircleSlider extends StatelessWidget {
//  홈에서 무비를 가져오는 방법
  final List<Movie> movies;

  //서클슬라이드 초기화->이거 뭔지 잘 모르겠다능...
  CircleSlider({this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('미리보기'),
          Container(
            height: 120,
            child: ListView(
//              좌우로 스크롤 가능하게 하기
              scrollDirection: Axis.horizontal,
              children: makeCircleImages(context, movies),
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> makeCircleImages(BuildContext context, List<Movie> movies) {
  List<Widget> results = [];
  for (var i = 0; i < movies.length; i++) {
    results.add(
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute<Null>(
                fullscreenDialog: true,
                builder: (BuildContext context) {
                  return DetailScreen(
                    movie: movies[i],
                  );
                }));
          },
          child: Container(
            padding: EdgeInsets.only(right: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: CircleAvatar(
                backgroundImage: AssetImage('images/' + movies[i].poster),
                radius: 48,
              ),
            ),
          ),
        ));
  }
  return results;
}
