import 'package:database/pages/details_page.dart';
import 'package:database/services/prefs_service.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<User> items=[];

  _callDetailsPage()async{
    var result= await Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
      return DetailsPage();
    }));
    if(result){
      _loadUserList();
    }
  }
  _loadUserList()async{
    var users =await PrefsService.loadUserList();
  setState(() {
    items!=users;
  });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Home Page"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, int index){
          return _itemOfUsers(items[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
          onPressed: (){
          _callDetailsPage();
          },
      child: const Icon(Icons.add),
      ),
    );
  }
  Widget _itemOfUsers(User user){
    return Container(
      margin: EdgeInsets.only(top: 8),
      color: Colors.grey.shade300,
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(user.name!,style: TextStyle(fontSize: 17, fontWeight:  FontWeight.bold),),
    Text(user.id!.toString(),style: TextStyle(fontSize: 17, fontWeight:  FontWeight.bold),),
        ],
      ),
    );
  }
}
