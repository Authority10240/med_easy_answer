import 'package:dartz/dartz.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/data/repositories/stock_chart_repository_implentation.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/domain/repositories/stock_chart_repository.dart';
import 'package:med_easy_answer/utilities/error/failure.dart';
import 'package:med_easy_answer/utilities/use_cases/usecase.dart';
import 'package:yahoofin/yahoofin.dart';

class GetStockInfoUsingTicket implements UseCase<StockInfo, String>{

  final StockChartRepositoryImplementation stockChartRepositoryImplementation;

  GetStockInfoUsingTicket(this.stockChartRepositoryImplementation);

  Future<Either<Failure,StockInfo>> execute(
   String ticker
) async{
    return await stockChartRepositoryImplementation.getStockInfoUsingTicker(ticker);
  }
}