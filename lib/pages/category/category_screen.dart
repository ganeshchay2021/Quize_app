import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/data/category.dart';
import 'package:quiz_app/domain/constant/ui_helper.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final List<Color> colors = [
    Colors.grey,
    Colors.blue,
    Colors.pink,
    Colors.amber,
    Colors.orange,
    Colors.deepPurple,
    Colors.green,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
        child: GridView.builder(
          padding: EdgeInsets.zero,
          itemCount: categoryList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.95,
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                // Navigator.push(context, CupertinoPageRoute(builder:(context) => ,))
              },
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3,
                            spreadRadius: 1,
                            color: Colors.grey.shade400,
                          )
                        ],
                        borderRadius: BorderRadius.circular(
                          18,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: UiHelper.assetsImage(
                          height: 150,
                          image: categoryList[index].image,
                          boxFit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(18),
                                bottomRight: Radius.circular(18)),
                            color: colors[index]),
                        alignment: Alignment.center,
                        height: 50,
                        child: UiHelper.customText(
                          textAlign: TextAlign.center,
                          height: 1.1,
                          color: Colors.white,
                          text: categoryList[index].name,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    ));
  }
}
