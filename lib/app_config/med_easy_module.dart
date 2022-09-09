import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/data/datasource/remote_datasouce/stock_chart_remote_data_source_implentation.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/data/repositories/stock_chart_repository_implentation.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/domain/use_cases/get_stock_info.dart';
import 'package:med_easy_answer/utilities/constants/constanst.dart';
import 'package:med_easy_answer/utilities/network/network_info.dart';
import 'package:yahoofin/yahoofin.dart';

final GetIt locator = GetIt.instance;

GetIt get moduleLocator => locator;

Future<void> setUpModules() async {
  _setUpUseCases();
  _setupRemoteDataSources();
  _setupRepositories();
  _setUpCore();
}

Future<void> _setUpUseCases() async{
  locator.registerLazySingleton(() => GetStockInfo(locator<StockChartRepositoryImplementation>()));

}

Future<void> _setUpCore() async{
locator.registerLazySingleton(() => NetworkInfoImplementation(locator<InternetConnectionChecker>()));
locator.registerLazySingleton(() => InternetConnectionChecker());
}

Future<void> _setupRepositories() async {
locator.registerLazySingleton(() => StockChartRepositoryImplementation(
    stockChartRemoteDataSourceImplementation: locator<StockChartRemoteDataSourceImplementation>(),
    networkInfo: locator<NetworkInfoImplementation>()) );
}

Future<void> _setupRemoteDataSources() async {
  locator.registerLazySingleton(() => StockChartRemoteDataSourceImplementation(locator<Dio>(), Constants.url));
  locator.registerLazySingleton(() => Dio());

}

