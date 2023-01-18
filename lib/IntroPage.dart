import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custom_widget/HomePage.dart';

class IntroPage extends StatelessWidget{
  String title = "Demo App";
  String email = "app@demo";
  String pass = "qw12";
  var emailText = TextEditingController();
  var passText = TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    // enabled: false,
                    // keyboardType: TextInputType.phone,
                    controller: emailText,
                    decoration: InputDecoration(
                        hintText: "Email",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(
                              color: Colors.deepOrange,
                              width: 3,
                            )

                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(
                              color: Colors.blueAccent,
                            )
                        ),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(
                              color: Colors.pink,
                            )
                        ),
                        //suffixText: "Username exists",

                        suffixIcon: IconButton(
                            onPressed: (){

                            },
                            icon: Icon(Icons.person, color: Colors.deepOrange,)),
                        prefixIcon: Icon(Icons.mail_outline_outlined, color: Colors.deepOrangeAccent,)

                    ),

                  ),
                ),
                Container(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: passText,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Password",
                        //focusedBorder: ,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(
                                color: Colors.deepOrange
                            )
                        )
                    ),
                  ),
                ),
                Container( height: 20,),
                Center(
                  child: Container(
                    width: 200,
                    child: ElevatedButton(
                      child: Text("Login", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, ),),
                      onPressed: (){
                        String uEmail = emailText.text.toString();
                        String uPass = passText.text.toString();
                        if ((uEmail==email) & (uPass == pass)){
                          Navigator.push( context, MaterialPageRoute(
                              builder: (context)=> HomePage()
                          ));
                        }

                      },

                    ),
                  ),
                )
              ],
            ),
          ),
        )
    ) ;
  }
}