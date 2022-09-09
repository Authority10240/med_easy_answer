
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/presentation/pages/chart_page.dart';
import 'package:router_management/router_management.dart';


class App extends StatelessWidget with NavigationWidgetMixin {
   App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Med Easy Answer",
      theme: ThemeData(textTheme: GoogleFonts.openSansTextTheme(
        Theme.of(context).textTheme
      ),
      fontFamily: 'Open Sans'),
      initialRoute: '/' ,
      routes: {
        '/' : (context) => StockChartPage()
      },
    );
  }
}
