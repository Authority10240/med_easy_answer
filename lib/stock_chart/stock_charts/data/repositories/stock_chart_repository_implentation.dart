import 'package:dartz/dartz.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/data/datasource/remote_datasouce/stock_chart_remote_data_source_implentation.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/data/datasource/remote_datasouce/stock_chart_remote_data_source.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/domain/repositories/stock_chart_repository.dart';
import 'package:med_easy_answer/utilities/error/exception.dart';
import 'package:med_easy_answer/utilities/error/failure.dart';
import 'package:med_easy_answer/utilities/network/network_info.dart';
import 'package:yahoofin/src/features/information/stock_info.dart';
import 'package:yahoofin/src/models/stock_quote.dart';
import 'package:meta/meta.dart';

class StockChartRepositoryImplementation implements StockChartRepository{

  final StockChartRemoteDataSourceImplementation stockChartRemoteDataSourceImplementation;
  final NetworkInfo networkInfo;

  StockChartRepositoryImplementation({ required this.stockChartRemoteDataSourceImplementation,
      required this.networkInfo});
  @override
  Future<Either<Failure, StockInfo>> getStockInfoUsingCompanyName(String companyName) async {
      try {
        StockInfo stockChart = await stockChartRemoteDataSourceImplementation
            .getStockInfoUsingCompanyName(companyName);
        return Right(stockChart);
      } on ServerException{
        return Left(ServerFailure());
      }
  }

  @override
  Future<Either<Failure, StockInfo>> getStockInfoUsingTicker(String ticker) async {
    try{
      StockInfo stockInfo = await stockChartRemoteDataSourceImplementation.
      getStockInfoUsingTicker(ticker);
      return Right(stockInfo);
    }on ServerException{
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, StockQuote>> getStockPrice(StockInfo stockInfo) async{
   try{
     StockQuote stockQuote = await stockChartRemoteDataSourceImplementation.getStockPrice(stockInfo);
     return Right(stockQuote);
   } on ServerException{
     return Left(ServerFailure());
   }
  }

  @override
  Future<Either<Failure, StockQuote>> getStockPriceChange(StockInfo stockInfo) async {
    try{
      StockQuote stockQuote = await stockChartRemoteDataSourceImplementation.getStockPriceChange(stockInfo);
      return Right(stockQuote);

    } on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, StockQuote>> getStockVolume(StockInfo stockInfo) async {
    try{
      StockQuote stockQuote = await stockChartRemoteDataSourceImplementation.getStockVolume(stockInfo);
      return Right(stockQuote);
    } on ServerException{
      return Left(ServerFailure());
    }
  }

}