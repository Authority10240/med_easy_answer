import 'package:med_easy_answer/stock_chart/stock_charts/domain/entities/stock_data.dart';

class StockDataModel extends StockData{
  StockDataModel({
    required double close,
    required String date,
    required double dividends,
    required double high,
    required double low,
    required double open,
    required double stockSplits,
    required double volume})
      : super(
      close: close,
      date: date,
      dividends: dividends,
      high: high,
      low: low,
      open: open,
      stockSplits: stockSplits,
      volume: volume);

  factory StockDataModel.fromJson(Map<String, dynamic> json){
    return StockDataModel(
      close: json['Close'],
      date: '${json['Date']}' ,
      dividends: json['Dividends'] + .0,
      high: json['High'],
      low: json['Low'],
      open: json['Open'],
      stockSplits: json['Stock Splits'] +.0,
      volume: json['Volume'] +.0
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'Close': close,
      'Date' : date,
      'Dividends' : dividends,
      'High' : high,
      'Low' : low,
      'Open' : open,
      'Stock Splits' : stockSplits,
      'Volume' : volume
    };
  }

}