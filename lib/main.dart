import 'package:flutter/material.dart';
import 'package:hello_flutter/ui/search/search_screen.dart';
import 'package:hello_flutter/ui/search/search_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => SearchViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey, // 전체 컬러 색감
      ),
      home: const SearchScreen(),
    );
  }
}

// 단축어 stless
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('밤송이'), // 작은 따옴표가 표준
      ),
      body: SingleChildScrollView(
        // 스크롤 넣어주기
        child: Column(
          children: [
            // network는 생성자
            Image.network(
              'https://pbs.twimg.com/media/FhqaJ-jVsAAgHNr?format=jpg&name=4096x4096',
              width: double.infinity,
              height: 400, // 단위는 출력 대상에 따라 알아서 크기가 변함
              fit: BoxFit.cover, // 사진을 적당히 잘라주는 기능, 이미지 쓰면 국룰
            ),
            // alt + enter로 padding을 넣고 뺄 수 있음
            Padding(
              padding: const EdgeInsets.all(16.0), // all은 사방을 의미
              child: _titleWidget(),
            ),
            _iconsWidget(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                  'adsflskjadsflskjadsflskjadsflskjadsflskjadsflskjadsflskjadsflskjadsflskjadsflskjadsflskjadsflskjadsflskjadsflskjadsflskjadsflskjadsflskjadsflskjadsflskjadsflskjadsflskjadsflskjflskjadsflskjadsflskjadsflskjadsflsflskjadsflskjadsflskjadsflskjadsflsflskjadsflskjadsflskjadsflskjadsflsflskjadsflskjadsflskjadsflskjadsflsflskjadsflskjadsflskjadsflskjadsflsflskjadsflskjadsflskjadsflskjadsflsflskjadsflskjadsflskjadsflskjadsfls'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _titleWidget() {
    return Row(
      children: [
        // 오른쪽으로 밀어내는 위젯
        Expanded(
          child: Column(
            // Column 위젯은 가운데 정렬이 디폴트
            crossAxisAlignment: CrossAxisAlignment.start, // start가 왼쪽 end가 오른쪽
            children: [
              const Text(
                '제목',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10), // padding 대신 사용하기 좋음
              const Text('부제목'),
            ],
          ),
        ),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.amberAccent),
            const Text('41'),
          ],
        ),
      ],
    ); // return 끝에는 세미콜론이 붙음
  }

  Widget _iconsWidget() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              const Icon(Icons.call, color: Colors.blueAccent),
              const Text('CALL', style: TextStyle(color: Colors.blueAccent)),
            ],
          ),
          Column(
            children: [
              const Icon(Icons.call, color: Colors.blueAccent),
              const Text('CALL', style: TextStyle(color: Colors.blueAccent)),
            ],
          ),
          Column(
            children: [
              const Icon(Icons.call, color: Colors.blueAccent),
              const Text('CALL', style: TextStyle(color: Colors.blueAccent)),
            ],
          ),
        ],
      ),
    );
  }
}

// ctrl + alt + l : 리포맷 코드 (기준은 콤마가 있으면 내려감)
// ctrl + space : 가능한 옵션을 보여줌
// flutter는 margin보다 padding을 사용하고 widget의 형태
// main vs cross의 개념이 있는데 row()일 경우 main이 가로, cross가 세로가 되고 column()일 경우 cross가 가로, main이 세로가 됨
// const를 붙이라는 노란줄이 나왔을 때 일단 붙였다가 오류가 날 수 있음, 오류가 나는 이유는 생성자별로 상수만 있으면 const가 붙고
// 그렇지 않으면 const가 없는데(ctrl 누르고 들어가서 확인 가능) 그에 따른 것. 하지만 우리는 알 수 없으니 오류 메세지를 잘 읽고 붙이고 떼자
