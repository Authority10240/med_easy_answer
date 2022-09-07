import 'package:yahoofin/yahoofin.dart';

abstract class StockChartRemoteDataSource{


  ///calls : yahooFinancial.getStockInfo(ticker: ticker)
  ///
  ///Throws [ServerException] when any error occurs
  Future<StockInfo>getStockInfoUsingTicker(String ticker);

  ///calls : yahooFinancial.getStockInfo(ticker: ticker)
  ///
  ///Throws [ServerException] when any error occurs
  Future<StockInfo> getStockInfoUsingCompanyName(String companyName);

  ///calls : yahooFinancial.getPrice(stockInfo: stockInfo)
  ///
  ///Throws [ServerException] when any error occurs
  Future<StockQuote> getStockPrice(StockInfo stockInfo);

  /// calls : yahooFinancial.getPriceChange(StockInfo: stockInfo)
  ///
  ///Throws [ServerException] when any error occurs
  Future<StockQuote> getStockPriceChange(StockInfo stockInfo);

  ///calls : yahooFinancial.getVolume(stockInfo: stockInfo)
  ///
  ///Throws [ServerException] when any error occurs
  Future<StockQuote> getStockVolume(StockInfo stockInfo);
}