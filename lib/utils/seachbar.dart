import 'package:ecom/screens/Orderscreen.dart';
import 'package:ecom/utils/api_widgets.dart';
import 'package:flutter/material.dart';

import '../screens/Cardview_screen.dart';



class SearchProductsPage extends StatefulWidget {
  const SearchProductsPage({Key? key}) : super(key: key);

  @override
  State<SearchProductsPage> createState() => _SearchProductsPageState();
}

class _SearchProductsPageState extends State<SearchProductsPage> {
  final Products products = Products();
  String searchQuery = '';
  List<dynamic> searchResults = [];

  void search(String query) {
    setState(() {
      searchQuery = query;
      if (query.isEmpty) {
        searchResults = [];
      } else {
        searchResults = products.productData
            .where((product) =>
            product["title"].toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            children: [
              TextField(
                onChanged: search,
                decoration: InputDecoration(
                  hintText: 'Search products...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  filled: true,
                  fillColor: Colors.green.withOpacity(0.5)
                ),
              ),
              const SizedBox(height: 16.0),
              if (searchResults.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      final product = searchResults[index];
                      return GestureDetector(
                        onTap: (){


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
                          },

                          )));

                        },
                        child: Card(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            leading: Image.asset(
                              product["image"],
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            title: Text(product["title"]),
                            subtitle: Text(product["description"]),
                            trailing: Text('\$${product["price"].toStringAsFixed(2)}'),
                          ),
                        ),
                      );
                    },
                  ),
                )
              else if (searchQuery.isNotEmpty)
                const Text(
                  'No results found.',
                  style: TextStyle(color: Colors.grey),
                ),
            ],
          ),
        ),
      ),
    );
  }
}


