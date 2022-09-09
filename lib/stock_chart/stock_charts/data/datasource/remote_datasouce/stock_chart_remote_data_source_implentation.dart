 import 'package:dio/dio.dart' ;
import 'package:med_easy_answer/stock_chart/stock_charts/data/datasource/remote_datasouce/stock_chart_remote_data_source.dart';
import 'package:yahoofin/yahoofin.dart';

class StockChartRemoteDataSourceImplementation implements StockChartRemoteDataSource{

  final Dio dio;
  final String url;

  StockChartRemoteDataSourceImplementation(this.dio, this.url);

  @override
  Future<List<dynamic>> getStockInfo({required String symbol
    , required String period}) async {
    Response response = await dio.post(url,
        data: {
          "symbol": symbol,
          "period": period
        },
        options: Options(
          headers: {
            "X-RapidAPI-Key":"43bc07c67emsh32b730a8ee33997p1d02bbjsn51857a4fd214",
            "X-RapidAPI-Host": "yahoo-finance97.p.rapidapi.com"
          },
          contentType: "application/x-www-form-urlencoded"
        ) );

    return response.data['data'];
  }

  


 }