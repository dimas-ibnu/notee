import 'package:equatable/equatable.dart';

import 'article.dart';

class Articles extends Equatable {
    final String? status;
    final int? totalResults;
    final List<Article>? articles;

    const Articles({
      this.status,
      this.totalResults,
      this.articles,
    });

    @override
    List<Object?> get props => [
      status,
      totalResults,
      articles,
    ];
}