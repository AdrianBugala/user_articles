import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:user_articles/data/remote_data_sources/remote_data_source.dart';
import 'package:user_articles/domain/repositories/repository.dart';
import 'package:user_articles/features/articles/cubit/articles_cubit.dart';
import 'package:user_articles/features/home/cubit/home_cubit.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  // Bloc
  getIt.registerFactory(() => HomeCubit(authorsRepository: getIt()));
  getIt.registerFactory(() => ArticlesCubit(articlesRepository: getIt()));

  // Repositories
  getIt.registerFactory(() => Repository(remoteDataSource: getIt()));

  // Data Sources
  getIt.registerFactory(() => RemoteRetrofitDataSource(Dio()));
}
