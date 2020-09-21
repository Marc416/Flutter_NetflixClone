import 'package:flutter/material.dart';
import 'package:flutter_netflixclonecoding/model/model_movie.dart';

class CarouselImage extends StatefulWidget {
  final List<Movie> movies;
  CarouselImage({this.movies});
  @override
  _CarouselImageState createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
//  state로 관리해줄 변수들 선언
  List<Movie> movies;
  List<Movie> images;
  List<Movie> keywords;
  List<Movie> likes;
//  CarouselImage에서 어느 위치에 있는지 index를 저장할 currentPage
  int _currentPage = 0;
  String _currentKeyword;

  @override
  void initState() {
    super.initState();
  //initState에서는 상위클래스인 StatfulWidget에서 가져온 movies를 참조할 수 있도록 값 가져오기
    movies = widget.movies;
    images = movies.map((m) => Image.asset('./images' + m.poster)).toList();
    keywords = movies.map((m) => m.keyword).toList();
    keywords = movies.map((m) => m.like).toList();
    _currentKeyword = keywords[0];

  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
