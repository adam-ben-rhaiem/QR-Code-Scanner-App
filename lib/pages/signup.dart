import 'package:flutter/material.dart';
import 'package:flutter_login/pages/services/auth_service.dart';
import 'package:provider/provider.dart';


class Signup extends StatelessWidget {
  const Signup({Key? key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[300],
        title: Text(
          "Sign Up",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w400, fontFamily: "Schyler"),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 9),
            child: TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: TextStyle(fontSize: 22),
                hintText: "Your email",
                prefixIcon: Icon(Icons.person),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.purple[100],
              borderRadius: BorderRadius.circular(40),
            ),
            margin: EdgeInsets.symmetric(horizontal: 55),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 9),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Password",
                hintStyle: TextStyle(fontSize: 22),
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.visibility),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.purple[100],
            ),
            margin: EdgeInsets.symmetric(horizontal: 55),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            
            child: ElevatedButton(
              child: Text("Sign Up", style: TextStyle(fontSize: 20)),
              onPressed: () async {
                authService.createwithEmailAndPassword(
                  emailController.text,
                  passwordController.text,
                );
               
        
            
              
              
              

        
            
                  
              
                 
              
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purple[500]),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35))),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 15, horizontal: 109)),
              ),
            ),
            margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

  void showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text('This is an alert message!'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }
