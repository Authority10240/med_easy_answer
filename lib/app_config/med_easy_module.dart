import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/data/datasource/remote_datasouce/stock_chart_remote_data_source_implentation.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/data/repositories/stock_chart_repository_implentation.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/domain/use_cases/get_stock_info_using_company_name.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/domain/use_cases/get_stock_info_using_ticker.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/domain/use_cases/get_stock_price.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/domain/use_cases/get_stock_price_change.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/domain/use_cases/get_stock_volume.dart';
import 'package:med_easy_answer/utilities/network/network_info.dart';
import 'package:yahoofin/yahoofin.dart';

final GetIt _locator = GetIt.instance;

GetIt get moduleLocator => _locator;

Future<void> setUpModules() async {
  _setUpUseCases();
  _setUpExternal();
  _setupRemoteDataSources();
  _setupRepositories();
  _setUpCore();
}

Future<void> _setUpUseCases() async{
  _locator.registerLazySingleton(() => GetStockInfoUsingTicket(_locator<StockChartRepositoryImplementation>()));
  _locator.registerLazySingleton(() => GetStockInfoUsingCompanyName(_locator<StockChartRepositoryImplementation>()));
  _locator.registerLazySingleton(() => GetStockChatVolume(_locator<StockChartRepositoryImplementation>()));
  _locator.registerLazySingleton(() => GetStockChartPriceChange(_locator<StockChartRepositoryImplementation>()));
  _locator.registerLazySingleton(() => GetStockChartPrice(_locator<StockChartRepositoryImplementation>()));
}

Future<void> _setUpCore() async{
_locator.registerLazySingleton(() => NetworkInfoImplementation(_locator<InternetConnectionChecker>()));
_locator.registerLazySingleton(() => InternetConnectionChecker());
}

Future<void> _setupRepositories() async {
_locator.registerLazySingleton(() => StockChartRepositoryImplementation(
    stockChartRemoteDataSourceImplementation: _locator<StockChartRemoteDataSourceImplementation>(),
    networkInfo: _locator<NetworkInfoImplementation>()) );
}

Future<void> _setupRemoteDataSources() async {
  _locator.registerLazySingleton(() => StockChartRemoteDataSourceImplementation(_locator<YahooFin>()));

}

Future<void> _setUpExternal() async {
_locator.registerLazySingleton(() => YahooFin());
}