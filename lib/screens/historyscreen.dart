import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom/screens/Home.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class orderscreen extends StatefulWidget {
  @override
  _orderscreenState createState() => _orderscreenState();
}

class _orderscreenState extends State<orderscreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>BottomNav()));
            },
            child: Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.green.withOpacity(0.4),
        title: Text('Order History'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('Orders').snapshots(),
        builder: (context, snapshot) {
          // Check if the data is still being fetched or if there's an error
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No Orders Found'));
          }

          // Get the order data from Firestore
          var orders = snapshot.data!.docs;

          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              // Map each order document to a widget
              var order = orders[index];
              return Card(
                margin: EdgeInsets.all(8),
                child: ListTile(
                  contentPadding: EdgeInsets.all(12),
                  leading: Image.asset(order['image'], width: 50, height: 50), // Display product image
                  title: Text(order['title'], style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Price: \$${order['price']}'),
                      Text('Count: ${order['count']}'),
                      Text('Total: \$${order['total_price']}'),
                      Text('Order Date: ${order['order_date'].toDate()}'), // Format date if needed
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

