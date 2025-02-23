import 'package:quiz_app/domain/constant/assets.dart';

class CategoryModel {
  final String name;
  final String image;

  CategoryModel({
    required this.name,
    required this.image,
  });
}

final List categoryList = [
  CategoryModel(name: "AI and Machine Learning", image: Assets.ai),
  CategoryModel(name: "Flutter", image: Assets.flutter),
  CategoryModel(name: "Geography", image: Assets.geography),
  CategoryModel(name: "Nepal History", image: Assets.history),
  CategoryModel(name: "Science", image: Assets.science),
  CategoryModel(name: "Sports", image: Assets.sport),
  CategoryModel(name: "Technology", image: Assets.technology),
  CategoryModel(name: "General Knowledge", image: Assets.gk),
  CategoryModel(name: "Nepal Driving License", image: Assets.nepalDriveL),
  CategoryModel(name: "React", image: Assets.reactJs),


];
