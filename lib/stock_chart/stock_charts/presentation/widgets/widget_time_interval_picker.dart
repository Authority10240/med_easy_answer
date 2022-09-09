import 'package:flutter/material.dart';

class WidgetTimeIntervalPicker extends StatelessWidget {
   WidgetTimeIntervalPicker({Key? key, required this.items, required this.onTap, required this.selectedPos}) : super(key: key);
  final List<String> items;
  final Function onTap;
  final String selectedPos;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(scrollDirection: Axis.horizontal, itemBuilder: (context,i){
          return MaterialButton(
              onPressed: (){
                onTap(items[i]);
              },
            child: Container(
              height: 50,
              width: 50,
              child: Column(
                children: [
                  Center(child: Text(items[i],style: TextStyle(fontWeight: FontWeight.bold,color: items[i] == selectedPos ? Colors.blue : Colors.grey )),),
                  Divider(height: 20,color:items[i] == selectedPos ? Colors.blue : Colors.grey),
                ],
              ),
            ),
          );
      }, itemCount:items.length,),
    );
  }
}
