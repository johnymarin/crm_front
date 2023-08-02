
import 'dart:js';
import 'dart:math';

import 'package:crm_front/models/city_factory.dart';
import 'package:crm_front/services/note_services.dart';
import 'package:flutter/material.dart';

class CityModify extends StatefulWidget {
  //what means final on stateless widgets
  final int? cityID;
  CityModify({this.cityID});

  @override
  State<CityModify> createState() => _CityModifyState();
}

class _CityModifyState extends State<CityModify> {
  bool get isCreating => widget.cityID == null;


  CityDetail? city = null;
  var isLoaded = false;
  var _nameController = TextEditingController();
  var _timezoneController = TextEditingController();

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
    city = await CityDetailService().getCityForDetail(widget.cityID);
    if(city != null){
      setState(() {
        isLoaded = true;
        _nameController.text = city!.name;
        _timezoneController.text = city!.timezone;
      });
    }
  }

  postData(name, timezone) async{
    try {
      var city_to_create = CityToCreate(name: name, timezone: timezone);
      var city_created = await CityCreateService()
          .postCityToCreate(city_to_create);
    }catch (e){
      print (e);
      showErrorDialog(e);
    }
  }


  


  showErrorDialog(Object e) {
    Future openDialog(context) => showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              title: Text("Error"),
              content: Text(e.toString()),
              actions: [
                TextButton(
                    onPressed: (){
                      Navigator.of(context).pop;
                    },
                    child: Text('ok'),
                ),
              ],
            )
    );
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
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'City Name'
                ),
              ),
              Container(
                height: 12,
              ),

              TextField(
                controller: _timezoneController,
                decoration: InputDecoration(
                  hintText: 'Time Zone'
                ),
              ),
              Container(
                height: 12,
              ),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: (){
                    if(isCreating){
                      // create note in api
                      postData(_nameController.text, _timezoneController.text);
                      showErrorDialog("nada");

                    }else{
                      //uptdate note in api
                      Future openDialog() => showErrorDialog("e");
                      openDialog();
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
