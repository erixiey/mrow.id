import 'package:get/get.dart';
import '../screens/article_screen.dart';

class ArticleController extends GetxController {
  void navigateToArticle(String imagePath, String title) {
    Get.to(
      () => ArticleScreen(imagePath: imagePath, title: title),
      transition: Transition.rightToLeft, 
      duration: const Duration(milliseconds: 300),
    );
  }
}