 import 'package:med_easy_answer/stock_chart/stock_charts/data/datasource/remote_datasouce/stock_chart_remote_data_source.dart';
import 'package:yahoofin/yahoofin.dart';

class StockChartRemoteDataSourceImplementation implements StockChartRemoteDataSource{

  final YahooFin yahooFinancial;

  StockChartRemoteDataSourceImplementation(this.yahooFinancial);

  Future<StockQuote> getStockPrice(StockInfo stockInfo) async{
    return yahooFinancial.getPrice(stockInfo: stockInfo);
  }

  Future<StockQuote> getStockPriceChange(StockInfo stockInfo) async{
    return yahooFinancial.getPriceChange(stockInfo: stockInfo);
  }

  Future<StockQuote> getStockVolume(StockInfo stockInfo) async{
    return yahooFinancial.getVolume(stockInfo: stockInfo);
  }

  @override
  Future<StockInfo> getStockInfoUsingCompanyName(String companyName) async {
    return yahooFinancial.getStockInfo(ticker: companyName);
  }

  @override
  Future<StockInfo> getStockInfoUsingTicker(String ticker) async {
    return yahooFinancial.getStockInfo(ticker: ticker);
  }

 }