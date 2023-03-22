import 'package:user_articles/data/remote_data_sources/remote_data_source.dart';
import 'package:user_articles/domain/models/article_model.dart';
import 'package:user_articles/domain/models/author_model.dart';

class Repository {
  Repository({required this.remoteDataSource});

  final RemoteRetrofitDataSource remoteDataSource;

  Future<List<ArticleModel>> getArticlesForAuthorId(int authorId) async {
    final allArticles = await remoteDataSource.getArticles();
    return allArticles
        .where((articles) => articles.authorId == authorId)
        .toList();
  }

  Future<List<AuthorModel>> getAuthorModels() async {
    return remoteDataSource.getAuthors();
  }
}
