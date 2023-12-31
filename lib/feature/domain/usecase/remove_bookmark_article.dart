import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/article.dart';
import '../repository/article_repository.dart';

class RemoveBookmarkArticle {
  final ArticleRepository repository;

  RemoveBookmarkArticle(this.repository);

  Future<Either<Failure, String>> execute(Article article) {
    return repository.removeBookmarkArticle(article);
  }
}
