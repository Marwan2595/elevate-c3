// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/home/api/client/home_api_client.dart' as _i773;
import '../../features/home/api/datasources_impl/home_local_datasource_impl.dart'
    as _i187;
import '../../features/home/api/datasources_impl/home_remote_datasource_impl.dart'
    as _i150;
import '../../features/home/data/datasources/home_local_datasource.dart'
    as _i314;
import '../../features/home/data/datasources/home_remote_datasource.dart'
    as _i278;
import '../../features/home/data/repos_impl/home_repo_impl.dart' as _i386;
import '../../features/home/domain/repos/home_repo.dart' as _i130;
import '../../features/home/domain/usecases/get_categories_usecase.dart'
    as _i967;
import '../../features/home/domain/usecases/get_products_usecase.dart' as _i677;
import '../../features/home/presentation/view_models/home_view_model.dart'
    as _i153;
import '../dio_module/dio_module.dart' as _i773;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.factory<_i314.HomeLocalDataSource>(
      () => _i187.HomeLocalDataSourceImpl(),
    );
    gh.factory<_i773.HomeApiClient>(() => _i773.HomeApiClient(gh<_i361.Dio>()));
    gh.factory<_i278.HomeRemoteDataSource>(
      () => _i150.HomeRemoteDataSourceImpl(gh<_i773.HomeApiClient>()),
    );
    gh.factory<_i130.HomeRepoContract>(
      () => _i386.HomeRepoImpl(
        gh<_i314.HomeLocalDataSource>(),
        gh<_i278.HomeRemoteDataSource>(),
      ),
    );
    gh.factory<_i967.GetCategoriesUseCase>(
      () => _i967.GetCategoriesUseCase(gh<_i130.HomeRepoContract>()),
    );
    gh.factory<_i677.GetProductsUseCase>(
      () => _i677.GetProductsUseCase(gh<_i130.HomeRepoContract>()),
    );
    gh.factory<_i153.HomeViewModel>(
      () => _i153.HomeViewModel(
        gh<_i967.GetCategoriesUseCase>(),
        gh<_i677.GetProductsUseCase>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i773.DioModule {}
