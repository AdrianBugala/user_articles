import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:user_articles/domain/models/article_model.dart';
import 'package:user_articles/domain/models/author_model.dart';

part 'remote_data_source.g.dart';

@RestApi(baseUrl: "https://my-json-server.typicode.com/adamsmaka/json-demo/")
abstract class RemoteRetrofitDataSource {
  factory RemoteRetrofitDataSource(Dio dio, {String baseUrl}) =
      _RemoteRetrofitDataSource;

  @GET("/articles")
  Future<List<ArticleModel>> getArticles();

  @GET("/users")
  Future<List<AuthorModel>> getAuthors();
}
