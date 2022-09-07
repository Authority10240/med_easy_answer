import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          child:Row(
            children: [
              Icon(Icons.search),
              Divider(),
              TextFormField()
            ],
          ) ),
    );
  }
}
