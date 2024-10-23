import 'package:database/models/user_model.dart';
import 'package:database/services/prefs_service.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  TextEditingController idController =TextEditingController();
  TextEditingController nameController= TextEditingController();
  _saveNewUser()async{
    String id =idController.text.toString().trim();
    String name= nameController.text.toString().trim();
    User user= new User (id: int.parse(id),name:name);
  //   save to shared preference
    var users= await PrefsService.loadUserList();
    users!.add(user);

    await PrefsService.storeUserList(users);

    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Add User"),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: idController,decoration: InputDecoration(hintText: "User Id"),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: nameController,decoration: InputDecoration(hintText: "User name"),
            ),
            SizedBox(height: 10,),
            MaterialButton(
              color: Colors.blue,
              onPressed:(){
               _saveNewUser();
              },
              child: Text("Save"),
            ),
         ],
        ),
      ),
    );
  }
}
