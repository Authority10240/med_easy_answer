import 'package:med_easy_answer/stock_chart/stock_charts/domain/use_cases/get_stock_info_using_company_name.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/domain/use_cases/get_stock_info_using_ticker.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/domain/use_cases/get_stock_price.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/domain/use_cases/get_stock_price_change.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/domain/use_cases/get_stock_volume.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

class StockChartProvider with ChangeNotifier{

  final GetStockChartPrice getStockChartPrice;
  final GetStockChartPriceChange getStockChartPriceChange;
  final GetStockChatVolume getStockChatVolume;
  final GetStockInfoUsingCompanyName getStockInfoUsingCompanyName;
  final GetStockInfoUsingTicket getStockInfoUsingTicket;

  StockChartProvider(
      this.getStockChartPrice,
      this.getStockChartPriceChange,
      this.getStockChatVolume,
      this.getStockInfoUsingCompanyName,
      this.getStockInfoUsingTicket);





}