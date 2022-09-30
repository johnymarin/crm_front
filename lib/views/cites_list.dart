import 'package:crm_front/models/cities.dart';
import 'package:crm_front/services/remote_services.dart';
import 'package:crm_front/views/city_modify.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Cities>? cities;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    // fetch the cities data from the API
    getData();
  }

  getData() async {
    cities = await RemoteService().getCities();
    if(cities != null){
      setState(() {
        isLoaded = true;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    // This widget is the home page of your application. It is stateful, meaning
    // that it has a State object (defined below) that contains fields that affect
    // how it looks.

    // This class is the configuration for the state. It holds the values (in this
    // case the title) provided by the parent (in this case the App widget) and
    // used by the build method of the State. Fields in a Widget subclass are
    // always marked "final".


    return Scaffold(
      appBar: AppBar(
        title: const Text(' List of Cities'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CityModify()));
        },
        child: Icon(Icons.add),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: cities?.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.location_city),
              title: Text(cities![index].id.toString()),
              subtitle: Text(cities![index].name),
              isThreeLine: true,
              trailing: Icon(Icons.more_vert),
            );
          },
        ),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      
    );
  }
}
