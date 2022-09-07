import 'package:dartz/dartz.dart';
import 'package:med_easy_answer/utilities/error/failure.dart';
import 'package:yahoofin/yahoofin.dart';

abstract class StockChartRepository{

  Future<Either<Failure,StockInfo>>getStockInfoUsingTicker(String ticker);
  Future<Either<Failure,StockInfo>> getStockInfoUsingCompanyName(String companyName);

  Future<Either<Failure, StockQuote>> getStockPrice(StockInfo stockInfo);
  Future<Either<Failure, StockQuote>> getStockPriceChange(StockInfo stockInfo);
  Future<Either<Failure,StockQuote>> getStockVolume(StockInfo stockInfo);

}