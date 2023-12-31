import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:notee/core/network/http_ssl_pinning.dart';
import 'package:notee/core/network/network_info.dart';
import 'package:notee/core/util/token_interceptor.dart';
import 'package:notee/feature/data/datasource/article/article_local_datasource.dart';
import 'package:notee/feature/data/datasource/article/article_remote_datasource.dart';
import 'package:notee/feature/data/datasource/db/database_helper.dart';
import 'package:notee/feature/data/repository/article_repository_impl.dart';
import 'package:notee/feature/domain/repository/article_repository.dart';
import 'package:notee/feature/domain/usecase/get_article_category.dart';
import 'package:notee/feature/domain/usecase/get_bookmark_articles.dart';
import 'package:notee/feature/domain/usecase/get_bookmark_status.dart';
import 'package:notee/feature/domain/usecase/get_headline_bussiness_articles.dart';
import 'package:notee/feature/domain/usecase/get_top_headline_articles.dart';
import 'package:notee/feature/domain/usecase/remove_bookmark_article.dart';
import 'package:notee/feature/domain/usecase/save_bookmark_article.dart';
import 'package:notee/feature/domain/usecase/search_articles.dart';
import 'package:notee/feature/presentation/bloc/article_category_bloc/article_category_bloc.dart';
import 'package:notee/feature/presentation/bloc/article_detail_bloc/article_detail_bloc.dart';
import 'package:notee/feature/presentation/bloc/bookmark_article_bloc/bookmark_article_bloc.dart';
import 'package:notee/feature/presentation/bloc/search_article_bloc/search_article_bloc.dart';

import 'feature/presentation/bloc/article_list_bloc/article_list_bloc.dart';

final locator = GetIt.instance;

void init() {
  //dio
  final dio = Dio();
  dio.interceptors.addAll([
    AwesomeDioInterceptor(),
    TokenInterceptor(),
  ]);

  locator.registerSingleton<Dio>(dio);

  //bloc
  locator.registerFactory(
    () => ArticleTopHeadlineListBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => ArticleHeadlineBusinessListBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => ArticleCategoryBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => SearchArticleBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => BookmarkArticleBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => ArticleDetailBloc(
      getBookmarkStatus: locator(),
      saveBookmarkArticle: locator(),
      removeBookmarkArticle: locator(),
    ),
  );

  //usecase
  locator.registerLazySingleton(() => GetTopHeadlineArticles(locator()));
  locator.registerLazySingleton(() => GetHeadlineBusinessArticles(locator()));
  locator.registerLazySingleton(() => GetArticleCategory(locator()));
  locator.registerLazySingleton(() => SearchArticles(locator()));
  locator.registerLazySingleton(() => GetBookmarkArticles(locator()));
  locator.registerLazySingleton(() => GetBookmarkStatus(locator()));
  locator.registerLazySingleton(() => SaveBookmarkArticle(locator()));
  locator.registerLazySingleton(() => RemoveBookmarkArticle(locator()));

  //repository
  locator.registerLazySingleton<ArticleRepository>(
    () => ArticleRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
      networkInfo: locator(),
    ),
  );

  //data source
  locator.registerLazySingleton<ArticleRemoteDataSource>(
    () => ArticleRemoteDataSource(locator<Dio>()),
  );

  locator.registerLazySingleton<ArticleLocalDataSource>(
    () => ArticleLocalDataSourceImpl(databaseHelper: locator()),
  );

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // network info
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator()));

  // external
  locator.registerLazySingleton(() => HttpSSLPinning.client);
  locator.registerLazySingleton(() => DataConnectionChecker());
}
