import 'package:dartz/dartz.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/data/datasource/remote_datasouce/stock_chart_remote_data_source_implentation.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/data/datasource/remote_datasouce/stock_chart_remote_data_source.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/data/models/stock_data_model.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/domain/entities/stock_data.dart';
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
  Future<Either<Failure, List<StockData>>> getStockInfo({required String symbol ,  required String period}) async {
    List<StockData> stockDataList = [];
      try {
        var jsonDataList = await  stockChartRemoteDataSourceImplementation.getStockInfo(symbol: symbol,period: period);
        jsonDataList.forEach((stockData) {
          stockDataList.add(StockDataModel.fromJson( stockData));
        });
        return Right(stockDataList);
      } on ServerException{
        return Left(ServerFailure());
      }
  }



}