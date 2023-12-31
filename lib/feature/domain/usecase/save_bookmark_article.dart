import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/article.dart';
import '../repository/article_repository.dart';

class SaveBookmarkArticle {
  final ArticleRepository repository;

  SaveBookmarkArticle(this.repository);

  Future<Either<Failure, String>> execute(Article article) {
    return repository.saveBookmarkArticle(article);
  }
}
