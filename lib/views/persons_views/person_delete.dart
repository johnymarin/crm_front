
import 'package:flutter/material.dart';

class PersonDeleteWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Warning'),
      content: Text('Are you sure you want to delete this person?'),
      actions: <Widget>[
        TextButton(
          onPressed: (){
            Navigator.of(context).pop(true);
            //ToDo: call delete service
            },
            child: Text('Yes'),
        ),
        TextButton(
          onPressed: (){
            Navigator.of(context).pop(false);
            },
            child: Text('No'),
        ),
      ],
    );
  }
}
