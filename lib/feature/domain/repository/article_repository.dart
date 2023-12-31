import 'package:dartz/dartz.dart';
import 'package:notee/core/error/failure.dart';

import '../entities/article.dart';
import '../entities/articles.dart';

abstract class ArticleRepository {

  Future<Either<Failure, List<Article>>> getTopHeadlineArticles();
  Future<Either<Failure, List<Article>>> getHeadlineBusinessArticles();
  Future<Either<Failure, List<Article>>> getArticleCategory(String category);
  Future<Either<Failure, Articles>> searchArticles(String query, {int page = 1});
  Future<Either<Failure, String>> saveBookmarkArticle(Article article);
  Future<Either<Failure, String>> removeBookmarkArticle(Article article);
  Future<bool> isAddedToBookmarkArticle(String url);
  Future<Either<Failure, List<Article>>> getBookmarkArticles();

}
