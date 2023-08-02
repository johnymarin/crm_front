import 'dart:convert';


import 'package:crm_front/models/person_factory.dart';
import 'package:http/http.dart' as http;

class PersonListService{
  static const URL_API='http://127.0.0.1:8086/api';
  static const headers = {
    'apiKey': ''
  };
  Future<List<PersonForList>?> getPersonList() async {
    var client = http.Client();

    var uri = Uri.parse(URL_API+'/persons');
    var response = await client.get(uri, headers: headers);
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return personForListFromJson(jsonData);
    }
  }
}

class PersonForRetriveService{
  static const URL_API='http://127.0.0.1:8086/api';
  static const headers = {
    'apiKey': ''
  };
  Future<PersonForRetrieve?> getPersonForRetrieve(dynamic id) async{
    var client = http.Client();
    var uri = Uri.parse(URL_API +'/persons/'+ id.toString());
    var response = await client.get(uri, headers: headers);
    if (response.statusCode == 200){
      var jsonData = response.body;
      return personForRetrieveFromJson(jsonData);
    }
  }
}


class PersonForCreateService{
  static const URL_API='http://127.0.0.1:8086/api';
  static const headers = {
    'apiKey': '',
    'Content-type': 'application/json'
  };
  Future<PersonCreated?> postPersonForCreate(PersonForCreate city) async{


    var cliente = http.Client();
    var uri = Uri.parse(URL_API + '/persons');
    var response = await cliente.post(uri, body: personForCreateToJson(city), headers: headers);

    if (response.statusCode == 201) {
      var jsonData = response.body;
      return personCreatedFromJson(jsonData);
    }else{
      final status = response.statusCode;
      final body = response.body.toString();
      final String err_msg = "status: ${status}, body: ${body}";
      return Future.error(err_msg);
    }
  }
}