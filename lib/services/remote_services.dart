import 'package:crm_front/models/cities.dart';
import 'package:http/http.dart' as http;

class RemoteService{
  Future<List<Cities>?> getCities() async {
    var client = http.Client();

    var uri = Uri.parse('http://127.0.0.1:8086/api/cities');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return citiesFromJson(json);
    }


  }

}