// stless
// stateless가 성능이 더 좋음, 일단 만들 것
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/ui/search/search_view_model.dart';
import 'package:provider/provider.dart';

import '../../data/model/photo.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // final viewModel = SearchViewModel();

  // 얘를 TextField의 controller로 사용하면 상태값을 얻을 수 있음
  final textController = TextEditingController();

  // dispose는 화면이 닫힐 때 호출되는 함수
  @override
  void dispose() {
    // 메모리 leak을 방지하기 위해 controller를 꼭 끝내줘야 함
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SearchViewModel>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('이미지 검색'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Search',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () async {
                    // setState(() {
                    //   viewModel.isLoading = true;
                    // });
                    print('확인! ${textController.text}');
                    await viewModel.search(textController.text);
                    // 렌더링 다시
                    // setState(() {
                    //   viewModel.isLoading = false;
                    // });
                  },
                ),
                suffixStyle: const TextStyle(color: Colors.green),
              ),
            ),
            // ListView는 Column이나 Row 안에 들어갔을 때 보이지 않는 이슈가 있음, ListView가 가변형태의 위젯이기 때문
            // 따라서 Expanded 위젯으로 감싸는 방법과 같이 사이즈를 정해주면 됨
            const SizedBox(height: 16),
            // 로딩 화면 만들기
            if (viewModel.isLoading) const CircularProgressIndicator(),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemCount: viewModel.photos.length,
                itemBuilder: (BuildContext context, int index) {
                  final Photo photo = viewModel.photos[index];
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.network(
                      photo.url,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// statefulwidget은 위, 아래의 두개가 한 쌍이고 일반적으로 위는 수정 안하고 아래의 _ private 메소드만 수정함
// statefulwidget은 수정해도 바로 적용(핫리로드)이 안되는데 따라서 아래 Run 탭에서 초록화살표+번개 버튼을 누르면 바로 적용됨
