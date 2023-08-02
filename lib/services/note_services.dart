import 'dart:convert';


import 'package:crm_front/models/city_factory.dart';
import 'package:http/http.dart' as http;

class FutureCityService{
  static const URL_API='http://45.33.88.228:8086/api';
  static const headers = {
    'apiKey': ''
  };
  Future<List<CityForListing>?> getFutureCitiesList() async {
    var client = http.Client();

    var uri = Uri.parse(URL_API+'/cities');
    var response = await client.get(uri, headers: headers);
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return citiesFromJson(jsonData);
    }
  }
}

class CityDetailService{
  static const URL_API='http://45.33.88.228:8086/api';
  static const headers = {
    'apiKey': ''
  };
  Future<CityDetail?> getCityForDetail(dynamic id) async{
    var client = http.Client();
    var uri = Uri.parse(URL_API +'/cities/'+ id.toString());
    var response = await client.get(uri, headers: headers);
    if (response.statusCode == 200){
      var jsonData = response.body;
      return cityDetailFromJson(jsonData);
    }
  }
}


class CityCreateService{
  static const URL_API='http://45.33.88.228:8086/api';
  static const headers = {
    'apiKey': '',
    'Content-type': 'application/json'
  };
  Future<CityCreated?> postCityToCreate(CityToCreate city) async{

    print("se va a enviado el usuario el usuario ${city.name}");
    var cliente = http.Client();
    var uri = Uri.parse(URL_API + '/cities');
    var response = await cliente.post(uri, body: cityCreateToJson(city), headers: headers);
    print("se ha recibido la respuesta ${response.body}");
    if (response.statusCode == 201) {
      var jsonData = response.body;
      return cityCreatedFromJson(jsonData);
    }else{
      final status = response.statusCode;
      final body = response.body.toString();
      final String err_msg = "status: ${status}, body: ${body}";
      return Future.error(err_msg);
    }
  }
}