import 'package:cadr/models/categoriesOfNews.dart';
import 'package:flutter/foundation.dart';

class Utils {
  static List<CategoriesOfNews> getMockedCategories() {
    return [
      CategoriesOfNews(
        imageName: "trend",
        name: "TREND",
        categoryName: "Trend",
          subCategories: []
      ),

      CategoriesOfNews(
        imageName: "action",
        name: "ACTION",
        categoryName: "Action",
          subCategories: []
      ),

      CategoriesOfNews(
        imageName: "research",
        name: "RESEARCH",
        categoryName: "research",
          subCategories: []
      ),
      CategoriesOfNews(
        imageName: "support",
        name: "SUPPORT",
        categoryName: "Support",
          subCategories: []
      ),
      CategoriesOfNews(
        imageName: "head",
        name: "LATEST",
        categoryName: "Latest",
          subCategories: []
      )
    ];
  }

}