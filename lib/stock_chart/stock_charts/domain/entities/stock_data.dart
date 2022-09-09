import 'package:equatable/equatable.dart';

class StockData extends Equatable{
  final double close;
  final String date;
  final double dividends;
  final double high;
  final double low;
  final double open;
  final double stockSplits;
  final double volume;

  StockData({
    required this.close,
    required this.date,
    required this.dividends,
    required this.high,
    required this.low,
    required this.open,
    required this.stockSplits,
    required this.volume}): super();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();


}