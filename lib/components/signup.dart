import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twitterapp/Services/auth.dart';
import 'login.dart';

class MySignUpPage extends StatefulWidget {
  const MySignUpPage({Key? key}) : super(key: key);

  @override
  State<MySignUpPage> createState() => _MySignUpPageState();
}

class _MySignUpPageState extends State<MySignUpPage> {
  String displayName = "";
  String username = "";
  String email = "";
  String password = "";
  String rePassword = "";

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign Up"),
          elevation: 20,
          shadowColor: Colors.black,
          backgroundColor: Color.fromARGB(255, 25, 128, 212),
          foregroundColor: Color.fromARGB(255, 255, 255, 255),
        ),
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 50, right: 50, left: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Image(
                          image: NetworkImage(
                              "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Twitter-logo.svg/768px-Twitter-logo.svg.png?20211104142029",
                              scale: 25)),
                    ),
                    TextFormField(
                      onChanged: (value) {
                        displayName = value;
                      },
                      validator: (String? value) {
                          if (value == null || value.isEmpty)
                            return 'Enter valid name';
                        },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "Name"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextFormField(
                        onChanged: (value) {
                          username = value;
                        },validator: (String? value) {
                          if (value == null || value.isEmpty)
                            return 'Enter valid username';
                        
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "username"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: TextFormField(
                        onChanged: (value) {
                          email = value;
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty)
                            return 'Enter valid email';
                          else if(!value.contains('@'))   
                            return 'must contains @ char';
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), labelText: "email"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: TextFormField(
                        onChanged: (value) {
                          password = value;
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty)
                            return 'Enter valid password';
                          return (value.length < 8)
                              ? 'password more or equal 8 char'
                              : null;
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "password"),
                        obscureText: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20, top: 15),
                      child: TextFormField(
                        onChanged: (value) {
                          rePassword = value;
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty)
                            return 'Enter valid password';

                            else if (value != password)
                            return 'not identical';

                            return (value.length < 8)
                              ? 'password more or equal 8 char'
                              : null;
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "confirm password"),
                        obscureText: true,
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 25, 128, 212),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.all(7),
                          child: MaterialButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                bool isValid = await AuthService.signUp(
                                    displayName, username, email, password);
                                if (isValid) {
                                  Navigator.pop(context);
                                  print('signup success');
                                } else {
                                  print('something wrong');
                                }
                              }
                            },
                            child: Text("Sign up",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30)),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("if you already have one we can ",
                              style: TextStyle(
                                color: Color.fromARGB(255, 141, 141, 141),
                              )),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyHomePage()));
                              },
                              child: Text("Login")),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ]),
          ),

          // This trailing comma makes auto-formatting ni  cer for build methods.
        ));
  }
}
