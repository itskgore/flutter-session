import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {

  String? username;
  String? email;
  String? age;
  bool loading = true;

  @override
  void initState() {
    // TODO: implement initState
    getUserName();
    super.initState();
  }


  getUserName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Future.delayed(const Duration(seconds: 2,),() {
    username =  sharedPreferences.getString("username");
    age =  sharedPreferences.getString("age");
    email =  sharedPreferences.getString("email");
     setState(() {
      loading = false;
    });
    });
   
  }


  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("User Detail"),
      ),
      body: Center(
         child: loading ? const CircularProgressIndicator() : Column(
           children: [
            const SizedBox(
              height: 50,
            ),
             Padding(
               padding: const EdgeInsets.all(12),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   const Text("Name:",style: TextStyle(
                    fontWeight: FontWeight.bold
                   ),),
                   Text("$username"),
             
                 ],
               ),
             ),
             
             Padding(
               padding: const EdgeInsets.all(12),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
             
                 children: [
                   const Text("Age:",style: TextStyle(
                    fontWeight: FontWeight.bold
                   ),),
                   Text("$age"),
             
                 ],
               ),
             ),
             Padding(
               padding: const EdgeInsets.all(12),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
             
                 children: [
                   const Text("Email:",style: TextStyle(
                    fontWeight: FontWeight.bold
                   ),),
                   Text("$email"),
             
                 ],
               ),
             ),
           
           ],
         ),
      ),
    );
  }
}