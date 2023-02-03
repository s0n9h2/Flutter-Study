import 'dart:convert';

import 'package:hello_flutter/data/dto/photo_result.dart';
import 'package:hello_flutter/data/model/photo.dart';
import 'package:http/http.dart' as http;

class PhotoRepository {
  // 데이터
  // List<Photo> photos = [
  // 상수임을 티내기 위해 final 사용, 변수는 타입 추론이 돼서 var을 써도 되지만 가독성을 위해 정확히 써주는 게 좋음
  // final List<Photo> photos = [
  //   Photo(
  //     url:
  //     ('https://pbs.twimg.com/media/FhqaJ-jVsAAgHNr?format=jpg&name=4096x4096'),
  //     description: '아이유',
  //   ),
  //   Photo(
  //     url:
  //     ('https://pbs.twimg.com/profile_images/1374979417915547648/vKspl9Et_400x400.jpg'),
  //     description: '아이유',
  //   ),
  //   Photo(
  //     url:
  //     ('https://image.jtbcplus.kr/data/contents/jam_photo/202301/27/5175354d-d3ee-468e-8210-b5be0ac384b9.jpg'),
  //     description: '아이유',
  //   ),
  //   Photo(
  //     url:
  //     ('https://pbs.twimg.com/media/FhqaJ-jVsAAgHNr?format=jpg&name=4096x4096'),
  //     description: '아이유',
  //   ),
  //   Photo(
  //     url:
  //     ('https://pbs.twimg.com/profile_images/1374979417915547648/vKspl9Et_400x400.jpg'),
  //     description: '아이유',
  //   ),
  //   Photo(
  //     url:
  //     ('https://image.jtbcplus.kr/data/contents/jam_photo/202301/27/5175354d-d3ee-468e-8210-b5be0ac384b9.jpg'),
  //     description: '아이유',
  //   ),
  // ];

  // Future와 async는 세트로 사용하며 비동기 함수를 만들어주는 것
  Future<List<Photo>> getPhotos(String query) async {
    // await Future.delayed(Duration(seconds: 2));
    // return photos;
    final http.Response response = await http.get(Uri.parse(
        'https://pixabay.com/api/?key=10711147-dc41758b93b263957026bdadb&q=$query&image_type=photo&pretty=true'));

    if (response.statusCode == 200) {
      final dynamic json = jsonDecode(response.body);
      final photoResult = PhotoResult.fromJson(json);

      if (photoResult.hits == null) {
        return [];
      } else {
        return photoResult.hits!
            .where((e) => e.webformatURL != null)
            .map((e) => Photo(url: e.webformatURL!, description: e.tags ?? ''))
            .toList();
      }
    } else {
      throw Exception('die: ${response.statusCode}');
    }
  }
}
