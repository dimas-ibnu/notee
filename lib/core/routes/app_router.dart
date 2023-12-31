// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notee/feature/domain/entities/article.dart';
import 'package:notee/feature/presentation/pages/article_category_page.dart';
import 'package:notee/feature/presentation/pages/article_webview_page.dart';
import 'package:notee/feature/presentation/pages/detail_page.dart';
import 'package:notee/feature/presentation/pages/main_page.dart';
import 'package:notee/feature/presentation/pages/splash_page.dart';

class AppRouter {
  static const SPLASH = '/';
  static const MAIN = '/main-page';
  static const ARTICLE_CATEGORY = 'article-category-page';
  static const ARTICLE_DETAIL = 'article-detail-page';
  static const ARTICLE_WEBVIEW = 'article-webview-page';
// Route<dynamic>? Function(RouteSettings)? 
  static Route<dynamic> Function(RouteSettings) onGenerateRoute = (settings) {
    switch (settings.name) {
      case SPLASH:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case MAIN:
        return CupertinoPageRoute(builder: (_) => const MainPage());
      case ARTICLE_CATEGORY:
        final category = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => ArticleCategoryPage(category: category),
          settings: settings,
        );
      case ARTICLE_DETAIL:
        final article = settings.arguments as Article;
        return MaterialPageRoute(
          builder: (_) => DetailPage(article: article),
          settings: settings,
        );
      case ARTICLE_WEBVIEW:
        final url = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => ArticleWebviewPage(url: url),
          settings: settings,
        );
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('Page not found :('),
            ),
          );
        });
    }
  };
}
