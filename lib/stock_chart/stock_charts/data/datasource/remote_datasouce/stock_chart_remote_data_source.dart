import 'package:yahoofin/yahoofin.dart';

abstract class StockChartRemoteDataSource{


  ///calls : yahooFinancial.getStockInfo(ticker: ticker)
  ///
  ///Throws [ServerException] when any error occurs
  Future<List<dynamic>>getStockInfo({required String symbol
    , required String period});

}