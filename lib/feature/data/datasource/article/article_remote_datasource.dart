
import 'package:dio/dio.dart';
import 'package:notee/config/base_url_config.dart';
import 'package:retrofit/retrofit.dart';

import '../../model/article/article_response.dart';

part 'article_remote_datasource.g.dart';

@RestApi(baseUrl: BaseUrlConfig.baseUrlConfig)
abstract class ArticleRemoteDataSource {
  factory ArticleRemoteDataSource(Dio dio, {String baseUrl}) = _ArticleRemoteDataSource;

  @GET('top-headlines')
  Future<ArticleResponse> getTopHeadlineArticles();

  @GET('top-headlines')
  Future<ArticleResponse> getHeadlineBusinessArticles();

  @GET('top-headlines?category={category}')
  Future<ArticleResponse> getArticleCategory(@Path("category") String category);

  
  @GET('everything?q={query}&page={page}')
  Future<ArticleResponse> searchArticles(@Path("query") String query, @Path("page") int page);
}
