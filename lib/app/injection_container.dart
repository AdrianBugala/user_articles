import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:user_articles/data/remote_data_sources/articles_remote_data_source.dart';
import 'package:user_articles/data/remote_data_sources/authors_remote_data_source.dart';
import 'package:user_articles/domain/repositories/articles_repository.dart';
import 'package:user_articles/domain/repositories/authors_repository.dart';
import 'package:user_articles/features/articles/cubit/articles_cubit.dart';
import 'package:user_articles/features/home/cubit/home_cubit.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  // Bloc
  getIt.registerFactory(() => HomeCubit(authorsRepository: getIt()));
  getIt.registerFactory(() => ArticlesCubit(articlesRepository: getIt()));

  // Repositories
  getIt.registerFactory(() => AuthorsRepository(remoteDataSource: getIt()));
  getIt.registerFactory(() => ArticlesRepository(remoteDataSource: getIt()));

  // Data Sources
  getIt.registerFactory(() => AuthorsRemoteRetrofitDataSource(Dio()));
  getIt.registerFactory(() => ArticlesRemoteRetrofitDataSource(Dio()));
}
