import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:user_articles/domain/models/article_model.dart';
import 'package:user_articles/domain/models/author_model.dart';

part 'remote_data_source.g.dart';

@injectable
@RestApi()
abstract class RemoteRetrofitDataSource {
  @factoryMethod
  factory RemoteRetrofitDataSource(Dio dio) = _RemoteRetrofitDataSource;

  @GET("/articles")
  Future<List<ArticleModel>> getArticles();

  @GET("/users")
  Future<List<AuthorModel>> getAuthors();
}
