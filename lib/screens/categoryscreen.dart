import 'package:ecom/screens/Home.dart';
import 'package:ecom/utils/api_widgets.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  Products prducts = Products();

  List<String> categories = [
    "fashion",
    "accessories",
    "beauty",
    "home",
    "home improvement",
    "stationery",
    "business",
    "gardening",
  ];

  // The list of products you have, as provided in the productData


  String selectedCategory = 'fashion'; // Default category

  @override
  Widget build(BuildContext context) {
    // Filter products based on selected category
    List<dynamic> filteredProducts = prducts.productData
        .where((product) => product['category'] == selectedCategory)
        .toList();

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>BottomNav()));
            },
            child: Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.green.withOpacity(0.5),
        title: Text('Categories'),
      ),
      body: Column(
        children: [
          // Category selection dropdown
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: selectedCategory,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue!;
                });
              },
              items: categories.map<DropdownMenuItem<String>>((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
            ),
          ),

          // Display products based on selected category
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                var product = filteredProducts[index];
                return Card(
                  child: Column(
                    children: [
                      Image.asset(product['image'], height: 100, width: 100),
                      Text(product['title']),
                      Text('\$${product['price']}'),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
