import 'package:flutter/material.dart';
import 'package:put_api_calling/model/model.dart';
import 'data_calling/data_calling.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

    TextEditingController _controllerTitle = TextEditingController();

    late Future <List<UserModel>> _dataModels;
    final Future<List<UserModel>> _data = getData();// create instance of getData


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dataModels = _data ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Put Api Calling Without provider"),
        titleTextStyle: TextStyle(color: Colors.white),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: FutureBuilder(
          future: _dataModels,
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              if(snapshot.hasData){
                final UserModel userData = snapshot.data!.first;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                        elevation: 20,
                        color: Colors.teal,
                        child: SizedBox(
                          height: 80,width: 200,
                          child: Center(
                              child: Text(userData.title ?? "No title",style: TextStyle(color: Colors.white),)// null handling
                          ),
                        )
                    ),

                    SizedBox(height: 20,),
                    TextField(
                      controller: _controllerTitle,
                      decoration: const InputDecoration(
                        hintText: 'Enter Title',
                      ),
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _dataModels = putData(_controllerTitle.text.toString());
                        });
                      },
                      child: const Text('Update Data'),
                    ),
                  ],
                );
              }
            }
             else if (snapshot.hasError){
                 return (Text("${snapshot.error}"));
               }
             return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
