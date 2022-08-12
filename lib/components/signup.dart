import 'package:flutter/material.dart';
import 'login.dart';

class MySignUpPage extends StatefulWidget {
  const MySignUpPage({Key? key}) : super(key: key);


  @override
  State<MySignUpPage> createState() => _MySignUpPageState();
}

class _MySignUpPageState extends State<MySignUpPage> {
  var name = TextEditingController();
  var username = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var rePassword = TextEditingController();

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
                        scale: 25)),
              ),
              
               
                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Name"),
                  controller: name,
                ),
              
                Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "username"),
                  controller: username,
                ),
              ),
                Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "email"),
                  controller: email,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "password"),
                  obscureText: true,
                  controller: password,
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 15),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "confirm password"),
                  obscureText: true,
                  controller: rePassword,
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
                      onPressed: () {},
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
                    Text("if you already have one we can " ,style: TextStyle(color: Color.fromARGB(255, 141, 141, 141),)),
                    TextButton(onPressed: () {
                       Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()));
                    }, child: Text("Login")),
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
