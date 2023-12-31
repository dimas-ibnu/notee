import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/articles.dart';
import '../repository/article_repository.dart';

class SearchArticles {
  final ArticleRepository repository;

  SearchArticles(this.repository);

  Future<Either<Failure, Articles>> execute(String query, {int page = 1}) {
    return repository.searchArticles(query, page: page);
  }
}