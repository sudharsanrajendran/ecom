import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom/main.dart';
import 'package:ecom/screens/Home.dart';
import 'package:flutter/material.dart';


class Orderscreen extends StatefulWidget {
  const Orderscreen({super.key, required this.product});
  final Map<String, dynamic> product;

  @override
  State<Orderscreen> createState() => _OrderscreenState();
}

class _OrderscreenState extends State<Orderscreen> {
FirebaseFirestore firestore =FirebaseFirestore.instance;
  void showMyDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(16.0), // Padding inside the dialog
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Rounded corners for a better look
          ),
          content: Container(
            width: 200, // Set the width of the dialog
            height: 150, // Set the height of the dialog
            child: Column(
              mainAxisSize: MainAxisSize.min, // Ensure content fits naturally
              children: [
                Text(
                  "Order Placed",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text("Your Order Details"),
                SizedBox(height: 10),
                Text(
                  'Total Price: \$${price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BottomNav()));
                },
                child: Text(
                  "OK",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        );
      },
    );
  }



Future<void> adddata() async {
  CollectionReference userorders = firestore.collection('Orders');
try{
  await userorders.add({
    'image': widget.product['image'],
    'price': price,
    'title': widget.product['title'],
    'count': count,
    'total_price': price * count, // Assuming you want to store total price for the order
    'order_date': FieldValue.serverTimestamp(), // Optionally, store the order time
  });
  showMyDialog();
}catch(e){
  ScaffoldMessenger.of(context).showSnackBar(

    SnackBar(content: Text('datacant store: $e'),backgroundColor:Colors.red ,),
  );
}
}


  int count = 0;
  double price = 0.0;

  void addCard() {
    setState(() {
      count++;
      priceIncrement(widget.product);
    });
  }

  void deleteCard() {
    if (count > 0) {
      setState(() {
        count--;
        priceDecrement(widget.product);
      });
    }
  }

  void priceIncrement(Map<String, dynamic> product) {
    if (product['price'] != null && product['price'] is double) {
      price += product['price']; // Adds the product's price to the total price
    } else {
      print('Invalid price value');
    }
  }

  void priceDecrement(Map<String, dynamic> product) {
    if (product['price'] != null && product['price'] is double) {
      price -= product['price']; // Subtracts the product's price from the total price
    } else {
      print('Invalid price value');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Order Screen'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0), // Add padding to the container
        child: Column(
          children: [
            // Image of the product
            Center(
              child: Image.asset(widget.product['image'], height: 200, width: 200),
            ),
            SizedBox(height: 20),

            Center(
              child: Card( color: Colors.grey.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [



                      Text(
                        widget.product['title'],
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      SizedBox(height: 8),

                      // Price of the product
                      Text(
                        'Price: \$${widget.product['price']}',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.green),
                      ),
                      SizedBox(height: 16),

                      // Description of the product
                      Text('Description:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black54)),
                      Text(widget.product['description'], style: TextStyle(fontSize: 14, color: Colors.black87)),
                      SizedBox(height: 16),

                      // Category of the product
                      Text('Category:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black54)),
                      Text(widget.product['category'], style: TextStyle(fontSize: 14, color: Colors.black87)),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),


            // Row with the add and remove buttons for cart count
            Center(
              child: Container(
                width: 200,
                child: Card(
                  color: Colors.grey.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: addCard,
                          child: Text("+", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                        Spacer(),
                        Text("$count", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Spacer(),
                        TextButton(
                          onPressed: deleteCard,
                          child: Text("-", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),

            Center(
              child: Text(
                'Total Price: \$${price.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent),
              ),
            ),
            SizedBox(height: 20),

            GestureDetector(
              onTap: (){
                if(count==0){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('please add the count of order'),backgroundColor:Colors.red ,),
                  );
                }else{
                  adddata();
                }


              },
              child: Center(
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      border: Border.all(color: Colors.green),borderRadius: BorderRadius.circular(8)),
                  child: Center(child: Text("Place Order")),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

