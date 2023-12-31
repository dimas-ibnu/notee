import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/article.dart';
import '../repository/article_repository.dart';

class GetHeadlineBusinessArticles {
  final ArticleRepository repository;

  GetHeadlineBusinessArticles(this.repository);

  Future<Either<Failure, List<Article>>> execute() {
    return repository.getHeadlineBusinessArticles();
  }
}
