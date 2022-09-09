import 'package:dartz/dartz.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/domain/entities/stock_data.dart';
import 'package:med_easy_answer/utilities/error/failure.dart';
import 'package:yahoofin/yahoofin.dart';

abstract class StockChartRepository{

  Future<Either<Failure,List<StockData>>>getStockInfo({required String symbol ,
    required String period});


}