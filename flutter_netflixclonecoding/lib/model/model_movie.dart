//Movie클래스를 만든 이유는 영화데이터 관리를 쉽게 하기 위함

class Movie {
//  파이널은 초기 값을 지정하는 함수같은게 있어줘야함
  final String title;
  final String keyword;
  final String poster;
  final bool like;

  Movie.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        keyword = map['keyword'],
        poster = map['poster'],
        //맵핑으로 초기값 잡아주고 마지막은 세미콜론!!!!
        like = map['like'];

  //  toString오버라이딩
  @override
  String toString() {
    return 'Movie<$title:$keyword>';
  }
}
