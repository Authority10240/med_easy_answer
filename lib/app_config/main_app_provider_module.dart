
import 'package:flutter/cupertino.dart';
import 'package:med_easy_answer/app_config/med_easy_module.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/domain/use_cases/get_stock_info.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/presentation/pages/main_page.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/presentation/provider/stock_chart_provider.dart';
import 'package:provider/provider.dart';

Future <void> providerMainAppModule() async {
  //AppSailor.createSailorRoutes();
  setUpModules();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => StockChartProvider(
         getStockInfo: locator<GetStockInfo>())),
    ],
      child: App()
  ));
}