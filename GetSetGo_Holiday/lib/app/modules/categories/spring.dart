import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../detail/category_details/springdetail/springdetail.dart';
class SpringPage extends StatelessWidget {
  const SpringPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFB596E5),
        title: Text('GetSetGo-Holiday'),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Center(
              child: Text(
                'Spring Lists',
                style: TextStyle(
                  color: Color(0xFF833BAA),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SpringDetail()),
              );
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(400, 100),
              primary: Color(0xFFB596E5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text('Have a picnic',
                style: TextStyle(
                  fontSize: 20
                ),
             ),
          ),
        ],
      ),
    );
  }
}

