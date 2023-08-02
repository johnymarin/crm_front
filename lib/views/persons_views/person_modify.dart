
import 'dart:js';
import 'dart:math';

import 'package:crm_front/models/person_factory.dart';
import 'package:crm_front/services/person_services.dart';
import 'package:flutter/material.dart';

class PersonModifyWidget extends StatefulWidget {
  //what means final on stateless widgets
  final int? personID;
  PersonModifyWidget({this.personID});

  @override
  State<PersonModifyWidget> createState() => _PersonModifyWidgetState();
}

class _PersonModifyWidgetState extends State<PersonModifyWidget> {
  bool get isCreating => widget.personID == null;


  PersonForRetrieve? person = null;
  var isLoaded = false;
  var _nationalIdTypeController = TextEditingController();
  var _nationalIdController = TextEditingController();
  var _personTypeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if(!isCreating) {
      getData();
    }else{
      setState(() {
        isLoaded = true;
      });
    }
  }




  getData() async{
    person = await PersonForRetriveService().getPersonForRetrieve(widget.personID);
    if(person != null){
      setState(() {
        isLoaded = true;
        _nationalIdTypeController.text = person!.nationalIdType;
        _nationalIdController.text = person!.nationalId;
        _personTypeController.text = person!.personType;
      });
    }
  }

  postData(nationalIdType, nationalId, personType) async{
    try {
      var personForCreate = PersonForCreate(nationalIdType: nationalIdType, nationalId: nationalId, personType: personType);
      var personCreated = await PersonForCreateService()
          .postPersonForCreate(personForCreate);
      return personCreated;
    }catch (e){
      print (e);
      return e;
    }
  }


  






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( isCreating ? 'Create City' : 'Modify City')
      ),
      body: Visibility(
        visible: isLoaded,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _nationalIdTypeController,
                decoration: InputDecoration(
                  hintText: 'National Id Type'
                ),
              ),
              Container(
                height: 12,
              ),

              TextField(
                controller: _nationalIdController,
                decoration: InputDecoration(
                    hintText: 'National Id'
                ),
              ),
              Container(
                height: 12,
              ),

              TextField(
                controller: _personTypeController,
                decoration: InputDecoration(
                    hintText: 'Person Type'
                ),
              ),
              Container(
                height: 12,
              ),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () async{
                    if(isCreating){
                      // create note in api
                      final postResult = await postData(_nationalIdTypeController.text, _nationalIdController.text, _personTypeController.text);


                    }else{
                      //uptdate note in api

                    }
                    Navigator.of(context).pop();
                  },
                  child: Text('Submit'),

                ),
              )
            ],
          ),
        ),
      ),
    );
  }


}
