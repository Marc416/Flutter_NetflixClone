//Movie클래스를 만든 이유는 영화데이터 관리를 쉽게 하기 위함

import 'package:cloud_firestore/cloud_firestore.dart';

class Movie {
//  파이널은 초기 값을 지정하는 함수같은게 있어줘야함
  final String title;
  final String keyword;
  final String poster;
  final bool like;
//  해당 데이터 컬럼을 참조할 수 있는 링크라고 볼 수 있다.
//  이걸통해서 CRUD기능을 간단하게 할 수 있다
  final DocumentReference reference;

  Movie.fromMap(Map<String, dynamic> map, {this.reference})
      : title = map['title'],
        keyword = map['keyword'],
        poster = map['poster'],
        //맵핑으로 초기값 잡아주고 마지막은 세미콜론!!!!
        like = map['like'];

  Movie.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  //  toString오버라이딩
  @override
  String toString() {
    return 'Movie<$title:$keyword>';
  }
}
