import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/article.dart';
import '../repository/article_repository.dart';

class GetArticleCategory {
  final ArticleRepository repository;

  GetArticleCategory(this.repository);

  Future<Either<Failure, List<Article>>> execute(String category) {
    return repository.getArticleCategory(category);
  }
}
