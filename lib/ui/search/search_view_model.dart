// 화면 하나당 view 모델 하나가 국룰, 이렇게 해야 분리가 잘 된 것
import 'package:flutter/material.dart';
import 'package:hello_flutter/data/model/photo.dart';
import 'package:hello_flutter/data/repository/photo_repository.dart';

// 함수 사용시 잘 모르면 무조건 material.dart를 선택하기
class SearchViewModel extends ChangeNotifier {
  // view쪽에서 PhotoRepository를 통해 데이터를 가져오지만 _photoRepository를 직접 조작하면 안 됨
  final _photoRepository = PhotoRepository();

  List<Photo> photos = [];
  // 상태는 다 view model 파일에 작성
  bool isLoading = false;

  // 아래와 같은 callback 형식을 많이 쓰는 건 좋은 건 아님 (콜백지옥)
  // void search(String query) {
  //   _photoRepository.getPhotos(query)
  //       .then((result) => photos = result);
  // }

  // 대신 아래와 같이 async를 사용해서 비동기 함수로 만들어주는 게 좋음
  Future<void> search(String query) async {
    isLoading = true;
    notifyListeners();

    photos = await _photoRepository.getPhotos(query);

    isLoading = false;
    notifyListeners();
  }
}