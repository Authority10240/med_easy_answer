import 'package:dartz/dartz.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/data/repositories/stock_chart_repository_implentation.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/domain/entities/stock_data.dart';
import 'package:med_easy_answer/utilities/error/failure.dart';
import 'package:med_easy_answer/utilities/use_cases/usecase.dart';


class GetStockInfo implements UseCase<List<StockData>, Params>{
  final StockChartRepositoryImplementation stockChartRepositoryImplementation;

  GetStockInfo(this.stockChartRepositoryImplementation);

  Future<Either<Failure,List<StockData>>> execute (
   Params params
) async {
      return await stockChartRepositoryImplementation.getStockInfo(
          symbol: params.symbol, period: params.period);
  }


}

class Params {
  final String symbol;
  final String period;


  Params({required this.symbol, required this.period});}