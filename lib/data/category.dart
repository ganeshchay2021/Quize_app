import 'package:quiz_app/domain/constant/assets.dart';

class Category {
  final String name;
  final String image;

  Category({
    required this.name,
    required this.image,
  });
}

final List categoryList = [
  Category(name: "AI and Machine Learning", image: Assets.ai),
  Category(name: "Flutter", image: Assets.flutter),
  Category(name: "Geography", image: Assets.geography),
  Category(name: "History", image: Assets.history),
  Category(name: "Science", image: Assets.science),
  Category(name: "Sports", image: Assets.sport),
  Category(name: "Technology", image: Assets.technology),
];
