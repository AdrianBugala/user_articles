// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/remote_data_sources/remote_data_source.dart' as _i4;
import '../domain/repositories/repository.dart' as _i5;
import '../features/articles/cubit/articles_cubit.dart' as _i6;
import '../features/home/cubit/home_cubit.dart' as _i7;
import 'injection_container.dart' as _i8;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.lazySingleton<_i3.Dio>(
        () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.factory<_i4.RemoteRetrofitDataSource>(
        () => _i4.RemoteRetrofitDataSource(gh<_i3.Dio>()));
    gh.factory<_i5.Repository>(() =>
        _i5.Repository(remoteDataSource: gh<_i4.RemoteRetrofitDataSource>()));
    gh.factory<_i6.ArticlesCubit>(
        () => _i6.ArticlesCubit(articlesRepository: gh<_i5.Repository>()));
    gh.factory<_i7.HomeCubit>(
        () => _i7.HomeCubit(authorsRepository: gh<_i5.Repository>()));
    return this;
  }
}

class _$RegisterModule extends _i8.RegisterModule {}
