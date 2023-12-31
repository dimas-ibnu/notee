import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notee/dependency_injection.dart' as di;
import 'package:notee/feature/presentation/bloc/article_category_bloc/article_category_bloc.dart';
import 'package:notee/feature/presentation/bloc/article_detail_bloc/article_detail_bloc.dart';
import 'package:notee/feature/presentation/bloc/bookmark_article_bloc/bookmark_article_bloc.dart';
import 'package:notee/feature/presentation/bloc/search_article_bloc/search_article_bloc.dart';
import '../../feature/presentation/bloc/article_list_bloc/article_list_bloc.dart';

class AppPages {
  static final providers = [
    BlocProvider(
      create: (_) => di.locator<ArticleTopHeadlineListBloc>(),
    ),
    BlocProvider(
      create: (_) => di.locator<ArticleHeadlineBusinessListBloc>(),
    ),
    BlocProvider(
      create: (_) => di.locator<ArticleCategoryBloc>(),
    ),
    BlocProvider(
      create: (_) => di.locator<SearchArticleBloc>(),
    ),
    BlocProvider(
      create: (_) => di.locator<BookmarkArticleBloc>(),
    ),
    BlocProvider(
      create: (_) => di.locator<ArticleDetailBloc>(),
    ),
  ];
}
