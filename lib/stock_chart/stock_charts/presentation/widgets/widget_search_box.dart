import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_easy_answer/app_config/med_easy_module.dart';
import 'package:med_easy_answer/stock_chart/stock_charts/presentation/provider/stock_chart_provider.dart';

class WidgetSearchBox extends StatelessWidget {
   WidgetSearchBox({Key? key,  required this.onChanged}) : super(key: key);


  Function onChanged;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Card( elevation: 8,
      child: Container(
        height: 80,
        padding: const EdgeInsets.all(20),
          child:Row(
            children: [
              Icon(Icons.search, color: Colors.blue, size: 35,),
                SizedBox(width: 20,),
               Expanded(
                   child: TextField(
                     showCursor: true,
                     cursorHeight: 25,
                     cursorColor: Colors.grey,
                     onChanged:(value){
                       onChanged(value);
                     },
                   )),


            ],
          ) ),
    );
  }
}
