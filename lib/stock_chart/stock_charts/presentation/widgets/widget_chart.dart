import 'package:flutter/material.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/domain/entities/stock_data.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class WidgetStockChart extends StatelessWidget {
  const WidgetStockChart({Key? key, required this.stockData}) : super(key: key);
  final List<StockData> stockData;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width,
        child: SfSparkLineChart.custom(

          trackball:
              SparkChartTrackball(activationMode: SparkChartActivationMode.tap),
         marker:
             SparkChartMarker(displayMode: SparkChartMarkerDisplayMode.high),
          labelDisplayMode: SparkChartLabelDisplayMode.high,
          yValueMapper: (int index) => getAveragePrice(stockData[index]),
          xValueMapper: (int index) => double.parse( stockData[index].date),
          axisLineDashArray: [6,6],
          dataCount: stockData.length,
          color: Colors.blue
        ),
      )
    ]);
  }

  double getAveragePrice(StockData stockData) {
    return (stockData.high + stockData.low) / 2;
  }
}
