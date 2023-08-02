import 'package:crm_front/models/person_factory.dart';
import 'package:crm_front/services/person_services.dart';
import 'package:crm_front/views/persons_views/person_modify.dart';
import 'person_delete.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class PersonListWidget extends StatefulWidget {
  const PersonListWidget({ Key? key}) : super(key: key);

  @override
  _PersonListWidgetState createState() => _PersonListWidgetState();
}

class _PersonListWidgetState extends State<PersonListWidget> {


  List<PersonForList>? persons = [];
  var isLoaded = false;

  @override
  void initState()  {
    super.initState();
    // fetch the cities data from the API
    getData();
  }

  getData() async {
    persons = await PersonListService().getPersonList();
    if(persons != null){
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
        title: const Text(' List of Persons'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => PersonModifyWidget()));
        },
        child: Icon(Icons.add),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: persons?.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: ValueKey(persons?[index].personId),
              direction: DismissDirection.startToEnd,
              onDismissed: (direction){},
              confirmDismiss: (direction) async{
                final result = await showDialog(
                    context: context,
                    builder: (context) => PersonDeleteWidget()
                );
                return result;
              },
              background: Container(
                  color: Colors.red,
                  padding: EdgeInsets.only(left: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                        Icons.delete,
                        color: Colors.white
                    ),
                  )
              ),
              child: ListTile(
                leading: Icon(Icons.face),
                title: Text(persons![index].personId.toString()),
                subtitle: Text('${persons![index].nationalIdType } - ${persons![index].nationalId }'),
                isThreeLine: true,
                trailing: Icon(Icons.more_vert),
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => PersonModifyWidget(
                              personID: persons?[index].personId
                          )
                      )
                  );
                },
              ),
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
