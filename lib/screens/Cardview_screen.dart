import 'package:ecom/screens/Orderscreen.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class CardView extends StatelessWidget {
  const CardView({super.key, required this.product});

  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>BottomNav()));
              },
              child: Icon(Icons.arrow_back_ios)),
          backgroundColor: Colors.green.withOpacity(0.4),
          title: Text('Order History'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image of the product
                  Center(
                    child: Container(
                      height: 200,
                      child: Expanded(child: Image.asset(product['image'])),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Title of the product
                  Center(
                    child: Card(
                      color: Colors.grey.shade100,
                      elevation: 20,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              product['title'],
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 8),

                            // Price of the product
                            Text(
                              'Price: \$${product['price']}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(height: 16),

                            // Description of the product
                            Text(
                              'Description:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                            Text(
                              product['description'],
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 16),

                            // Category of the product
                            Text(
                              'Category:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                            Text(
                              product['category'],
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 16),

                            // Rating of the product
                            Text(
                              'Rating:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                            Text(
                              '${product['rating']} ⭐ (${product['ratingCount']} reviews)',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 16),

                            // Warranty Information
                            Text(
                              'Warranty:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                            Text(
                              product['warrantyInformation'],
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 16),

                            // Shipping Information
                            Text(
                              'Shipping:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                            Text(
                              product['shippingInformation'],
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 16),

                            // Availability Status
                            Text(
                              'Availability:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                            Text(
                              product['availabilityStatus'],
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 24),


                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: GestureDetector(
                      onTap: ()
                     {

                       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Orderscreen(product: {
                         "title": product['title'],
                         "description": product['description'],
                         "category": product['category'],
                         "price": product['price'],
                         "discountPercentage":product['discountPercentage'],
                         "rating": product['rating'],  // Separate rating field
                         "ratingCount": product['ratingCount'],  // Separate count field for ratings
                         "image": product['image'],
                         "warrantyInformation": product['warrantyInformation'],
                         "shippingInformation": product['shippingInformation'],
                         "availabilityStatus": product['availabilityStatus']
                       },

                       )));

                     },
                      child: Center(
                        child: Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                              color: Colors.green.shade50,
                              border: Border.all(color: Colors.green),borderRadius: BorderRadius.circular(8)),
                          child: Center(child: Text("Add Cart",style: TextStyle(fontWeight: FontWeight.bold),)),),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


