import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/article.dart';
import '../repository/article_repository.dart';

class GetBookmarkArticles {
  final ArticleRepository _repository;

  GetBookmarkArticles(this._repository);

  Future<Either<Failure, List<Article>>> execute() {
    return _repository.getBookmarkArticles();
  }
}
