import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  final String scannedData;
  final String scannedPrice;
  const MainPage({Key? key, required this.scannedData , required this.scannedPrice }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple, // Set app bar color to purple
        title: Text(
          "scan item",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w400, fontFamily: "Schyler"),
        ),
        centerTitle: true,
      ),
      body:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20.0),

            Container(
              padding: EdgeInsets.all(25.0),
              margin: EdgeInsets.only(top: 10.0),
              decoration: BoxDecoration(
                color: Colors.purple[100],
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Article :',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily:'Lemon' // Change font family
                        ),
                      ),
                      Text(
                        'Prix :',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Arial', // Change font family
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0), // Add space between the rows
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        scannedData,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Arial', // Change font family
                          fontWeight: FontWeight.bold, // Example: bold font weight
                        ),
                      ),
                      Text(
                        scannedPrice,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Arial', // Change font family
                          fontWeight: FontWeight.bold, // Example: bold font weight
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add bottom bar button logic here
          // This onPressed function will be triggered when the floating action button is pressed
          // Replace with your button logic
          Navigator.pushNamed(context, '/scanner');
        },
        child: Icon(
          Icons.qr_code_scanner,
        ), // Change icon or use a custom widget as per your requirement
        backgroundColor: Colors.purple, // Set FAB color to purple
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60.0, // Adjust the height as needed
        ),
      ),
    );
  }

  
}
