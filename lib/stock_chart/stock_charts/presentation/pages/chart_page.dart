import 'package:flutter/material.dart';
import 'package:med_easy_answer/app_config/med_easy_module.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/domain/use_cases/get_stock_info.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/presentation/provider/stock_chart_provider.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/presentation/widgets/widget_chart.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/presentation/widgets/widget_search_box.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/presentation/widgets/widget_preloader.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/presentation/widgets/widget_time_interval_picker.dart';
import 'package:provider/provider.dart';


class StockChartPage extends StatefulWidget {
  const StockChartPage({Key? key}) : super(key: key);

  @override
  State<StockChartPage> createState() => _StockChartPageState();
}

class _StockChartPageState extends State<StockChartPage> {

  final durationList = ['1Y', '2Y' , '3Y' , '4Y' , '5Y' , "6Y" ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 3;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        centerTitle: true,
        title: Text('Med Easy Answer'),
      ),
      body: Consumer<StockChartProvider>(builder: (context,stockChartProvider, child ){
        return Container(
          child:Column(
            children: [
              WidgetSearchBox(
                onChanged: (value)=> stockChartProvider.changeSymbol(value),),
              SizedBox(height:20 ,),
              stockChartProvider.symbol.isEmpty?
              SizedBox(height: height ,child: Center(child: Text('Enter company ticker vcdto populate stock chart'),)):
              stockChartProvider.loadingState == LoadingState.LOADING_STATE ?
                  Container(height: height,child: WidgetPreloader()):
                  stockChartProvider.loadingState == LoadingState.COMPLETE_STATE ?
                      stockChartProvider.stockDataList.isEmpty?
                      SizedBox(height: height ,child: Center(child: Text('Invalid ticker/company name'),))
                          :Card(elevation: 8,child: Container(padding: EdgeInsets.all(10),child: WidgetStockChart(stockData: stockChartProvider.stockDataList ))):
                      Center(
                          child: Text("Error retrieving Stock Data")),
              SizedBox(height: 20,),
              Card(elevation: 8,
                child: WidgetTimeIntervalPicker(selectedPos: stockChartProvider.period ,items: durationList,
                  onTap:(value)=> stockChartProvider.changePeriod(value),),
              )

            ],
          ),
        );
      })
    );
  }
}
