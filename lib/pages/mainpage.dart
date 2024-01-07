import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final List<String> initialData;
  const MainPage({Key? key, required this.initialData}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<String> dataList = [];
  @override
  void initState() {
    super.initState();
    dataList.addAll(widget.initialData);
  }
  void update(String newData) {
    setState(() {
      dataList.add(newData);
    });
  }

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
      body: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(dataList[index]),
          );
        },
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
