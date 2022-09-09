import 'package:dartz/dartz.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/domain/entities/stock_data.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/domain/use_cases/get_stock_info.dart';
import 'package:flutter/foundation.dart';
import 'package:yahoofin/yahoofin.dart';

class StockChartProvider with ChangeNotifier{

  List<StockData> stockDataList = [];
  LoadingState loadingState = LoadingState.EMPTY_STATE;
  String ticker = "";
  String period = "1Y";
  String symbol = "";

  final GetStockInfo getStockInfo;




  StockChartProvider({
      required this.getStockInfo,
     }
      );



  Future<void> getStockInfoList() async{
    loadingState = LoadingState.LOADING_STATE;
    notifyListeners();
    final result = await getStockInfo.execute(Params(symbol:symbol, period: period));

    result.fold((failure){
      loadingState = LoadingState.ERROR_STATE;
      notifyListeners();
    }, (stockData) async {
      stockDataList = stockData;
      loadingState = LoadingState.COMPLETE_STATE;
      notifyListeners();
    });



  }

  changePeriod(String period) {
    this.period = period;
    getStockInfoList();
  }

  changeSymbol(String symbol){
    this.symbol = symbol;
    getStockInfoList();
  }





}

enum LoadingState{
  EMPTY_STATE,
  LOADING_STATE,
  COMPLETE_STATE,
  ERROR_STATE
}