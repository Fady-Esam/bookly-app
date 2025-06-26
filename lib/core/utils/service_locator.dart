import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:new_bookly_app/Features/home/data/data_sources/home_remote_data_source_impl.dart';
import 'package:new_bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:new_bookly_app/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:new_bookly_app/core/utils/api_service.dart';

import '../../Features/home/data/data_sources/home_local_data_source_impl.dart';
import '../../Features/home/domain/use_cases/fetch_newest_books_use_case.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
  getIt.registerSingleton<HomeRemoteDataSourceImpl>(
      HomeRemoteDataSourceImpl(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<HomeLocalDataSourceImpl>(HomeLocalDataSourceImpl());
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
      homeRemoteDataSource: getIt.get<HomeRemoteDataSourceImpl>(),
      homeLocalDataSource: getIt.get<HomeLocalDataSourceImpl>()));

  getIt.registerSingleton<FetchFeaturedBooksUseCase>(
      FetchFeaturedBooksUseCase(homeRepo: getIt.get<HomeRepoImpl>()));

  getIt.registerSingleton<FetchNewestdBooksUseCase>(
      FetchNewestdBooksUseCase(homeRepo: getIt.get<HomeRepoImpl>()));


}
