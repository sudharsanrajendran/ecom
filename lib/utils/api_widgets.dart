import 'package:ecom/screens/Cardview_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Products {
  List productData = [
    {
      "id": 1,
      "title": "Bags",
      "description": "A stylish and eco-friendly bag perfect for everyday use.",
      "category": "fashion",
      "price": 109.95,
      "discountPercentage": 5.0,
      "rating": 3.9,
      "ratingCount": 120,
      "image": "images/bags-removebg-preview.png",
      "warrantyInformation": "1 year warranty",
      "shippingInformation": "Ships in 2-3 business days",
      "availabilityStatus": "In Stock",
    },
    {
      "id": 2,
      "title": "Bottle",
      "description": "A durable and insulated water bottle to keep your drinks cold or hot.",
      "category": "accessories",
      "price": 22.3,
      "discountPercentage": 10.0,
      "rating": 4.1,
      "ratingCount": 259,
      "image": "images/bottleimage-removebg-preview.png",
      "warrantyInformation": "6 months warranty",
      "shippingInformation": "Ships in 1-2 business days",
      "availabilityStatus": "Low Stock",
    },
    {
      "id": 3,
      "title": "Brush",
      "description": "A soft and high-quality brush for personal use or gifting.",
      "category": "beauty",
      "price": 55.99,
      "discountPercentage": 15.0,
      "rating": 4.7,
      "ratingCount": 500,
      "image": "images/brush-removebg-preview.png",
      "warrantyInformation": "1 year warranty",
      "shippingInformation": "Ships in 3-5 business days",
      "availabilityStatus": "In Stock",
    },
    {
      "id": 4,
      "title": "MensFit Shirt",
      "description": "A sleek and comfortable slim-fit shirt for casual occasions.",
      "category": "fashion",
      "price": 15.99,
      "discountPercentage": 8.0,
      "rating": 2.1,
      "ratingCount": 430,
      "image": "images/cloths-removebg-preview.png",
      "warrantyInformation": "No warranty",
      "shippingInformation": "Ships in 3 business days",
      "availabilityStatus": "In Stock",
    },
    {
      "id": 5,
      "title": "Furniture",
      "description": "A collection of stylish furniture to elevate your home.",
      "category": "home",
      "price": 695,
      "discountPercentage": 12.0,
      "rating": 4.6,
      "ratingCount": 400,
      "image": "images/fernitures-removebg-preview.png",
      "warrantyInformation": "2 years warranty",
      "shippingInformation": "Ships in 7-10 business days",
      "availabilityStatus": "In Stock",
    },
    {
      "id": 6,
      "title": "Home Essentials",
      "description": "Quality home essentials for a comfortable living.",
      "category": "home",
      "price": 168,
      "discountPercentage": 5.5,
      "rating": 3.9,
      "ratingCount": 70,
      "image": "images/homethings-removebg-preview.png",
      "warrantyInformation": "1 year warranty",
      "shippingInformation": "Ships in 4-6 business days",
      "availabilityStatus": "Low Stock",
    },
    {
      "id": 7,
      "title": "Paints",
      "description": "Vibrant and long-lasting paints for all your creative needs.",
      "category": "home improvement",
      "price": 9.99,
      "discountPercentage": 6.5,
      "rating": 3,
      "ratingCount": 400,
      "image": "images/paints-removebg-preview.png",
      "warrantyInformation": "1 year warranty",
      "shippingInformation": "Ships in 2-4 business days",
      "availabilityStatus": "In Stock",
    },
    {
      "id": 8,
      "title": "Paper Notes",
      "description": "High-quality paper notes for everyday use.",
      "category": "stationery",
      "price": 10.99,
      "discountPercentage": 3.0,
      "rating": 1.9,
      "ratingCount": 100,
      "image": "images/papernotes-removebg-preview.png",
      "warrantyInformation": "No warranty",
      "shippingInformation": "Ships in 1-2 business days",
      "availabilityStatus": "In Stock",
    },
    {
      "id": 9,
      "title": "Plates",
      "description": "Stylish and durable plates perfect for any dining setting.",
      "category": "home",
      "price": 64,
      "discountPercentage": 7.0,
      "rating": 3.3,
      "ratingCount": 203,
      "image": "images/plates-removebg-preview.png",
      "warrantyInformation": "1 year warranty",
      "shippingInformation": "Ships in 3-5 business days",
      "availabilityStatus": "In Stock",
    },
    {
      "id": 10,
      "title": "Shop Supplies",
      "description": "A curated collection of items for your shop or business.",
      "category": "business",
      "price": 109,
      "discountPercentage": 10.0,
      "rating": 2.9,
      "ratingCount": 470,
      "image": "images/shops-removebg-preview.png",
      "warrantyInformation": "No warranty",
      "shippingInformation": "Ships in 2 business days",
      "availabilityStatus": "In Stock",
    },
    {
      "id": 11,
      "title": "Beauty Product",
      "description": "A refreshing face product to keep your skin healthy.",
      "category": "gardening",
      "price": 109,
      "discountPercentage": 12.5,
      "rating": 4.8,
      "ratingCount": 319,
      "image": "images/skinproducts-removebg-preview.png",
      "warrantyInformation": "6 months warranty",
      "shippingInformation": "Ships in 2-4 business days",
      "availabilityStatus": "Low Stock",
    },
    {
      "id": 12,
      "title": "Plant Spray",
      "description": "A nourishing plant spray that helps plants grow.",
      "category": "gardening",
      "price": 114,
      "discountPercentage": 10.0,
      "rating": 4.8,
      "ratingCount": 400,
      "image": "images/wahsingspray-removebg-preview.png",
      "warrantyInformation": "1 year warranty",
      "shippingInformation": "Ships in 3-5 business days",
      "availabilityStatus": "In Stock",
    },
  ];
}


class ProductCard extends StatelessWidget {
  final Map product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      elevation: 10,
      child: Column(
        children: [
          Expanded(child: Image.asset(product['image'])),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['title'],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text('Price: \$${product['price']}'),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    SizedBox(width: 4),
                    Text('${product['rating']}')
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: GestureDetector(
              onTap: ()
              {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CardView(product: {
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
                })));
              },
              child: Container(
                height: 30,
                width: 100,
              decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  border: Border.all(color: Colors.green),borderRadius: BorderRadius.circular(8)),
              child: Center(child: Text("Add Cart")),),
            ),
          )
        ],
      ),
    );
  }
}




