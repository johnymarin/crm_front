

import 'package:flutter/material.dart';

class ErrorDispatcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:Text("Error"),
      content: Text('the error has occured'),
      actions:[
        TextButton(
            onPressed: (){
              Navigator.of(context).pop;
            },
            child: Text('ok')
        )
      ]
    );
  }
}
