class Photo {
  // java의 getter, setter가 다 기본적으로 적용된 상태, 밖에서 접근이 되지 않게 하려면 private 형태인 _를 붙여줘야 함
  String url;

  // String? description;
  String description;

  // alt + insert, 혹은 우클릭 - Generate - Constructor
  // 필수로 사용해야 하는 매개변수는 중괄호로 묶고 required를 붙임
  // {}는 named parameter라는 개념인데 `매개변수의 이름: 값`형식으로 사용하는 것
  // {}를 빼면 메소드(값, 값...)형식으로 사용하는데 가독성이 떨어짐!

  // Photo({required this.url, this.description});
  Photo({
    required this.url,
    required this.description,
  });
}
