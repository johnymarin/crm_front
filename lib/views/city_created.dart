

import 'package:flutter/material.dart';

class CityCreatedWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text('Created'),
    content: Text('Created'),
    actions: [
      TextButton(
          onPressed: (){
            Navigator.of(context).pop;
          },
          child: Text('ok'))
    ],
  );
}
