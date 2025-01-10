import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom/screens/categoryscreen.dart';
import 'package:ecom/utils/seachbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/imagepicker.dart';
import '../utils/api_widgets.dart';
import 'historyscreen.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {

  final Products products = Products();

    onexit()
   {
     showDialog(context: context, builder: (cnx){
       return AlertDialog(
         content:Text("do you want to exit") ,
         actions: [

           Row(
             children: [
               GestureDetector(
                   onTap: (){
                     SystemNavigator.pop();
                   },
                   child: Text("YES")),
               GestureDetector(
                   onTap: (){
                     Navigator.of(context).pop();
                   },
                   child: Text("no")),
             ],
           ),


         ],
       );
     });

  }
  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: ()=>onexit(),
      child: SafeArea(
          child: Scaffold(
            appBar:  AppBar(
              title: Text(
                'Home',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.green.withOpacity(0.5),
              actions: [
                IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {

                  },
                ),
              ],
              elevation: 10.0, // Shadow effect
              centerTitle: true,
            ),drawer:
          Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [

                UserAccountsDrawerHeader(
                  accountName: Text('John Doe'),
                  accountEmail: Text('johndoe@example.com'),
                  currentAccountPicture: ImagePer(),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.greenAccent,Colors.green.withOpacity(0.3)],
                    ),
                  ),
                ),

                // Drawer Items
                ListTile(
                  leading: Icon(Icons.home, color: Colors.blueAccent),
                  title: Text('Home'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>homescreen()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.category, color: Colors.orange),
                  title: Text('Categories'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryScreen()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.shopping_bag, color: Colors.green),
                  title: Text('Orders'),
                  onTap: () {

                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>orderscreen()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.person, color: Colors.purple),
                  title: Text('Profile'),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings, color: Colors.grey),
                  title: Text('Settings'),
                  onTap: () {

                             },
                ),

                Divider(
                  color: Colors.green,
                ),


                ListTile(
                  leading: Icon(Icons.logout, color: Colors.red),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  onTap: () {
                    SystemNavigator.pop();
                  },
                ),
              ],
            ),
          ),




            body: SingleChildScrollView(
              child: Column(
                children: [
                 GestureDetector(
                   onTap:(){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchProductsPage() ));
            } ,
                   child: Padding(
                     padding: const EdgeInsets.all(5.0),
                     child: Container(
                       decoration: BoxDecoration(
                         color: Colors.green.withOpacity(0.5),
                         borderRadius: BorderRadius.circular(20)
                       ),

                       height: 50,
                       child: Padding(
                         padding: const EdgeInsets.all(10.0),
                         child: Row(
                           children: [
                             Text("seach",style: TextStyle(fontSize: 20,wordSpacing:5),),
                             Spacer(),
                             Icon(Icons.search)
                           ],
                         ),
                       ),
                     ),
                   ),
                 ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      height: 100,
                      child: Card(
                        elevation: 5,
                        color: Colors.green.withOpacity(0.4),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: CircleAvatar(
                                backgroundImage: AssetImage('images/leafimage.png'),
                                radius: 35,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "What is natural is never flawed\n",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.brown,
                                    ),
                                  ),
                                  WidgetSpan(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: const Offset(3, 3),
                                            ),
                                          ],
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Text(
                                              "From little seeds grow mighty trees",
                                              style: TextStyle(fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)
                        ),

                        child: CarouselSlider.builder(itemCount: products.productData.length, itemBuilder:(context,index,int){
                          final item=products.productData[index];
                          return Container(
                            child: ClipRRect(
                                borderRadius:BorderRadius.circular(10),
                                child: Image(image:AssetImage(item['image']),fit: BoxFit.cover,)),
                          );
                        }, options:CarouselOptions(

                            autoPlayInterval: Duration(microseconds: 1 ), // Set the interval to 5 seconds
                            autoPlayAnimationDuration: Duration(milliseconds: 700), // Animation duration
                            autoPlayCurve: Curves.easeInOut,
                            enlargeCenterPage: true,
                            viewportFraction: 0.2,
                            autoPlay: true


                        ))
                    ),
                  ),






                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3, // Constraint ListView height
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: products.productData.length,
                        itemBuilder: (context, index) {
                          return ProductCard(product: products.productData[index]);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3, // Constraint ListView height
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: products.productData.length,
                        itemBuilder: (context, index) {
                          return ProductCard(product: products.productData[index]);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
