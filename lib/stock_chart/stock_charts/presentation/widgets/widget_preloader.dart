import 'package:flutter/material.dart';
class WidgetPreloader extends StatelessWidget {
  const WidgetPreloader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      child: Center(
        child: CircularProgressIndicator(color: Colors.grey),
      ),
    );
  }
}
