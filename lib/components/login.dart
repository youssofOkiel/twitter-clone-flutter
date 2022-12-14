import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitterapp/Services/auth.dart';
import 'signup.dart';
import 'feed.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String email = "";
  String password = "";

  final _formKey = GlobalKey<FormState>();

  Widget LoginValidation(email, passwor) {
    var data = "";

    if (email == "" || password == "") {
      data = "email and password is requird";
    }

    return Text(data, style: TextStyle(color: Colors.red));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(""),
        title: Text("Login"),
        elevation: 20,
        shadowColor: Colors.black,
        backgroundColor: Color.fromARGB(255, 25, 128, 212),
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
      ),

      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 50, right: 50, left: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Image(
                    image: NetworkImage(
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Twitter-logo.svg/768px-Twitter-logo.svg.png?20211104142029",
                        scale: 7)),
              ),
              Form(
                  key: _formKey,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), labelText: "email"),
                        onChanged: (value) {
                          email = value;
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty)
                            return 'Enter valid email';
                          return (!value.contains('@'))
                              ? 'plz use the @ char.'
                              : null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30, top: 30),
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
                                bool isValid =
                                    await AuthService.login(email, password);
                                if (isValid) {
                                  print('login success');
                                  FirebaseAuth.instance
                                      .authStateChanges()
                                      .listen((User? user) {
                                    print(user!.uid);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyFeedPage(
                                                profileId: user.uid)));
                                  });
                                } else {
                                  print('login problem');
                                  print(email);
                                  print(password);
                                }
                              }
                            },
                            child: Text("Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30)),
                          ),
                        )),
                  ])),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("if you didn't have we can ",
                        style: TextStyle(
                          color: Color.fromARGB(255, 141, 141, 141),
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MySignUpPage()));
                        },
                        child: Text("sign up")),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      // This trailing comma makes auto-formatting ni  cer for build methods.
    );
  }
}
