// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[300],
        title: Text("Welcome",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400  ,fontFamily: "Schyler"),),
        centerTitle: true,
      ),
    
      body:
      Stack(
        children: [
      
                     Row(
                       children: [
                      
                         Container(
                          margin: EdgeInsets.only(top: 10),
                           child: Text("PRIXI",style: TextStyle(fontSize: 40,color: Color.fromRGBO(189, 7, 7, 1),fontWeight: FontWeight.w600  ,fontFamily: "Schyler"
                           
                           ),
                         
                           
                                    ),
                         ),
           
           
                       ],
                       mainAxisAlignment: MainAxisAlignment.center,
                      
                     ),
    
          Image(image: AssetImage('assets/shop.avif'),
          
          height:500,),
          
           
          
           
      
            //  Positioned(child: 
             
            //           Image.asset("assets/images/main_bottom.png"),
            //           bottom: 0,
            //           left:0,
            //           width: 80,
                     
            //           ),
      
      
      
            Container(

        width: double.infinity,
         child: Column(
          
          mainAxisAlignment:MainAxisAlignment.center ,
       
          children: [
      
        SizedBox(
          height: 150,
        ),
            ElevatedButton(
              child: Text(
                "Login",
                style: TextStyle(fontSize: 23),
              ),
            
              onPressed: () {
      
                   Navigator.pushNamed(context ,'/login') ;
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purple[500]),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35))),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 10, horizontal: 109)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              child: Text(
                "Signup",
                style: TextStyle(fontSize: 23),
              ),
              onPressed: () {
      
      
                 Navigator.pushNamed(context ,'/signup') ;
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purple[200]),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35))),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 10, horizontal: 109)),
              ),
            ),
  
          ],
             ),
             
       ),
       
      
        ],
        
      ),
          floatingActionButton: FloatingActionButton(
          child: Icon(Icons.qr_code_scanner,),
          onPressed: () {
            
            Navigator.pushNamed(context, '/scanner');
          }),
      
      
     
    );
    
  }
}
