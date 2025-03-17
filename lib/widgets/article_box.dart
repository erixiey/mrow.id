import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/typography/typography.dart';
import '../controllers/article_controller.dart';

class ArticleBox extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const ArticleBox({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final ArticleController controller = Get.put(ArticleController());

    return GestureDetector(
      onTap: () {
        controller.navigateToArticle(imagePath, title);
      },
      child: Container(
        height: 75,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Image.asset(
                    imagePath,
                    width: 60,
                    height: 60,
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Font.semiBold.fs12.black2b(),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          description,
                          style: Font.medium.fs10.gray94(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 1,
              color: const Color(0xFFD9D9D9),
              margin: const EdgeInsets.symmetric(horizontal: 0),
            ),
          ],
        ),
      ),
    );
  }
}